
_ln:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "user.h"

int
main(int argc, char *argv[])
{
  if(argc != 3){
   0:	e3500003 	cmp	r0, #3
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   4:	e92d4800 	push	{fp, lr}
   8:	e28db004 	add	fp, sp, #4
  if(argc != 3){
   c:	0a000004 	beq	24 <main+0x24>
    printf(2, "Usage: ln old new\n");
  10:	e3001b58 	movw	r1, #2904	; 0xb58
  14:	e3a00002 	mov	r0, #2
  18:	e3401000 	movt	r1, #0
  1c:	eb000206 	bl	83c <printf>
    exit();
  20:	eb0000ba 	bl	310 <exit>
  24:	e1a04001 	mov	r4, r1
  }
  if(link(argv[1], argv[2]) < 0)
  28:	e9910003 	ldmib	r1, {r0, r1}
  2c:	eb000153 	bl	580 <link>
  30:	e3500000 	cmp	r0, #0
  34:	ba000000 	blt	3c <main+0x3c>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  38:	eb0000b4 	bl	310 <exit>
  if(argc != 3){
    printf(2, "Usage: ln old new\n");
    exit();
  }
  if(link(argv[1], argv[2]) < 0)
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  3c:	e3001b6c 	movw	r1, #2924	; 0xb6c
  40:	e5943008 	ldr	r3, [r4, #8]
  44:	e3401000 	movt	r1, #0
  48:	e5942004 	ldr	r2, [r4, #4]
  4c:	e3a00002 	mov	r0, #2
  50:	eb0001f9 	bl	83c <printf>
  54:	eafffff7 	b	38 <main+0x38>

00000058 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  58:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  5c:	e2402001 	sub	r2, r0, #1
  60:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  64:	e4d13001 	ldrb	r3, [r1], #1
  68:	e3530000 	cmp	r3, #0
  6c:	e5e23001 	strb	r3, [r2, #1]!
  70:	1afffffb 	bne	64 <strcpy+0xc>
    ;
  return os;
}
  74:	e24bd000 	sub	sp, fp, #0
  78:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  7c:	e12fff1e 	bx	lr

00000080 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  80:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  84:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  88:	e5d03000 	ldrb	r3, [r0]
  8c:	e3530000 	cmp	r3, #0
  90:	05d10000 	ldrbeq	r0, [r1]
  94:	0a00000a 	beq	c4 <strcmp+0x44>
  98:	e5d12000 	ldrb	r2, [r1]
  9c:	e1530002 	cmp	r3, r2
  a0:	0a000003 	beq	b4 <strcmp+0x34>
  a4:	ea00000a 	b	d4 <strcmp+0x54>
  a8:	e5f12001 	ldrb	r2, [r1, #1]!
  ac:	e1530002 	cmp	r3, r2
  b0:	1a000007 	bne	d4 <strcmp+0x54>
  b4:	e5f03001 	ldrb	r3, [r0, #1]!
  b8:	e3530000 	cmp	r3, #0
  bc:	1afffff9 	bne	a8 <strcmp+0x28>
  c0:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  c4:	e0600003 	rsb	r0, r0, r3
  c8:	e24bd000 	sub	sp, fp, #0
  cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  d0:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d4:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  d8:	e0600003 	rsb	r0, r0, r3
  dc:	e24bd000 	sub	sp, fp, #0
  e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  e4:	e12fff1e 	bx	lr

000000e8 <strlen>:

uint
strlen(char *s)
{
  e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  ec:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  f0:	e5d03000 	ldrb	r3, [r0]
  f4:	e3530000 	cmp	r3, #0
  f8:	0a000009 	beq	124 <strlen+0x3c>
  fc:	e1a02000 	mov	r2, r0
 100:	e3a03000 	mov	r3, #0
 104:	e5f21001 	ldrb	r1, [r2, #1]!
 108:	e2833001 	add	r3, r3, #1
 10c:	e3510000 	cmp	r1, #0
 110:	e1a00003 	mov	r0, r3
 114:	1afffffa 	bne	104 <strlen+0x1c>
    ;
  return n;
}
 118:	e24bd000 	sub	sp, fp, #0
 11c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 120:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 124:	e1a00003 	mov	r0, r3
 128:	eafffffa 	b	118 <strlen+0x30>

0000012c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 12c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 130:	e1a03000 	mov	r3, r0
 134:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 138:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 13c:	0a000004 	beq	154 <memset+0x28>
 140:	e6ef1071 	uxtb	r1, r1
 144:	e0800002 	add	r0, r0, r2
 148:	e4c31001 	strb	r1, [r3], #1
 14c:	e1500003 	cmp	r0, r3
 150:	1afffffc 	bne	148 <memset+0x1c>
  return (void *)p;
}
 154:	e24bd000 	sub	sp, fp, #0
 158:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 15c:	e12fff1e 	bx	lr

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 164:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 168:	e5d02000 	ldrb	r2, [r0]
 16c:	e3520000 	cmp	r2, #0
 170:	0a00000b 	beq	1a4 <strchr+0x44>
    if(*s == c)
 174:	e1510002 	cmp	r1, r2
 178:	1a000002 	bne	188 <strchr+0x28>
 17c:	ea000005 	b	198 <strchr+0x38>
 180:	e1530001 	cmp	r3, r1
 184:	0a000003 	beq	198 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 188:	e5f03001 	ldrb	r3, [r0, #1]!
 18c:	e3530000 	cmp	r3, #0
 190:	1afffffa 	bne	180 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 194:	e1a00003 	mov	r0, r3
}
 198:	e24bd000 	sub	sp, fp, #0
 19c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1a0:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 1a4:	e1a00002 	mov	r0, r2
 1a8:	eafffffa 	b	198 <strchr+0x38>

000001ac <gets>:
}

char*
gets(char *buf, int max)
{
 1ac:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1b0:	e1a08000 	mov	r8, r0
 1b4:	e28db018 	add	fp, sp, #24
 1b8:	e1a07001 	mov	r7, r1
 1bc:	e24dd00c 	sub	sp, sp, #12
 1c0:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c4:	e3a05000 	mov	r5, #0
 1c8:	ea000008 	b	1f0 <gets+0x44>
    cc = read(0, &c, 1);
 1cc:	eb000076 	bl	3ac <read>
    if(cc < 1)
 1d0:	e3500000 	cmp	r0, #0
 1d4:	da00000b 	ble	208 <gets+0x5c>
      break;
    buf[i++] = c;
 1d8:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1dc:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 1e0:	e353000d 	cmp	r3, #13
 1e4:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1e8:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 1ec:	0a000005 	beq	208 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1f0:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f4:	e0854002 	add	r4, r5, r2
 1f8:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1fc:	e24b101d 	sub	r1, fp, #29
 200:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 204:	bafffff0 	blt	1cc <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 208:	e3a03000 	mov	r3, #0
  return buf;
}
 20c:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 210:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 214:	e24bd018 	sub	sp, fp, #24
 218:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

0000021c <stat>:

int
stat(char *n, struct stat *st)
{
 21c:	e92d4830 	push	{r4, r5, fp, lr}
 220:	e1a04001 	mov	r4, r1
 224:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 228:	e3a01000 	mov	r1, #0
 22c:	eb00009f 	bl	4b0 <open>
  if(fd < 0)
 230:	e2505000 	subs	r5, r0, #0
 234:	ba000006 	blt	254 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 238:	e1a01004 	mov	r1, r4
 23c:	eb0000c2 	bl	54c <fstat>
 240:	e1a04000 	mov	r4, r0
  close(fd);
 244:	e1a00005 	mov	r0, r5
 248:	eb000071 	bl	414 <close>
  return r;
 24c:	e1a00004 	mov	r0, r4
 250:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 254:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 258:	e8bd8830 	pop	{r4, r5, fp, pc}

0000025c <atoi>:

int
atoi(const char *s)
{
 25c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 260:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 264:	e5d01000 	ldrb	r1, [r0]
 268:	e2413030 	sub	r3, r1, #48	; 0x30
 26c:	e3530009 	cmp	r3, #9
 270:	e3a03000 	mov	r3, #0
 274:	8a000007 	bhi	298 <atoi+0x3c>
    n = n*10 + *s++ - '0';
 278:	e1a02183 	lsl	r2, r3, #3
 27c:	e0823083 	add	r3, r2, r3, lsl #1
 280:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 284:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 288:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 28c:	e2412030 	sub	r2, r1, #48	; 0x30
 290:	e3520009 	cmp	r2, #9
 294:	9afffff7 	bls	278 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 298:	e1a00003 	mov	r0, r3
 29c:	e24bd000 	sub	sp, fp, #0
 2a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2a4:	e12fff1e 	bx	lr

000002a8 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a8:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 2ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b0:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b4:	da000005 	ble	2d0 <memmove+0x28>
 2b8:	e0812002 	add	r2, r1, r2
 2bc:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2c0:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c4:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2c8:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2cc:	1afffffb 	bne	2c0 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2d0:	e24bd000 	sub	sp, fp, #0
 2d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d8:	e12fff1e 	bx	lr

000002dc <fork>:
 2dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2f0:	e3a00001 	mov	r0, #1
 2f4:	ef000040 	svc	0x00000040
 2f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 300:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 304:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 308:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 30c:	e12fff1e 	bx	lr

00000310 <exit>:
 310:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 314:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 318:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 31c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 320:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 324:	e3a00002 	mov	r0, #2
 328:	ef000040 	svc	0x00000040
 32c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 330:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 334:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 338:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 33c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 340:	e12fff1e 	bx	lr

00000344 <wait>:
 344:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 348:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 34c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 350:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 354:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 358:	e3a00003 	mov	r0, #3
 35c:	ef000040 	svc	0x00000040
 360:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 364:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 368:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 36c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 370:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 374:	e12fff1e 	bx	lr

00000378 <pipe>:
 378:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 37c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 380:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 384:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 388:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 38c:	e3a00004 	mov	r0, #4
 390:	ef000040 	svc	0x00000040
 394:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 398:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 39c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a8:	e12fff1e 	bx	lr

000003ac <read>:
 3ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3c0:	e3a00005 	mov	r0, #5
 3c4:	ef000040 	svc	0x00000040
 3c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3dc:	e12fff1e 	bx	lr

000003e0 <write>:
 3e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3f4:	e3a00010 	mov	r0, #16
 3f8:	ef000040 	svc	0x00000040
 3fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 400:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 404:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 408:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 40c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 410:	e12fff1e 	bx	lr

00000414 <close>:
 414:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 418:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 41c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 420:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 424:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 428:	e3a00015 	mov	r0, #21
 42c:	ef000040 	svc	0x00000040
 430:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 434:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 438:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 43c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 440:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 444:	e12fff1e 	bx	lr

00000448 <kill>:
 448:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 44c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 450:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 454:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 458:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 45c:	e3a00006 	mov	r0, #6
 460:	ef000040 	svc	0x00000040
 464:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 468:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 46c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 470:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 474:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 478:	e12fff1e 	bx	lr

0000047c <exec>:
 47c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 480:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 484:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 488:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 48c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 490:	e3a00007 	mov	r0, #7
 494:	ef000040 	svc	0x00000040
 498:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 49c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ac:	e12fff1e 	bx	lr

000004b0 <open>:
 4b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4c4:	e3a0000f 	mov	r0, #15
 4c8:	ef000040 	svc	0x00000040
 4cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4e0:	e12fff1e 	bx	lr

000004e4 <mknod>:
 4e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f8:	e3a00011 	mov	r0, #17
 4fc:	ef000040 	svc	0x00000040
 500:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 504:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 508:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 50c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 510:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 514:	e12fff1e 	bx	lr

00000518 <unlink>:
 518:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 51c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 520:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 524:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 528:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 52c:	e3a00012 	mov	r0, #18
 530:	ef000040 	svc	0x00000040
 534:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 538:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 53c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 540:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 544:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 548:	e12fff1e 	bx	lr

0000054c <fstat>:
 54c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 550:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 554:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 558:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 55c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 560:	e3a00008 	mov	r0, #8
 564:	ef000040 	svc	0x00000040
 568:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 56c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 570:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 574:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 578:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 57c:	e12fff1e 	bx	lr

00000580 <link>:
 580:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 584:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 588:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 58c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 590:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 594:	e3a00013 	mov	r0, #19
 598:	ef000040 	svc	0x00000040
 59c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5a4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ac:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5b0:	e12fff1e 	bx	lr

000005b4 <mkdir>:
 5b4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5bc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5c0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5c4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c8:	e3a00014 	mov	r0, #20
 5cc:	ef000040 	svc	0x00000040
 5d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5dc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5e0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5e4:	e12fff1e 	bx	lr

000005e8 <chdir>:
 5e8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ec:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5f0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5f4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5fc:	e3a00009 	mov	r0, #9
 600:	ef000040 	svc	0x00000040
 604:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 608:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 60c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 610:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 614:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 618:	e12fff1e 	bx	lr

0000061c <dup>:
 61c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 620:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 624:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 628:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 62c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 630:	e3a0000a 	mov	r0, #10
 634:	ef000040 	svc	0x00000040
 638:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 63c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 640:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 644:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 648:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 64c:	e12fff1e 	bx	lr

00000650 <getpid>:
 650:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 654:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 658:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 65c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 660:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 664:	e3a0000b 	mov	r0, #11
 668:	ef000040 	svc	0x00000040
 66c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 670:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 674:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 678:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 67c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 680:	e12fff1e 	bx	lr

00000684 <sbrk>:
 684:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 688:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 68c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 690:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 694:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 698:	e3a0000c 	mov	r0, #12
 69c:	ef000040 	svc	0x00000040
 6a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6b4:	e12fff1e 	bx	lr

000006b8 <sleep>:
 6b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6cc:	e3a0000d 	mov	r0, #13
 6d0:	ef000040 	svc	0x00000040
 6d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e8:	e12fff1e 	bx	lr

000006ec <uptime>:
 6ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 700:	e3a0000e 	mov	r0, #14
 704:	ef000040 	svc	0x00000040
 708:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 70c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 710:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 714:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 718:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 71c:	e12fff1e 	bx	lr

00000720 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 720:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 724:	e1a09fa1 	lsr	r9, r1, #31
 728:	e3530000 	cmp	r3, #0
 72c:	03a03000 	moveq	r3, #0
 730:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 734:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 738:	e3530000 	cmp	r3, #0
 73c:	e3008b80 	movw	r8, #2944	; 0xb80
    neg = 1;
    x = -xx;
 740:	1261e000 	rsbne	lr, r1, #0
 744:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 748:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 74c:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 750:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 754:	01a09003 	moveq	r9, r3
 758:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 75c:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 760:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 764:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 768:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 76c:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 770:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 774:	e1a0033e 	lsr	r0, lr, r3
 778:	e2000001 	and	r0, r0, #1
 77c:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 780:	e1520001 	cmp	r2, r1
            r = r - d;
 784:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 788:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 78c:	e2533001 	subs	r3, r3, #1
 790:	2afffff7 	bcs	774 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 794:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 798:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 79c:	e2873001 	add	r3, r7, #1
 7a0:	e7d8100e 	ldrb	r1, [r8, lr]
 7a4:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 7a8:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7ac:	11a07003 	movne	r7, r3
 7b0:	1affffec 	bne	768 <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 7b4:	e3590000 	cmp	r9, #0
 7b8:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 7bc:	124b201c 	subne	r2, fp, #28
 7c0:	10822003 	addne	r2, r2, r3
 7c4:	12873002 	addne	r3, r7, #2
 7c8:	e0865003 	add	r5, r6, r3
 7cc:	13a0102d 	movne	r1, #45	; 0x2d
 7d0:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7d4:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7d8:	e3a02001 	mov	r2, #1
 7dc:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7e0:	e1a00004 	mov	r0, r4
 7e4:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7e8:	ebfffefc 	bl	3e0 <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7ec:	e1560005 	cmp	r6, r5
 7f0:	1afffff7 	bne	7d4 <printint+0xb4>
    putc(fd, buf[i]);
}
 7f4:	e24bd01c 	sub	sp, fp, #28
 7f8:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000007fc <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 7fc:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 800:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 804:	e28db008 	add	fp, sp, #8
 808:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 80c:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 810:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 814:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 818:	e1a0c33e 	lsr	ip, lr, r3
 81c:	e20cc001 	and	ip, ip, #1
 820:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 824:	e1520001 	cmp	r2, r1
            r = r - d;
 828:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 82c:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 830:	e2533001 	subs	r3, r3, #1
 834:	2afffff7 	bcs	818 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 838:	e8bd8810 	pop	{r4, fp, pc}

0000083c <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 83c:	e92d000e 	push	{r1, r2, r3}
 840:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 844:	e28db01c 	add	fp, sp, #28
 848:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 84c:	e59b6004 	ldr	r6, [fp, #4]
 850:	e5d64000 	ldrb	r4, [r6]
 854:	e3540000 	cmp	r4, #0
 858:	0a00002d 	beq	914 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 85c:	e3008b94 	movw	r8, #2964	; 0xb94
 860:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 864:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 868:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 86c:	e3a05000 	mov	r5, #0
 870:	ea00000a 	b	8a0 <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 874:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 878:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 87c:	0a000004 	beq	894 <printf+0x58>
 880:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 884:	e3a02001 	mov	r2, #1
 888:	e1a00007 	mov	r0, r7
 88c:	e5614006 	strb	r4, [r1, #-6]!
 890:	ebfffed2 	bl	3e0 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 894:	e5f64001 	ldrb	r4, [r6, #1]!
 898:	e3540000 	cmp	r4, #0
 89c:	0a00001c 	beq	914 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 8a0:	e3550000 	cmp	r5, #0
 8a4:	0afffff2 	beq	874 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8a8:	e3550025 	cmp	r5, #37	; 0x25
 8ac:	1afffff8 	bne	894 <printf+0x58>
      if(c == 'd'){
 8b0:	e3540064 	cmp	r4, #100	; 0x64
 8b4:	0a000037 	beq	998 <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8b8:	e20430f7 	and	r3, r4, #247	; 0xf7
 8bc:	e3530070 	cmp	r3, #112	; 0x70
 8c0:	0a000017 	beq	924 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8c4:	e3540073 	cmp	r4, #115	; 0x73
 8c8:	0a00001c 	beq	940 <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8cc:	e3540063 	cmp	r4, #99	; 0x63
 8d0:	0a000037 	beq	9b4 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8d4:	e3540025 	cmp	r4, #37	; 0x25
 8d8:	0a000027 	beq	97c <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8dc:	e3a02001 	mov	r2, #1
 8e0:	e24b1021 	sub	r1, fp, #33	; 0x21
 8e4:	e1a00007 	mov	r0, r7
 8e8:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 8ec:	ebfffebb 	bl	3e0 <write>
 8f0:	e24b1020 	sub	r1, fp, #32
 8f4:	e3a02001 	mov	r2, #1
 8f8:	e1a00007 	mov	r0, r7
 8fc:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 900:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 904:	ebfffeb5 	bl	3e0 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 908:	e5f64001 	ldrb	r4, [r6, #1]!
 90c:	e3540000 	cmp	r4, #0
 910:	1affffe2 	bne	8a0 <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 914:	e24bd01c 	sub	sp, fp, #28
 918:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 91c:	e28dd00c 	add	sp, sp, #12
 920:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 924:	e3a03000 	mov	r3, #0
 928:	e3a02010 	mov	r2, #16
 92c:	e4991004 	ldr	r1, [r9], #4
 930:	e1a00007 	mov	r0, r7
 934:	ebffff79 	bl	720 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 938:	e3a05000 	mov	r5, #0
 93c:	eaffffd4 	b	894 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 940:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 944:	e3540000 	cmp	r4, #0
 948:	01a04008 	moveq	r4, r8
        while(*s != 0){
 94c:	e5d45000 	ldrb	r5, [r4]
 950:	e3550000 	cmp	r5, #0
 954:	0affffce 	beq	894 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 958:	e3a02001 	mov	r2, #1
 95c:	e24b1025 	sub	r1, fp, #37	; 0x25
 960:	e1a00007 	mov	r0, r7
 964:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 968:	ebfffe9c 	bl	3e0 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 96c:	e5f45001 	ldrb	r5, [r4, #1]!
 970:	e3550000 	cmp	r5, #0
 974:	1afffff7 	bne	958 <printf+0x11c>
 978:	eaffffc5 	b	894 <printf+0x58>
 97c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 980:	e3a02001 	mov	r2, #1
 984:	e1a00007 	mov	r0, r7
 988:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 98c:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 990:	ebfffe92 	bl	3e0 <write>
 994:	eaffffbe 	b	894 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 998:	e3a03001 	mov	r3, #1
 99c:	e3a0200a 	mov	r2, #10
 9a0:	e4991004 	ldr	r1, [r9], #4
 9a4:	e1a00007 	mov	r0, r7
 9a8:	ebffff5c 	bl	720 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9ac:	e3a05000 	mov	r5, #0
 9b0:	eaffffb7 	b	894 <printf+0x58>
 9b4:	e4993004 	ldr	r3, [r9], #4
 9b8:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9bc:	e3a02001 	mov	r2, #1
 9c0:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9c4:	e3a05000 	mov	r5, #0
 9c8:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9cc:	ebfffe83 	bl	3e0 <write>
 9d0:	eaffffaf 	b	894 <printf+0x58>

000009d4 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d4:	e300cb9c 	movw	ip, #2972	; 0xb9c
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9d8:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9dc:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 9e0:	e92d4810 	push	{r4, fp, lr}
 9e4:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e8:	e59c3000 	ldr	r3, [ip]
 9ec:	ea000004 	b	a04 <free+0x30>
 9f0:	e1510002 	cmp	r1, r2
 9f4:	3a000009 	bcc	a20 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f8:	e1530002 	cmp	r3, r2
 9fc:	2a000007 	bcs	a20 <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a00:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a04:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a08:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a0c:	3afffff7 	bcc	9f0 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a10:	e1530002 	cmp	r3, r2
 a14:	3afffff9 	bcc	a00 <free+0x2c>
 a18:	e1510002 	cmp	r1, r2
 a1c:	2afffff7 	bcs	a00 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a20:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a24:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a28:	e081418e 	add	r4, r1, lr, lsl #3
 a2c:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 a30:	05922004 	ldreq	r2, [r2, #4]
 a34:	0082e00e 	addeq	lr, r2, lr
 a38:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a3c:	05932000 	ldreq	r2, [r3]
 a40:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 a44:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a48:	e5932004 	ldr	r2, [r3, #4]
 a4c:	e083e182 	add	lr, r3, r2, lsl #3
 a50:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a54:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a58:	05101004 	ldreq	r1, [r0, #-4]
 a5c:	00812002 	addeq	r2, r1, r2
 a60:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a64:	05102008 	ldreq	r2, [r0, #-8]
 a68:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a6c:	e8bd8810 	pop	{r4, fp, pc}

00000a70 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a70:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a74:	e3008b9c 	movw	r8, #2972	; 0xb9c
 a78:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a7c:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 a80:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 a84:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a88:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 a8c:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a90:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a94:	0a00002a 	beq	b44 <malloc+0xd4>
 a98:	e5930000 	ldr	r0, [r3]
 a9c:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 aa0:	e1540002 	cmp	r4, r2
 aa4:	9a00001c 	bls	b1c <malloc+0xac>
 aa8:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aac:	e3005b9c 	movw	r5, #2972	; 0xb9c
 ab0:	e3405000 	movt	r5, #0
 ab4:	33a06902 	movcc	r6, #32768	; 0x8000
 ab8:	21a06184 	lslcs	r6, r4, #3
 abc:	21a07004 	movcs	r7, r4
 ac0:	33a07a01 	movcc	r7, #4096	; 0x1000
 ac4:	ea000003 	b	ad8 <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 acc:	e5902004 	ldr	r2, [r0, #4]
 ad0:	e1540002 	cmp	r4, r2
 ad4:	9a000010 	bls	b1c <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ad8:	e5982000 	ldr	r2, [r8]
 adc:	e1a03000 	mov	r3, r0
 ae0:	e1520000 	cmp	r2, r0
 ae4:	1afffff7 	bne	ac8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 ae8:	e1a00006 	mov	r0, r6
 aec:	ebfffee4 	bl	684 <sbrk>
 af0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 af4:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 af8:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 afc:	0a000004 	beq	b14 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b00:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 b04:	ebffffb2 	bl	9d4 <free>
  return freep;
 b08:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b0c:	e3530000 	cmp	r3, #0
 b10:	1affffec 	bne	ac8 <malloc+0x58>
        return 0;
 b14:	e3a00000 	mov	r0, #0
  }
}
 b18:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b1c:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 b20:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b24:	10642002 	rsbne	r2, r4, r2
 b28:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b2c:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 b30:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b34:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 b38:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b3c:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b40:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b44:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 b48:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b4c:	e5880000 	str	r0, [r8]
 b50:	e5880004 	str	r0, [r8, #4]
 b54:	eaffffd3 	b	aa8 <malloc+0x38>
