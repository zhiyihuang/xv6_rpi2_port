
_zombie:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	e92d4800 	push	{fp, lr}
   4:	e28db004 	add	fp, sp, #4
  if(fork() > 0){
   8:	eb0000ae 	bl	2c8 <fork>
   c:	e3500000 	cmp	r0, #0
  10:	da000006 	ble	30 <main+0x30>
    sleep(5);  // Let child exit before parent.
  14:	e3a00005 	mov	r0, #5
  18:	eb0001a1 	bl	6a4 <sleep>
    printf(2, "Parent exits!\n");
  1c:	e3001b44 	movw	r1, #2884	; 0xb44
  20:	e3401000 	movt	r1, #0
  24:	e3a00002 	mov	r0, #2
  28:	eb0001fe 	bl	828 <printf>
    exit();
  2c:	eb0000b2 	bl	2fc <exit>
  }
  printf(2, "Child exits!\n");
  30:	e3001b54 	movw	r1, #2900	; 0xb54
  34:	e3a00002 	mov	r0, #2
  38:	e3401000 	movt	r1, #0
  3c:	eb0001f9 	bl	828 <printf>
  exit();
  40:	eb0000ad 	bl	2fc <exit>

00000044 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  44:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  48:	e2402001 	sub	r2, r0, #1
  4c:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  50:	e4d13001 	ldrb	r3, [r1], #1
  54:	e3530000 	cmp	r3, #0
  58:	e5e23001 	strb	r3, [r2, #1]!
  5c:	1afffffb 	bne	50 <strcpy+0xc>
    ;
  return os;
}
  60:	e24bd000 	sub	sp, fp, #0
  64:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  68:	e12fff1e 	bx	lr

