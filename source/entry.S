/*****************************************************************
*	entry.s
*	by Zhiyi Huang, hzy@cs.otago.ac.nz
*	University of Otago
*
********************************************************************/

.section .init, "ax"
.globl _start
_start:
	b boot_reset
	b boot_sleep	// undefined
	b boot_sleep	// svc
	b boot_sleep	// prefetch
	b boot_sleep	// abort
	b boot_sleep	// hypervisor
	b boot_sleep	// irq
	b boot_sleep	// fiq

	.balign 4
boot_sleep:
	wfe
	b boot_sleep

boot_reset:
	// Switch to SVC mode, all interrupts disabled
	.set PSR_MODE_SVC, 0x13
	.set PSR_MODE_IRQ_DISABLED, (1<<7)
	.set PSR_MODE_FIQ_DISABLED, (1<<6)
	msr	cpsr_c, #(PSR_MODE_SVC + PSR_MODE_FIQ_DISABLED + PSR_MODE_IRQ_DISABLED)

	// Disable caches, MMU, and flow prediction
	mrc	p15, 0, r0, c1, c0, 0
	bic	r0, r0, #(0x1 << 12)	// Disable instruction cache
	bic	r0, r0, #(0x1 << 11)	// Disable flow prediction
	bic	r0, r0, #(0x1 <<  2)	// Disable data cache
	bic	r0, r0, #0x1			// Disable MMU
	mcr	p15, 0, r0, c1, c0, 0

	// Enable ACTLR.SMP bit
	mrc	p15, 0, r0, c1, c0, 1
	orr	r0, r0, #(1 << 6)
	mcr	p15, 0, r0, c1, c0, 1

	// Invalidate TLB and branch prediction caches.
	mov	r0,#0
	mcr	p15, 0, r0, c8, c7, 0	// Invalidate unified TLB
	mcr	p15, 0, r0, c7, c5, 6	// Invalidate BPIALL

	// Update ARM vector address (early binding for debug)
	ldr	r0, =_start
	mcr	p15, 0, r0, c12, c0, 0	// VBAR

	// Cache invalidation for older Cortex-A
	// Note: Cortex-A7 (RPI2) does not need this part.
	// Invalidate l1 instruction cache
	mrc p15, 1, r0, c0, c0, 1
	tst r0, #0x3
	mov r0, #0
	mcrne p15, 0, r0, c7, c5, 0

	// Invalidate data/unified caches
	mrc p15, 1, r0, c0, c0, 1
	ands r3, r0, #0x07000000
	mov r3, r3, lsr #23
	beq finished

	mov r10, #0
loop1:
	add r2, r10, r10, lsr #1
	mov r1, r0, lsr r2
	and r1, r1, #7
	cmp r1, #2
	blt skip

	mcr p15, 2, r10, c0, c0, 0
	isb
	mrc p15, 1, r1, c0, c0, 0
	and r2, r1, #7
	add r2, r2, #4
	ldr r4, =0x3ff
	ands r4, r4, r1, lsr #3
	clz r5, r4
	ldr r7, =0x7fff
	ands r7, r7, r1, lsr #13
loop2:
	mov r9, r4

loop3:
	orr r11, r10, r9, lsl r5
	orr r11, r11, r7, lsl r2
	mcr p15, 0, r11, c7, c6,2
	subs r9, r9, #1
	bge loop3
	subs r7, r7, #1
	bge loop2

skip:
	add r10, r10, #2
	cmp r3, r10
	bgt loop1
finished:

	// MMU configurations
	// Activate TTBR0 by TTBCR reg
	mov	r0,#0x0
	mcr	p15, 0, r0, c2, c0, 2

	// Set master translation table address (TTBR0)
	ldr	r0,=K_PDX_BASE
	mov	r1, #0x08
	orr	r1,r1,#0x40
	orr	r0,r0,r1
	mcr	p15, 0, r0, c2, c0, 0

	// Set depricated ARM domains
	mrc	p15, 0, r0, c3, c0, 0
	ldr	r0, =0x55555555
	mcr	p15, 0, r0, c3, c0, 0

	// Set all CPUs to wait except the primary CPU
	mrc p15, 0, r0, c0, c0, 5
	ands r0, r0, #0x03
	wfene
	bne mp_continue

	// MMU Phase 1
	// Create master translation table (page directory index)
mmu_phase1:

	ldr	r0,=K_PDX_BASE
	ldr	r1,=0xfff
	ldr	r2,=0

