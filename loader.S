/*
 * loader.S
 *
 *  Created on: Feb 11, 2017
 *      Author: Mahdi Amiri
 */

	.text
	.globl _start
_start:
	b loader_start  /* branch to the code */
	b loader_sleep	// undefined
	b loader_sleep	// svc
	b loader_sleep	// prefetch
	b loader_sleep	// abort
	b loader_sleep	// hypervisor
	b loader_sleep	// irq
	b loader_sleep	// fiq

	.balign 4
loader_sleep:
	wfi
	b loader_sleep

loader_start:
	// Switch to SVC mode, all interrupts disabled
	.set PSR_MODE_SVC, 0x13
	.set PSR_MODE_IRQ_DISABLED, (1<<7)
	.set PSR_MODE_FIQ_DISABLED, (1<<6)
	msr	cpsr_c, #(PSR_MODE_SVC + PSR_MODE_FIQ_DISABLED + PSR_MODE_IRQ_DISABLED)

	// Set all CPUs to wait except the primary CPU
	mrc p15, 0, r0, c0, c0, 5
	ands r0, r0, #0x03
	bne loader_sleep

	mov pc, #0x8000

	.data
	.align 4
_data_start:
	.incbin "kernel7.bin"
_data_end:
