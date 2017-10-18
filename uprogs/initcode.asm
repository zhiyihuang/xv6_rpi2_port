
initcode.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <start>:


# exec(init, argv)
.globl start
start:
  push {lr}
   0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
  ldr r0, =argv
   4:	e59f003c 	ldr	r0, [pc, #60]	; 48 <argv+0x8>
  push {r0}
   8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
  ldr r0, =init
   c:	e59f0038 	ldr	r0, [pc, #56]	; 4c <argv+0xc>
  push {r0}
  10:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
  mov r0, #SYS_exec
  14:	e3a00007 	mov	r0, #7
  swi #T_SYSCALL
  18:	ef000040 	svc	0x00000040
  pop {lr}
  1c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
  pop {lr}
  20:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
  pop {lr}
  24:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
  bx lr
  28:	e12fff1e 	bx	lr

0000002c <exit>:

# for(;;) exit();
exit:
  mov r11, #SYS_exit
  2c:	e3a0b002 	mov	fp, #2
  swi #T_SYSCALL
  30:	ef000040 	svc	0x00000040
  bl exit
  34:	ebfffffc 	bl	2c <exit>

00000038 <init>:
  38:	696e692f 	.word	0x696e692f
  3c:	0074      	.short	0x0074
	...

00000040 <argv>:
  40:	00000038 	.word	0x00000038
  44:	00000000 	.word	0x00000000

# exec(init, argv)
.globl start
start:
  push {lr}
  ldr r0, =argv
  48:	00000040 	.word	0x00000040
  push {r0}
  ldr r0, =init
  4c:	00000038 	.word	0x00000038