pagetable_invalidate:
	str	r2, [r0, r1, lsl#2]
	subs r1, r1, #1
	bpl	pagetable_invalidate

	// Page table attribute
	// 0x14406= 0b0010 100 01 0 0000 0 01 10
	// 0x14c06= 0b0010 100 11 0 0000 0 01 10
	// 0x15c06= 0b0010 101 11 0 0000 0 01 10
	//            ZGSA-TEX-AP-I-DOMN-X-CB-10

	//ldr	r2,=0x14c06		//Inner cache
	//ldr	r2,=0x15c06 	//Outer cache
	ldr	r2,=0x14406

	// Map __pa_init_start to __pa_init_start address
	ldr	r1,=PHYSTART
	lsr	r1, #20
	orr	r3, r2, r1, lsl#20
	str	r3, [r0, r1, lsl#2]

	// Map __va_kernel_start to __pa_init_start address
	ldr	r1,=PHYSTART
	lsr	r1, #20
	orr	r3, r2, r1, lsl#20
	ldr	r1,=KERNBASE
	lsr	r1, #20
	str	r3, [r0, r1, lsl#2]

	// Map device MMIO (just GPIO for LED debug)
	ldr	r2,=0xc16	//device template
	ldr	r1,=(MMIO_PA+0x200000)
	lsr	r1, #20
	orr	r3, r2, r1, lsl#20
	ldr	r1,=(MMIO_VA+0x200000)
	lsr	r1, #20
	str	r3, [r0, r1, lsl#2]

	// All processors will start from here after waiting:
mp_continue:
	ldr sp, =(KERNBASE+0x3000)
	// Enable I/D$, MMU, and flow prediction.
	dsb
	ldr r1,=_pagingstart
	mrc	p15, 0, r0, c1, c0, 0
	orr r0, r0,	#(0x1 << 13)		// High vector
	//orr	r0, r0, #(0x1 << 12)	// Enable I$
	//orr	r0, r0, #(0x1 << 11)	// Enable flow prediction
	//orr	r0, r0, #(0x1 <<  2)	// Enable D$
	orr	r0, r0, #0x1				// Enable MMU
	mcr	p15, 0, r0, c1, c0, 0
	bx r1

	.section .text
.global _pagingstart
_pagingstart:
	bl cmain  /* call C functions now */
	bl NotOkLoop

.global acknowledge
acknowledge:
	//Turn on the LED
	ldr r2,=MMIO_VA
	add r2,r2,#0x200000
	//Function select
	mov r3,#1

	#ifdef RPI1
	lsl r3,#18			//Pi1 ACT LED: GPIO#16 (GPFSEL1)
	str r3,[r2,#0x4]
	mov r3,#1
	lsl r3,#16
	str r3,[r2,#0x28]	//Pi1 (GPCLR0)
	#endif

	#ifdef RPI2
	lsl r3,#21			//Pi2 ACT LED: GPIO#47 (GPFSEL4)
	str r3,[r2,#0x10]
	mov r3,#1
	lsl r3,#15
	str r3,[r2,#0x20] //Pi2 (GPSET1)
	#endif

	bx lr

.global dsb_barrier
dsb_barrier:
	#ifdef RPI1
	mov r0, #0
	mcr p15, 0, r0, c7, c10, 4
	#else
	dsb
	isb
	#endif
	bx lr
.global flush_dcache_all
flush_dcache_all:
	#ifdef RPI1
	mov r0, #0
	mcr p15, 0, r0, c7, c10, 4 /* dsb */
	mov r0, #0
	mcr p15, 0, r0, c7, c14, 0 /* invalidate d-cache */
	#else
	dsb
	isb
	#endif
	bx lr
.global flush_idcache
flush_idcache:
	#ifdef RPI1
	mov r0, #0
	mcr p15, 0, r0, c7, c10, 4 /* dsb */
	mov r0, #0
	mcr p15, 0, r0, c7, c14, 0 /* invalidate d-cache */
	mov r0, #0
	mcr p15, 0, r0, c7, c5, 0 /* invalidate i-cache */
	#else
	dsb
	isb
	#endif
	bx lr
.global flush_tlb
flush_tlb:
	#ifdef RPI1
	mov r0, #0
	mcr p15, 0, r0, c8, c7, 0
	mcr p15, 0, r0, c7, c10, 4
	#else
	dsb
	isb
	mov	r0,#0
	mcr	p15, 0, r0, c8, c7, 0	// Invalidate unified TLB
	mcr	p15, 0, r0, c7, c5, 6	// Invalidate BPIALL
	dsb
	isb
	#endif
	bx lr
.global flush_dcache /* flush a range of data cache flush_dcache(va1, va2) */
flush_dcache:
	#ifdef RPI1
	mcrr p15, 0, r0, r1, c14
	#else
	dsb
	isb
	#endif
	bx lr

.global set_pgtbase /* set the page table base set_pgtbase(base) */
set_pgtbase:
	mcr p15, 0, r0, c2, c0
	bx lr

.global getsystemtime
getsystemtime:
	ldr r0, =(MMIO_VA+0x003004) /* addr of the time-stamp lower 32 bits */
	ldrd r0, r1, [r0]
	bx lr

.section .data

.align 4
.globl font
font:
	.incbin "font1.bin"

.align 4
.global _binary_initcode_start
_binary_initcode_start:
	.incbin "initcode"
.global _binary_initcode_end
_binary_initcode_end:

.align 4
.global _binary_fs_img_start
_binary_fs_img_start:
        .incbin "fs.img"
.global _binary_fs_img_end
_binary_fs_img_end:
