
_echo:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
   0:	e3500001 	cmp	r0, #1
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	e28db014 	add	fp, sp, #20
  int i;

  for(i = 1; i < argc; i++)
   c:	da000013 	ble	60 <main+0x60>
  10:	e1a06000 	mov	r6, r0
  14:	e1a05001 	mov	r5, r1
  18:	e3a04001 	mov	r4, #1
  1c:	ea000005 	b	38 <main+0x38>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  20:	e3003b64 	movw	r3, #2916	; 0xb64
  24:	e3001b68 	movw	r1, #2920	; 0xb68
  28:	e3403000 	movt	r3, #0
  2c:	e3401000 	movt	r1, #0
  30:	e3a00001 	mov	r0, #1
  34:	eb000203 	bl	848 <printf>
  38:	e2844001 	add	r4, r4, #1
  3c:	e5b52004 	ldr	r2, [r5, #4]!
  40:	e1560004 	cmp	r6, r4
  44:	1afffff5 	bne	20 <main+0x20>
  48:	e3003b70 	movw	r3, #2928	; 0xb70
  4c:	e3001b68 	movw	r1, #2920	; 0xb68
  50:	e3403000 	movt	r3, #0
  54:	e3401000 	movt	r1, #0
  58:	e3a00001 	mov	r0, #1
  5c:	eb0001f9 	bl	848 <printf>
  exit();
  60:	eb0000ad 	bl	31c <exit>

00000064 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  68:	e2402001 	sub	r2, r0, #1
  6c:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  70:	e4d13001 	ldrb	r3, [r1], #1
  74:	e3530000 	cmp	r3, #0
  78:	e5e23001 	strb	r3, [r2, #1]!
  7c:	1afffffb 	bne	70 <strcpy+0xc>
    ;
  return os;
}
  80:	e24bd000 	sub	sp, fp, #0
  84:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  88:	e12fff1e 	bx	lr

0000008c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  8c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  90:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  94:	e5d03000 	ldrb	r3, [r0]
  98:	e3530000 	cmp	r3, #0
  9c:	05d10000 	ldrbeq	r0, [r1]
  a0:	0a00000a 	beq	d0 <strcmp+0x44>
  a4:	e5d12000 	ldrb	r2, [r1]
  a8:	e1530002 	cmp	r3, r2
  ac:	0a000003 	beq	c0 <strcmp+0x34>
  b0:	ea00000a 	b	e0 <strcmp+0x54>
  b4:	e5f12001 	ldrb	r2, [r1, #1]!
  b8:	e1530002 	cmp	r3, r2
  bc:	1a000007 	bne	e0 <strcmp+0x54>
  c0:	e5f03001 	ldrb	r3, [r0, #1]!
  c4:	e3530000 	cmp	r3, #0
  c8:	1afffff9 	bne	b4 <strcmp+0x28>
  cc:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  d0:	e0600003 	rsb	r0, r0, r3
  d4:	e24bd000 	sub	sp, fp, #0
  d8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  dc:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e0:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  e4:	e0600003 	rsb	r0, r0, r3
  e8:	e24bd000 	sub	sp, fp, #0
  ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  f0:	e12fff1e 	bx	lr

000000f4 <strlen>:

uint
strlen(char *s)
{
  f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f8:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  fc:	e5d03000 	ldrb	r3, [r0]
 100:	e3530000 	cmp	r3, #0
 104:	0a000009 	beq	130 <strlen+0x3c>
 108:	e1a02000 	mov	r2, r0
 10c:	e3a03000 	mov	r3, #0
 110:	e5f21001 	ldrb	r1, [r2, #1]!
 114:	e2833001 	add	r3, r3, #1
 118:	e3510000 	cmp	r1, #0
 11c:	e1a00003 	mov	r0, r3
 120:	1afffffa 	bne	110 <strlen+0x1c>
    ;
  return n;
}
 124:	e24bd000 	sub	sp, fp, #0
 128:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 12c:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 130:	e1a00003 	mov	r0, r3
 134:	eafffffa 	b	124 <strlen+0x30>

00000138 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 138:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 13c:	e1a03000 	mov	r3, r0
 140:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 144:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 148:	0a000004 	beq	160 <memset+0x28>
 14c:	e6ef1071 	uxtb	r1, r1
 150:	e0800002 	add	r0, r0, r2
 154:	e4c31001 	strb	r1, [r3], #1
 158:	e1500003 	cmp	r0, r3
 15c:	1afffffc 	bne	154 <memset+0x1c>
  return (void *)p;
}
 160:	e24bd000 	sub	sp, fp, #0
 164:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 168:	e12fff1e 	bx	lr

0000016c <strchr>:

char*
strchr(const char *s, char c)
{
 16c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 170:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 174:	e5d02000 	ldrb	r2, [r0]
 178:	e3520000 	cmp	r2, #0
 17c:	0a00000b 	beq	1b0 <strchr+0x44>
    if(*s == c)
 180:	e1510002 	cmp	r1, r2
 184:	1a000002 	bne	194 <strchr+0x28>
 188:	ea000005 	b	1a4 <strchr+0x38>
 18c:	e1530001 	cmp	r3, r1
 190:	0a000003 	beq	1a4 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 194:	e5f03001 	ldrb	r3, [r0, #1]!
 198:	e3530000 	cmp	r3, #0
 19c:	1afffffa 	bne	18c <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1a0:	e1a00003 	mov	r0, r3
}
 1a4:	e24bd000 	sub	sp, fp, #0
 1a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1ac:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 1b0:	e1a00002 	mov	r0, r2
 1b4:	eafffffa 	b	1a4 <strchr+0x38>

000001b8 <gets>:
}

char*
gets(char *buf, int max)
{
 1b8:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1bc:	e1a08000 	mov	r8, r0
 1c0:	e28db018 	add	fp, sp, #24
 1c4:	e1a07001 	mov	r7, r1
 1c8:	e24dd00c 	sub	sp, sp, #12
 1cc:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d0:	e3a05000 	mov	r5, #0
 1d4:	ea000008 	b	1fc <gets+0x44>
    cc = read(0, &c, 1);
 1d8:	eb000076 	bl	3b8 <read>
    if(cc < 1)
 1dc:	e3500000 	cmp	r0, #0
 1e0:	da00000b 	ble	214 <gets+0x5c>
      break;
    buf[i++] = c;
 1e4:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1e8:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 1ec:	e353000d 	cmp	r3, #13
 1f0:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1f4:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 1f8:	0a000005 	beq	214 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1fc:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 200:	e0854002 	add	r4, r5, r2
 204:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 208:	e24b101d 	sub	r1, fp, #29
 20c:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 210:	bafffff0 	blt	1d8 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 214:	e3a03000 	mov	r3, #0
  return buf;
}
 218:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 21c:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 220:	e24bd018 	sub	sp, fp, #24
 224:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000228 <stat>:

int
stat(char *n, struct stat *st)
{
 228:	e92d4830 	push	{r4, r5, fp, lr}
 22c:	e1a04001 	mov	r4, r1
 230:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 234:	e3a01000 	mov	r1, #0
 238:	eb00009f 	bl	4bc <open>
  if(fd < 0)
 23c:	e2505000 	subs	r5, r0, #0
 240:	ba000006 	blt	260 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 244:	e1a01004 	mov	r1, r4
 248:	eb0000c2 	bl	558 <fstat>
 24c:	e1a04000 	mov	r4, r0
  close(fd);
 250:	e1a00005 	mov	r0, r5
 254:	eb000071 	bl	420 <close>
  return r;
 258:	e1a00004 	mov	r0, r4
 25c:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 260:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 264:	e8bd8830 	pop	{r4, r5, fp, pc}

00000268 <atoi>:

int
atoi(const char *s)
{
 268:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 26c:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 270:	e5d01000 	ldrb	r1, [r0]
 274:	e2413030 	sub	r3, r1, #48	; 0x30
 278:	e3530009 	cmp	r3, #9
 27c:	e3a03000 	mov	r3, #0
 280:	8a000007 	bhi	2a4 <atoi+0x3c>
    n = n*10 + *s++ - '0';
 284:	e1a02183 	lsl	r2, r3, #3
 288:	e0823083 	add	r3, r2, r3, lsl #1
 28c:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 290:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 294:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 298:	e2412030 	sub	r2, r1, #48	; 0x30
 29c:	e3520009 	cmp	r2, #9
 2a0:	9afffff7 	bls	284 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 2a4:	e1a00003 	mov	r0, r3
 2a8:	e24bd000 	sub	sp, fp, #0
 2ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2b0:	e12fff1e 	bx	lr

000002b4 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b4:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 2b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2bc:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c0:	da000005 	ble	2dc <memmove+0x28>
 2c4:	e0812002 	add	r2, r1, r2
 2c8:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2cc:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d0:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2d4:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d8:	1afffffb 	bne	2cc <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2dc:	e24bd000 	sub	sp, fp, #0
 2e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2e4:	e12fff1e 	bx	lr

000002e8 <fork>:
 2e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2fc:	e3a00001 	mov	r0, #1
 300:	ef000040 	svc	0x00000040
 304:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 308:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 30c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 310:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 314:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 318:	e12fff1e 	bx	lr

0000031c <exit>:
 31c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 320:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 324:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 328:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 32c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 330:	e3a00002 	mov	r0, #2
 334:	ef000040 	svc	0x00000040
 338:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 33c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 340:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 344:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 348:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 34c:	e12fff1e 	bx	lr

00000350 <wait>:
 350:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 354:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 358:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 35c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 360:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 364:	e3a00003 	mov	r0, #3
 368:	ef000040 	svc	0x00000040
 36c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 370:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 374:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 378:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 37c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 380:	e12fff1e 	bx	lr

00000384 <pipe>:
 384:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 388:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 38c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 390:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 394:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 398:	e3a00004 	mov	r0, #4
 39c:	ef000040 	svc	0x00000040
 3a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3b4:	e12fff1e 	bx	lr

000003b8 <read>:
 3b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3cc:	e3a00005 	mov	r0, #5
 3d0:	ef000040 	svc	0x00000040
 3d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3e8:	e12fff1e 	bx	lr

000003ec <write>:
 3ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 400:	e3a00010 	mov	r0, #16
 404:	ef000040 	svc	0x00000040
 408:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 40c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 410:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 414:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 418:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 41c:	e12fff1e 	bx	lr

00000420 <close>:
 420:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 424:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 428:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 42c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 430:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 434:	e3a00015 	mov	r0, #21
 438:	ef000040 	svc	0x00000040
 43c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 440:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 444:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 448:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 44c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 450:	e12fff1e 	bx	lr

00000454 <kill>:
 454:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 458:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 45c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 460:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 464:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 468:	e3a00006 	mov	r0, #6
 46c:	ef000040 	svc	0x00000040
 470:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 474:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 478:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 47c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 480:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 484:	e12fff1e 	bx	lr

00000488 <exec>:
 488:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 48c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 490:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 494:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 498:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 49c:	e3a00007 	mov	r0, #7
 4a0:	ef000040 	svc	0x00000040
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b8:	e12fff1e 	bx	lr

000004bc <open>:
 4bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d0:	e3a0000f 	mov	r0, #15
 4d4:	ef000040 	svc	0x00000040
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ec:	e12fff1e 	bx	lr

000004f0 <mknod>:
 4f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 500:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 504:	e3a00011 	mov	r0, #17
 508:	ef000040 	svc	0x00000040
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 514:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 518:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 51c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 520:	e12fff1e 	bx	lr

00000524 <unlink>:
 524:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 528:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 52c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 530:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 534:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 538:	e3a00012 	mov	r0, #18
 53c:	ef000040 	svc	0x00000040
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 548:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 54c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 550:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 554:	e12fff1e 	bx	lr

00000558 <fstat>:
 558:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 55c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 560:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 564:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 568:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 56c:	e3a00008 	mov	r0, #8
 570:	ef000040 	svc	0x00000040
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 57c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 580:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 584:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 588:	e12fff1e 	bx	lr

0000058c <link>:
 58c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 590:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 594:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 598:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 59c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a0:	e3a00013 	mov	r0, #19
 5a4:	ef000040 	svc	0x00000040
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5bc:	e12fff1e 	bx	lr

000005c0 <mkdir>:
 5c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d4:	e3a00014 	mov	r0, #20
 5d8:	ef000040 	svc	0x00000040
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f0:	e12fff1e 	bx	lr

000005f4 <chdir>:
 5f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 600:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 604:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 608:	e3a00009 	mov	r0, #9
 60c:	ef000040 	svc	0x00000040
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 61c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 620:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 624:	e12fff1e 	bx	lr

00000628 <dup>:
 628:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 62c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 630:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 634:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 638:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 63c:	e3a0000a 	mov	r0, #10
 640:	ef000040 	svc	0x00000040
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 650:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 654:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 658:	e12fff1e 	bx	lr

0000065c <getpid>:
 65c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 660:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 664:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 668:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 66c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 670:	e3a0000b 	mov	r0, #11
 674:	ef000040 	svc	0x00000040
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 684:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 688:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 68c:	e12fff1e 	bx	lr

00000690 <sbrk>:
 690:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 694:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 698:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 69c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a4:	e3a0000c 	mov	r0, #12
 6a8:	ef000040 	svc	0x00000040
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c0:	e12fff1e 	bx	lr

000006c4 <sleep>:
 6c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d8:	e3a0000d 	mov	r0, #13
 6dc:	ef000040 	svc	0x00000040
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f4:	e12fff1e 	bx	lr

000006f8 <uptime>:
 6f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 700:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 704:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 708:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 70c:	e3a0000e 	mov	r0, #14
 710:	ef000040 	svc	0x00000040
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 720:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 724:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 728:	e12fff1e 	bx	lr

0000072c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 72c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 730:	e1a09fa1 	lsr	r9, r1, #31
 734:	e3530000 	cmp	r3, #0
 738:	03a03000 	moveq	r3, #0
 73c:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 740:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 744:	e3530000 	cmp	r3, #0
 748:	e3008b74 	movw	r8, #2932	; 0xb74
    neg = 1;
    x = -xx;
 74c:	1261e000 	rsbne	lr, r1, #0
 750:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 754:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 758:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 75c:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 760:	01a09003 	moveq	r9, r3
 764:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 768:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 76c:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 770:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 774:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 778:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 77c:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 780:	e1a0033e 	lsr	r0, lr, r3
 784:	e2000001 	and	r0, r0, #1
 788:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 78c:	e1520001 	cmp	r2, r1
            r = r - d;
 790:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 794:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 798:	e2533001 	subs	r3, r3, #1
 79c:	2afffff7 	bcs	780 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7a0:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 7a4:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7a8:	e2873001 	add	r3, r7, #1
 7ac:	e7d8100e 	ldrb	r1, [r8, lr]
 7b0:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 7b4:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7b8:	11a07003 	movne	r7, r3
 7bc:	1affffec 	bne	774 <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 7c0:	e3590000 	cmp	r9, #0
 7c4:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 7c8:	124b201c 	subne	r2, fp, #28
 7cc:	10822003 	addne	r2, r2, r3
 7d0:	12873002 	addne	r3, r7, #2
 7d4:	e0865003 	add	r5, r6, r3
 7d8:	13a0102d 	movne	r1, #45	; 0x2d
 7dc:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7e0:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7e4:	e3a02001 	mov	r2, #1
 7e8:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7ec:	e1a00004 	mov	r0, r4
 7f0:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7f4:	ebfffefc 	bl	3ec <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7f8:	e1560005 	cmp	r6, r5
 7fc:	1afffff7 	bne	7e0 <printint+0xb4>
    putc(fd, buf[i]);
}
 800:	e24bd01c 	sub	sp, fp, #28
 804:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000808 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 808:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 80c:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 810:	e28db008 	add	fp, sp, #8
 814:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 818:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 81c:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 820:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 824:	e1a0c33e 	lsr	ip, lr, r3
 828:	e20cc001 	and	ip, ip, #1
 82c:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 830:	e1520001 	cmp	r2, r1
            r = r - d;
 834:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 838:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 83c:	e2533001 	subs	r3, r3, #1
 840:	2afffff7 	bcs	824 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 844:	e8bd8810 	pop	{r4, fp, pc}

00000848 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 848:	e92d000e 	push	{r1, r2, r3}
 84c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 850:	e28db01c 	add	fp, sp, #28
 854:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 858:	e59b6004 	ldr	r6, [fp, #4]
 85c:	e5d64000 	ldrb	r4, [r6]
 860:	e3540000 	cmp	r4, #0
 864:	0a00002d 	beq	920 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 868:	e3008b88 	movw	r8, #2952	; 0xb88
 86c:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 870:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 874:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 878:	e3a05000 	mov	r5, #0
 87c:	ea00000a 	b	8ac <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 880:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 884:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 888:	0a000004 	beq	8a0 <printf+0x58>
 88c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 890:	e3a02001 	mov	r2, #1
 894:	e1a00007 	mov	r0, r7
 898:	e5614006 	strb	r4, [r1, #-6]!
 89c:	ebfffed2 	bl	3ec <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8a0:	e5f64001 	ldrb	r4, [r6, #1]!
 8a4:	e3540000 	cmp	r4, #0
 8a8:	0a00001c 	beq	920 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 8ac:	e3550000 	cmp	r5, #0
 8b0:	0afffff2 	beq	880 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8b4:	e3550025 	cmp	r5, #37	; 0x25
 8b8:	1afffff8 	bne	8a0 <printf+0x58>
      if(c == 'd'){
 8bc:	e3540064 	cmp	r4, #100	; 0x64
 8c0:	0a000037 	beq	9a4 <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8c4:	e20430f7 	and	r3, r4, #247	; 0xf7
 8c8:	e3530070 	cmp	r3, #112	; 0x70
 8cc:	0a000017 	beq	930 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8d0:	e3540073 	cmp	r4, #115	; 0x73
 8d4:	0a00001c 	beq	94c <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8d8:	e3540063 	cmp	r4, #99	; 0x63
 8dc:	0a000037 	beq	9c0 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8e0:	e3540025 	cmp	r4, #37	; 0x25
 8e4:	0a000027 	beq	988 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8e8:	e3a02001 	mov	r2, #1
 8ec:	e24b1021 	sub	r1, fp, #33	; 0x21
 8f0:	e1a00007 	mov	r0, r7
 8f4:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 8f8:	ebfffebb 	bl	3ec <write>
 8fc:	e24b1020 	sub	r1, fp, #32
 900:	e3a02001 	mov	r2, #1
 904:	e1a00007 	mov	r0, r7
 908:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 90c:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 910:	ebfffeb5 	bl	3ec <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 914:	e5f64001 	ldrb	r4, [r6, #1]!
 918:	e3540000 	cmp	r4, #0
 91c:	1affffe2 	bne	8ac <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 920:	e24bd01c 	sub	sp, fp, #28
 924:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 928:	e28dd00c 	add	sp, sp, #12
 92c:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 930:	e3a03000 	mov	r3, #0
 934:	e3a02010 	mov	r2, #16
 938:	e4991004 	ldr	r1, [r9], #4
 93c:	e1a00007 	mov	r0, r7
 940:	ebffff79 	bl	72c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 944:	e3a05000 	mov	r5, #0
 948:	eaffffd4 	b	8a0 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 94c:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 950:	e3540000 	cmp	r4, #0
 954:	01a04008 	moveq	r4, r8
        while(*s != 0){
 958:	e5d45000 	ldrb	r5, [r4]
 95c:	e3550000 	cmp	r5, #0
 960:	0affffce 	beq	8a0 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 964:	e3a02001 	mov	r2, #1
 968:	e24b1025 	sub	r1, fp, #37	; 0x25
 96c:	e1a00007 	mov	r0, r7
 970:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 974:	ebfffe9c 	bl	3ec <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 978:	e5f45001 	ldrb	r5, [r4, #1]!
 97c:	e3550000 	cmp	r5, #0
 980:	1afffff7 	bne	964 <printf+0x11c>
 984:	eaffffc5 	b	8a0 <printf+0x58>
 988:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 98c:	e3a02001 	mov	r2, #1
 990:	e1a00007 	mov	r0, r7
 994:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 998:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 99c:	ebfffe92 	bl	3ec <write>
 9a0:	eaffffbe 	b	8a0 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 9a4:	e3a03001 	mov	r3, #1
 9a8:	e3a0200a 	mov	r2, #10
 9ac:	e4991004 	ldr	r1, [r9], #4
 9b0:	e1a00007 	mov	r0, r7
 9b4:	ebffff5c 	bl	72c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9b8:	e3a05000 	mov	r5, #0
 9bc:	eaffffb7 	b	8a0 <printf+0x58>
 9c0:	e4993004 	ldr	r3, [r9], #4
 9c4:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9c8:	e3a02001 	mov	r2, #1
 9cc:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9d0:	e3a05000 	mov	r5, #0
 9d4:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9d8:	ebfffe83 	bl	3ec <write>
 9dc:	eaffffaf 	b	8a0 <printf+0x58>

000009e0 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e0:	e300cb90 	movw	ip, #2960	; 0xb90
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9e4:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e8:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 9ec:	e92d4810 	push	{r4, fp, lr}
 9f0:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f4:	e59c3000 	ldr	r3, [ip]
 9f8:	ea000004 	b	a10 <free+0x30>
 9fc:	e1510002 	cmp	r1, r2
 a00:	3a000009 	bcc	a2c <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a04:	e1530002 	cmp	r3, r2
 a08:	2a000007 	bcs	a2c <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a0c:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a10:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a14:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a18:	3afffff7 	bcc	9fc <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a1c:	e1530002 	cmp	r3, r2
 a20:	3afffff9 	bcc	a0c <free+0x2c>
 a24:	e1510002 	cmp	r1, r2
 a28:	2afffff7 	bcs	a0c <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a2c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a30:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a34:	e081418e 	add	r4, r1, lr, lsl #3
 a38:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 a3c:	05922004 	ldreq	r2, [r2, #4]
 a40:	0082e00e 	addeq	lr, r2, lr
 a44:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a48:	05932000 	ldreq	r2, [r3]
 a4c:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 a50:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a54:	e5932004 	ldr	r2, [r3, #4]
 a58:	e083e182 	add	lr, r3, r2, lsl #3
 a5c:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a60:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a64:	05101004 	ldreq	r1, [r0, #-4]
 a68:	00812002 	addeq	r2, r1, r2
 a6c:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a70:	05102008 	ldreq	r2, [r0, #-8]
 a74:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a78:	e8bd8810 	pop	{r4, fp, pc}

00000a7c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a7c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a80:	e3008b90 	movw	r8, #2960	; 0xb90
 a84:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a88:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 a8c:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 a90:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a94:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 a98:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a9c:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 aa0:	0a00002a 	beq	b50 <malloc+0xd4>
 aa4:	e5930000 	ldr	r0, [r3]
 aa8:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 aac:	e1540002 	cmp	r4, r2
 ab0:	9a00001c 	bls	b28 <malloc+0xac>
 ab4:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ab8:	e3005b90 	movw	r5, #2960	; 0xb90
 abc:	e3405000 	movt	r5, #0
 ac0:	33a06902 	movcc	r6, #32768	; 0x8000
 ac4:	21a06184 	lslcs	r6, r4, #3
 ac8:	21a07004 	movcs	r7, r4
 acc:	33a07a01 	movcc	r7, #4096	; 0x1000
 ad0:	ea000003 	b	ae4 <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad4:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ad8:	e5902004 	ldr	r2, [r0, #4]
 adc:	e1540002 	cmp	r4, r2
 ae0:	9a000010 	bls	b28 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ae4:	e5982000 	ldr	r2, [r8]
 ae8:	e1a03000 	mov	r3, r0
 aec:	e1520000 	cmp	r2, r0
 af0:	1afffff7 	bne	ad4 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 af4:	e1a00006 	mov	r0, r6
 af8:	ebfffee4 	bl	690 <sbrk>
 afc:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b00:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 b04:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 b08:	0a000004 	beq	b20 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b0c:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 b10:	ebffffb2 	bl	9e0 <free>
  return freep;
 b14:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b18:	e3530000 	cmp	r3, #0
 b1c:	1affffec 	bne	ad4 <malloc+0x58>
        return 0;
 b20:	e3a00000 	mov	r0, #0
  }
}
 b24:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b28:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 b2c:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b30:	10642002 	rsbne	r2, r4, r2
 b34:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b38:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 b3c:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b40:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 b44:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b48:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b4c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b50:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 b54:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b58:	e5880000 	str	r0, [r8]
 b5c:	e5880004 	str	r0, [r8, #4]
 b60:	eaffffd3 	b	ab4 <malloc+0x38>