0000006c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  6c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  70:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  74:	e5d03000 	ldrb	r3, [r0]
  78:	e3530000 	cmp	r3, #0
  7c:	05d10000 	ldrbeq	r0, [r1]
  80:	0a00000a 	beq	b0 <strcmp+0x44>
  84:	e5d12000 	ldrb	r2, [r1]
  88:	e1530002 	cmp	r3, r2
  8c:	0a000003 	beq	a0 <strcmp+0x34>
  90:	ea00000a 	b	c0 <strcmp+0x54>
  94:	e5f12001 	ldrb	r2, [r1, #1]!
  98:	e1530002 	cmp	r3, r2
  9c:	1a000007 	bne	c0 <strcmp+0x54>
  a0:	e5f03001 	ldrb	r3, [r0, #1]!
  a4:	e3530000 	cmp	r3, #0
  a8:	1afffff9 	bne	94 <strcmp+0x28>
  ac:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  b0:	e0600003 	rsb	r0, r0, r3
  b4:	e24bd000 	sub	sp, fp, #0
  b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  bc:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c0:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  c4:	e0600003 	rsb	r0, r0, r3
  c8:	e24bd000 	sub	sp, fp, #0
  cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  d0:	e12fff1e 	bx	lr

000000d4 <strlen>:

uint
strlen(char *s)
{
  d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  d8:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  dc:	e5d03000 	ldrb	r3, [r0]
  e0:	e3530000 	cmp	r3, #0
  e4:	0a000009 	beq	110 <strlen+0x3c>
  e8:	e1a02000 	mov	r2, r0
  ec:	e3a03000 	mov	r3, #0
  f0:	e5f21001 	ldrb	r1, [r2, #1]!
  f4:	e2833001 	add	r3, r3, #1
  f8:	e3510000 	cmp	r1, #0
  fc:	e1a00003 	mov	r0, r3
 100:	1afffffa 	bne	f0 <strlen+0x1c>
    ;
  return n;
}
 104:	e24bd000 	sub	sp, fp, #0
 108:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 10c:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 110:	e1a00003 	mov	r0, r3
 114:	eafffffa 	b	104 <strlen+0x30>

00000118 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 118:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 11c:	e1a03000 	mov	r3, r0
 120:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 124:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 128:	0a000004 	beq	140 <memset+0x28>
 12c:	e6ef1071 	uxtb	r1, r1
 130:	e0800002 	add	r0, r0, r2
 134:	e4c31001 	strb	r1, [r3], #1
 138:	e1500003 	cmp	r0, r3
 13c:	1afffffc 	bne	134 <memset+0x1c>
  return (void *)p;
}
 140:	e24bd000 	sub	sp, fp, #0
 144:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 148:	e12fff1e 	bx	lr

0000014c <strchr>:

char*
strchr(const char *s, char c)
{
 14c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 150:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 154:	e5d02000 	ldrb	r2, [r0]
 158:	e3520000 	cmp	r2, #0
 15c:	0a00000b 	beq	190 <strchr+0x44>
    if(*s == c)
 160:	e1510002 	cmp	r1, r2
 164:	1a000002 	bne	174 <strchr+0x28>
 168:	ea000005 	b	184 <strchr+0x38>
 16c:	e1530001 	cmp	r3, r1
 170:	0a000003 	beq	184 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 174:	e5f03001 	ldrb	r3, [r0, #1]!
 178:	e3530000 	cmp	r3, #0
 17c:	1afffffa 	bne	16c <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 180:	e1a00003 	mov	r0, r3
}
 184:	e24bd000 	sub	sp, fp, #0
 188:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 18c:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 190:	e1a00002 	mov	r0, r2
 194:	eafffffa 	b	184 <strchr+0x38>

00000198 <gets>:
}

char*
gets(char *buf, int max)
{
 198:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 19c:	e1a08000 	mov	r8, r0
 1a0:	e28db018 	add	fp, sp, #24
 1a4:	e1a07001 	mov	r7, r1
 1a8:	e24dd00c 	sub	sp, sp, #12
 1ac:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b0:	e3a05000 	mov	r5, #0
 1b4:	ea000008 	b	1dc <gets+0x44>
    cc = read(0, &c, 1);
 1b8:	eb000076 	bl	398 <read>
    if(cc < 1)
 1bc:	e3500000 	cmp	r0, #0
 1c0:	da00000b 	ble	1f4 <gets+0x5c>
      break;
    buf[i++] = c;
 1c4:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1c8:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 1cc:	e353000d 	cmp	r3, #13
 1d0:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1d4:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 1d8:	0a000005 	beq	1f4 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1dc:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e0:	e0854002 	add	r4, r5, r2
 1e4:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1e8:	e24b101d 	sub	r1, fp, #29
 1ec:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f0:	bafffff0 	blt	1b8 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f4:	e3a03000 	mov	r3, #0
  return buf;
}
 1f8:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1fc:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 200:	e24bd018 	sub	sp, fp, #24
 204:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
 208:	e92d4830 	push	{r4, r5, fp, lr}
 20c:	e1a04001 	mov	r4, r1
 210:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 214:	e3a01000 	mov	r1, #0
 218:	eb00009f 	bl	49c <open>
  if(fd < 0)
 21c:	e2505000 	subs	r5, r0, #0
 220:	ba000006 	blt	240 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 224:	e1a01004 	mov	r1, r4
 228:	eb0000c2 	bl	538 <fstat>
 22c:	e1a04000 	mov	r4, r0
  close(fd);
 230:	e1a00005 	mov	r0, r5
 234:	eb000071 	bl	400 <close>
  return r;
 238:	e1a00004 	mov	r0, r4
 23c:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 240:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 244:	e8bd8830 	pop	{r4, r5, fp, pc}

00000248 <atoi>:

int
atoi(const char *s)
{
 248:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 24c:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 250:	e5d01000 	ldrb	r1, [r0]
 254:	e2413030 	sub	r3, r1, #48	; 0x30
 258:	e3530009 	cmp	r3, #9
 25c:	e3a03000 	mov	r3, #0
 260:	8a000007 	bhi	284 <atoi+0x3c>
    n = n*10 + *s++ - '0';
 264:	e1a02183 	lsl	r2, r3, #3
 268:	e0823083 	add	r3, r2, r3, lsl #1
 26c:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 270:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 274:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 278:	e2412030 	sub	r2, r1, #48	; 0x30
 27c:	e3520009 	cmp	r2, #9
 280:	9afffff7 	bls	264 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 284:	e1a00003 	mov	r0, r3
 288:	e24bd000 	sub	sp, fp, #0
 28c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 290:	e12fff1e 	bx	lr

00000294 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 294:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 298:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 29c:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a0:	da000005 	ble	2bc <memmove+0x28>
 2a4:	e0812002 	add	r2, r1, r2
 2a8:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2ac:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b0:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2b4:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b8:	1afffffb 	bne	2ac <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2bc:	e24bd000 	sub	sp, fp, #0
 2c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2c4:	e12fff1e 	bx	lr

000002c8 <fork>:
 2c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2dc:	e3a00001 	mov	r0, #1
 2e0:	ef000040 	svc	0x00000040
 2e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 2f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 2f8:	e12fff1e 	bx	lr

000002fc <exit>:
 2fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 300:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 304:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 308:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 30c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 310:	e3a00002 	mov	r0, #2
 314:	ef000040 	svc	0x00000040
 318:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 31c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 320:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 324:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 328:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 32c:	e12fff1e 	bx	lr

00000330 <wait>:
 330:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 334:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 338:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 33c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 340:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 344:	e3a00003 	mov	r0, #3
 348:	ef000040 	svc	0x00000040
 34c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 350:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 354:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 358:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 35c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 360:	e12fff1e 	bx	lr

00000364 <pipe>:
 364:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 368:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 36c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 370:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 374:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 378:	e3a00004 	mov	r0, #4
 37c:	ef000040 	svc	0x00000040
 380:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 384:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 388:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 38c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 390:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 394:	e12fff1e 	bx	lr

00000398 <read>:
 398:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 39c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3ac:	e3a00005 	mov	r0, #5
 3b0:	ef000040 	svc	0x00000040
 3b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c8:	e12fff1e 	bx	lr

000003cc <write>:
 3cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3e0:	e3a00010 	mov	r0, #16
 3e4:	ef000040 	svc	0x00000040
 3e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3fc:	e12fff1e 	bx	lr

00000400 <close>:
 400:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 404:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 408:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 40c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 410:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 414:	e3a00015 	mov	r0, #21
 418:	ef000040 	svc	0x00000040
 41c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 420:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 424:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 428:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 42c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 430:	e12fff1e 	bx	lr

00000434 <kill>:
 434:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 438:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 43c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 440:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 444:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 448:	e3a00006 	mov	r0, #6
 44c:	ef000040 	svc	0x00000040
 450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 454:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 458:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 45c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 460:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 464:	e12fff1e 	bx	lr

00000468 <exec>:
 468:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 46c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 470:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 474:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 478:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 47c:	e3a00007 	mov	r0, #7
 480:	ef000040 	svc	0x00000040
 484:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 488:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 48c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 490:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 494:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 498:	e12fff1e 	bx	lr

0000049c <open>:
 49c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4b0:	e3a0000f 	mov	r0, #15
 4b4:	ef000040 	svc	0x00000040
 4b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4cc:	e12fff1e 	bx	lr

000004d0 <mknod>:
 4d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e4:	e3a00011 	mov	r0, #17
 4e8:	ef000040 	svc	0x00000040
 4ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 500:	e12fff1e 	bx	lr

00000504 <unlink>:
 504:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 508:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 50c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 510:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 514:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 518:	e3a00012 	mov	r0, #18
 51c:	ef000040 	svc	0x00000040
 520:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 524:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 528:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 52c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 530:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 534:	e12fff1e 	bx	lr

00000538 <fstat>:
 538:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 53c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 540:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 544:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 548:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 54c:	e3a00008 	mov	r0, #8
 550:	ef000040 	svc	0x00000040
 554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 558:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 55c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 560:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 564:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 568:	e12fff1e 	bx	lr

0000056c <link>:
 56c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 570:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 574:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 578:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 57c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 580:	e3a00013 	mov	r0, #19
 584:	ef000040 	svc	0x00000040
 588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 58c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 590:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 594:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 598:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 59c:	e12fff1e 	bx	lr

000005a0 <mkdir>:
 5a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b4:	e3a00014 	mov	r0, #20
 5b8:	ef000040 	svc	0x00000040
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d0:	e12fff1e 	bx	lr

000005d4 <chdir>:
 5d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e8:	e3a00009 	mov	r0, #9
 5ec:	ef000040 	svc	0x00000040
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 600:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 604:	e12fff1e 	bx	lr

00000608 <dup>:
 608:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 60c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 610:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 614:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 618:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 61c:	e3a0000a 	mov	r0, #10
 620:	ef000040 	svc	0x00000040
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 62c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 630:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 634:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 638:	e12fff1e 	bx	lr

0000063c <getpid>:
 63c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 640:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 644:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 648:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 64c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 650:	e3a0000b 	mov	r0, #11
 654:	ef000040 	svc	0x00000040
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 660:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 664:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 668:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 66c:	e12fff1e 	bx	lr

00000670 <sbrk>:
 670:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 674:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 678:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 67c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 680:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 684:	e3a0000c 	mov	r0, #12
 688:	ef000040 	svc	0x00000040
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 694:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 698:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 69c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a0:	e12fff1e 	bx	lr

000006a4 <sleep>:
 6a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b8:	e3a0000d 	mov	r0, #13
 6bc:	ef000040 	svc	0x00000040
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d4:	e12fff1e 	bx	lr

000006d8 <uptime>:
 6d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6ec:	e3a0000e 	mov	r0, #14
 6f0:	ef000040 	svc	0x00000040
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 700:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 704:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 708:	e12fff1e 	bx	lr

0000070c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 70c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 710:	e1a09fa1 	lsr	r9, r1, #31
 714:	e3530000 	cmp	r3, #0
 718:	03a03000 	moveq	r3, #0
 71c:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 720:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 724:	e3530000 	cmp	r3, #0
 728:	e3008b64 	movw	r8, #2916	; 0xb64
    neg = 1;
    x = -xx;
 72c:	1261e000 	rsbne	lr, r1, #0
 730:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 734:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 738:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 73c:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 740:	01a09003 	moveq	r9, r3
 744:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 748:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 74c:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 750:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 754:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 758:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 75c:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 760:	e1a0033e 	lsr	r0, lr, r3
 764:	e2000001 	and	r0, r0, #1
 768:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 76c:	e1520001 	cmp	r2, r1
            r = r - d;
 770:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 774:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 778:	e2533001 	subs	r3, r3, #1
 77c:	2afffff7 	bcs	760 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 780:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 784:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 788:	e2873001 	add	r3, r7, #1
 78c:	e7d8100e 	ldrb	r1, [r8, lr]
 790:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 794:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 798:	11a07003 	movne	r7, r3
 79c:	1affffec 	bne	754 <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 7a0:	e3590000 	cmp	r9, #0
 7a4:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 7a8:	124b201c 	subne	r2, fp, #28
 7ac:	10822003 	addne	r2, r2, r3
 7b0:	12873002 	addne	r3, r7, #2
 7b4:	e0865003 	add	r5, r6, r3
 7b8:	13a0102d 	movne	r1, #45	; 0x2d
 7bc:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7c0:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7c4:	e3a02001 	mov	r2, #1
 7c8:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7cc:	e1a00004 	mov	r0, r4
 7d0:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7d4:	ebfffefc 	bl	3cc <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7d8:	e1560005 	cmp	r6, r5
 7dc:	1afffff7 	bne	7c0 <printint+0xb4>
    putc(fd, buf[i]);
}
 7e0:	e24bd01c 	sub	sp, fp, #28
 7e4:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000007e8 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 7e8:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 7ec:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 7f0:	e28db008 	add	fp, sp, #8
 7f4:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 7f8:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7fc:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 800:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 804:	e1a0c33e 	lsr	ip, lr, r3
 808:	e20cc001 	and	ip, ip, #1
 80c:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 810:	e1520001 	cmp	r2, r1
            r = r - d;
 814:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 818:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 81c:	e2533001 	subs	r3, r3, #1
 820:	2afffff7 	bcs	804 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 824:	e8bd8810 	pop	{r4, fp, pc}

00000828 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 828:	e92d000e 	push	{r1, r2, r3}
 82c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 830:	e28db01c 	add	fp, sp, #28
 834:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 838:	e59b6004 	ldr	r6, [fp, #4]
 83c:	e5d64000 	ldrb	r4, [r6]
 840:	e3540000 	cmp	r4, #0
 844:	0a00002d 	beq	900 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 848:	e3008b78 	movw	r8, #2936	; 0xb78
 84c:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 850:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 854:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 858:	e3a05000 	mov	r5, #0
 85c:	ea00000a 	b	88c <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 860:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 864:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 868:	0a000004 	beq	880 <printf+0x58>
 86c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 870:	e3a02001 	mov	r2, #1
 874:	e1a00007 	mov	r0, r7
 878:	e5614006 	strb	r4, [r1, #-6]!
 87c:	ebfffed2 	bl	3cc <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 880:	e5f64001 	ldrb	r4, [r6, #1]!
 884:	e3540000 	cmp	r4, #0
 888:	0a00001c 	beq	900 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 88c:	e3550000 	cmp	r5, #0
 890:	0afffff2 	beq	860 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 894:	e3550025 	cmp	r5, #37	; 0x25
 898:	1afffff8 	bne	880 <printf+0x58>
      if(c == 'd'){
 89c:	e3540064 	cmp	r4, #100	; 0x64
 8a0:	0a000037 	beq	984 <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8a4:	e20430f7 	and	r3, r4, #247	; 0xf7
 8a8:	e3530070 	cmp	r3, #112	; 0x70
 8ac:	0a000017 	beq	910 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8b0:	e3540073 	cmp	r4, #115	; 0x73
 8b4:	0a00001c 	beq	92c <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8b8:	e3540063 	cmp	r4, #99	; 0x63
 8bc:	0a000037 	beq	9a0 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8c0:	e3540025 	cmp	r4, #37	; 0x25
 8c4:	0a000027 	beq	968 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8c8:	e3a02001 	mov	r2, #1
 8cc:	e24b1021 	sub	r1, fp, #33	; 0x21
 8d0:	e1a00007 	mov	r0, r7
 8d4:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 8d8:	ebfffebb 	bl	3cc <write>
 8dc:	e24b1020 	sub	r1, fp, #32
 8e0:	e3a02001 	mov	r2, #1
 8e4:	e1a00007 	mov	r0, r7
 8e8:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8ec:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8f0:	ebfffeb5 	bl	3cc <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8f4:	e5f64001 	ldrb	r4, [r6, #1]!
 8f8:	e3540000 	cmp	r4, #0
 8fc:	1affffe2 	bne	88c <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 900:	e24bd01c 	sub	sp, fp, #28
 904:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 908:	e28dd00c 	add	sp, sp, #12
 90c:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 910:	e3a03000 	mov	r3, #0
 914:	e3a02010 	mov	r2, #16
 918:	e4991004 	ldr	r1, [r9], #4
 91c:	e1a00007 	mov	r0, r7
 920:	ebffff79 	bl	70c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 924:	e3a05000 	mov	r5, #0
 928:	eaffffd4 	b	880 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 92c:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 930:	e3540000 	cmp	r4, #0
 934:	01a04008 	moveq	r4, r8
        while(*s != 0){
 938:	e5d45000 	ldrb	r5, [r4]
 93c:	e3550000 	cmp	r5, #0
 940:	0affffce 	beq	880 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 944:	e3a02001 	mov	r2, #1
 948:	e24b1025 	sub	r1, fp, #37	; 0x25
 94c:	e1a00007 	mov	r0, r7
 950:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 954:	ebfffe9c 	bl	3cc <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 958:	e5f45001 	ldrb	r5, [r4, #1]!
 95c:	e3550000 	cmp	r5, #0
 960:	1afffff7 	bne	944 <printf+0x11c>
 964:	eaffffc5 	b	880 <printf+0x58>
 968:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 96c:	e3a02001 	mov	r2, #1
 970:	e1a00007 	mov	r0, r7
 974:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 978:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 97c:	ebfffe92 	bl	3cc <write>
 980:	eaffffbe 	b	880 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 984:	e3a03001 	mov	r3, #1
 988:	e3a0200a 	mov	r2, #10
 98c:	e4991004 	ldr	r1, [r9], #4
 990:	e1a00007 	mov	r0, r7
 994:	ebffff5c 	bl	70c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 998:	e3a05000 	mov	r5, #0
 99c:	eaffffb7 	b	880 <printf+0x58>
 9a0:	e4993004 	ldr	r3, [r9], #4
 9a4:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9a8:	e3a02001 	mov	r2, #1
 9ac:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9b0:	e3a05000 	mov	r5, #0
 9b4:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9b8:	ebfffe83 	bl	3cc <write>
 9bc:	eaffffaf 	b	880 <printf+0x58>

000009c0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c0:	e300cb80 	movw	ip, #2944	; 0xb80
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9c4:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9c8:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 9cc:	e92d4810 	push	{r4, fp, lr}
 9d0:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d4:	e59c3000 	ldr	r3, [ip]
 9d8:	ea000004 	b	9f0 <free+0x30>
 9dc:	e1510002 	cmp	r1, r2
 9e0:	3a000009 	bcc	a0c <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9e4:	e1530002 	cmp	r3, r2
 9e8:	2a000007 	bcs	a0c <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9ec:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f0:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f4:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f8:	3afffff7 	bcc	9dc <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9fc:	e1530002 	cmp	r3, r2
 a00:	3afffff9 	bcc	9ec <free+0x2c>
 a04:	e1510002 	cmp	r1, r2
 a08:	2afffff7 	bcs	9ec <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a0c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a10:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a14:	e081418e 	add	r4, r1, lr, lsl #3
 a18:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 a1c:	05922004 	ldreq	r2, [r2, #4]
 a20:	0082e00e 	addeq	lr, r2, lr
 a24:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a28:	05932000 	ldreq	r2, [r3]
 a2c:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 a30:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a34:	e5932004 	ldr	r2, [r3, #4]
 a38:	e083e182 	add	lr, r3, r2, lsl #3
 a3c:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a40:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a44:	05101004 	ldreq	r1, [r0, #-4]
 a48:	00812002 	addeq	r2, r1, r2
 a4c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a50:	05102008 	ldreq	r2, [r0, #-8]
 a54:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a58:	e8bd8810 	pop	{r4, fp, pc}

00000a5c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a5c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a60:	e3008b80 	movw	r8, #2944	; 0xb80
 a64:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a68:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 a6c:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 a70:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a74:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 a78:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a7c:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a80:	0a00002a 	beq	b30 <malloc+0xd4>
 a84:	e5930000 	ldr	r0, [r3]
 a88:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a8c:	e1540002 	cmp	r4, r2
 a90:	9a00001c 	bls	b08 <malloc+0xac>
 a94:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a98:	e3005b80 	movw	r5, #2944	; 0xb80
 a9c:	e3405000 	movt	r5, #0
 aa0:	33a06902 	movcc	r6, #32768	; 0x8000
 aa4:	21a06184 	lslcs	r6, r4, #3
 aa8:	21a07004 	movcs	r7, r4
 aac:	33a07a01 	movcc	r7, #4096	; 0x1000
 ab0:	ea000003 	b	ac4 <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab4:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ab8:	e5902004 	ldr	r2, [r0, #4]
 abc:	e1540002 	cmp	r4, r2
 ac0:	9a000010 	bls	b08 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ac4:	e5982000 	ldr	r2, [r8]
 ac8:	e1a03000 	mov	r3, r0
 acc:	e1520000 	cmp	r2, r0
 ad0:	1afffff7 	bne	ab4 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 ad4:	e1a00006 	mov	r0, r6
 ad8:	ebfffee4 	bl	670 <sbrk>
 adc:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ae0:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 ae4:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 ae8:	0a000004 	beq	b00 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 aec:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 af0:	ebffffb2 	bl	9c0 <free>
  return freep;
 af4:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 af8:	e3530000 	cmp	r3, #0
 afc:	1affffec 	bne	ab4 <malloc+0x58>
        return 0;
 b00:	e3a00000 	mov	r0, #0
  }
}
 b04:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b08:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 b0c:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b10:	10642002 	rsbne	r2, r4, r2
 b14:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b18:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 b1c:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b20:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 b24:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b28:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b2c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b30:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 b34:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b38:	e5880000 	str	r0, [r8]
 b3c:	e5880004 	str	r0, [r8, #4]
 b40:	eaffffd3 	b	a94 <malloc+0x38>
