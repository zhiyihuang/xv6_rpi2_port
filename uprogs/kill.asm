
_kill:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int i;

  if(argc < 1){
   4:	e2506000 	subs	r6, r0, #0
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   8:	e28db014 	add	fp, sp, #20
  int i;

  if(argc < 1){
   c:	da00000a 	ble	3c <main+0x3c>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  10:	e3560001 	cmp	r6, #1
  14:	11a05001 	movne	r5, r1
  18:	13a04001 	movne	r4, #1
  1c:	0a000005 	beq	38 <main+0x38>
    kill(atoi(argv[i]));
  20:	e5b50004 	ldr	r0, [r5, #4]!

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  24:	e2844001 	add	r4, r4, #1
    kill(atoi(argv[i]));
  28:	eb000089 	bl	254 <atoi>
  2c:	eb000103 	bl	440 <kill>

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  30:	e1560004 	cmp	r6, r4
  34:	1afffff9 	bne	20 <main+0x20>
{
  int i;

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  38:	eb0000b2 	bl	308 <exit>
main(int argc, char **argv)
{
  int i;

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
  3c:	e3001b50 	movw	r1, #2896	; 0xb50
  40:	e3a00002 	mov	r0, #2
  44:	e3401000 	movt	r1, #0
  48:	eb0001f9 	bl	834 <printf>
  4c:	eafffff9 	b	38 <main+0x38>

00000050 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  50:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  54:	e2402001 	sub	r2, r0, #1
  58:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  5c:	e4d13001 	ldrb	r3, [r1], #1
  60:	e3530000 	cmp	r3, #0
  64:	e5e23001 	strb	r3, [r2, #1]!
  68:	1afffffb 	bne	5c <strcpy+0xc>
    ;
  return os;
}
  6c:	e24bd000 	sub	sp, fp, #0
  70:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  74:	e12fff1e 	bx	lr

00000078 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  78:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  7c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  80:	e5d03000 	ldrb	r3, [r0]
  84:	e3530000 	cmp	r3, #0
  88:	05d10000 	ldrbeq	r0, [r1]
  8c:	0a00000a 	beq	bc <strcmp+0x44>
  90:	e5d12000 	ldrb	r2, [r1]
  94:	e1530002 	cmp	r3, r2
  98:	0a000003 	beq	ac <strcmp+0x34>
  9c:	ea00000a 	b	cc <strcmp+0x54>
  a0:	e5f12001 	ldrb	r2, [r1, #1]!
  a4:	e1530002 	cmp	r3, r2
  a8:	1a000007 	bne	cc <strcmp+0x54>
  ac:	e5f03001 	ldrb	r3, [r0, #1]!
  b0:	e3530000 	cmp	r3, #0
  b4:	1afffff9 	bne	a0 <strcmp+0x28>
  b8:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  bc:	e0600003 	rsb	r0, r0, r3
  c0:	e24bd000 	sub	sp, fp, #0
  c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  c8:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  cc:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  d0:	e0600003 	rsb	r0, r0, r3
  d4:	e24bd000 	sub	sp, fp, #0
  d8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  dc:	e12fff1e 	bx	lr

000000e0 <strlen>:

uint
strlen(char *s)
{
  e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  e4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
  e8:	e5d03000 	ldrb	r3, [r0]
  ec:	e3530000 	cmp	r3, #0
  f0:	0a000009 	beq	11c <strlen+0x3c>
  f4:	e1a02000 	mov	r2, r0
  f8:	e3a03000 	mov	r3, #0
  fc:	e5f21001 	ldrb	r1, [r2, #1]!
 100:	e2833001 	add	r3, r3, #1
 104:	e3510000 	cmp	r1, #0
 108:	e1a00003 	mov	r0, r3
 10c:	1afffffa 	bne	fc <strlen+0x1c>
    ;
  return n;
}
 110:	e24bd000 	sub	sp, fp, #0
 114:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 118:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 11c:	e1a00003 	mov	r0, r3
 120:	eafffffa 	b	110 <strlen+0x30>

00000124 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 124:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 128:	e1a03000 	mov	r3, r0
 12c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 130:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 134:	0a000004 	beq	14c <memset+0x28>
 138:	e6ef1071 	uxtb	r1, r1
 13c:	e0800002 	add	r0, r0, r2
 140:	e4c31001 	strb	r1, [r3], #1
 144:	e1500003 	cmp	r0, r3
 148:	1afffffc 	bne	140 <memset+0x1c>
  return (void *)p;
}
 14c:	e24bd000 	sub	sp, fp, #0
 150:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 154:	e12fff1e 	bx	lr

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 15c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 160:	e5d02000 	ldrb	r2, [r0]
 164:	e3520000 	cmp	r2, #0
 168:	0a00000b 	beq	19c <strchr+0x44>
    if(*s == c)
 16c:	e1510002 	cmp	r1, r2
 170:	1a000002 	bne	180 <strchr+0x28>
 174:	ea000005 	b	190 <strchr+0x38>
 178:	e1530001 	cmp	r3, r1
 17c:	0a000003 	beq	190 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 180:	e5f03001 	ldrb	r3, [r0, #1]!
 184:	e3530000 	cmp	r3, #0
 188:	1afffffa 	bne	178 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 18c:	e1a00003 	mov	r0, r3
}
 190:	e24bd000 	sub	sp, fp, #0
 194:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 198:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 19c:	e1a00002 	mov	r0, r2
 1a0:	eafffffa 	b	190 <strchr+0x38>

000001a4 <gets>:
}

char*
gets(char *buf, int max)
{
 1a4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1a8:	e1a08000 	mov	r8, r0
 1ac:	e28db018 	add	fp, sp, #24
 1b0:	e1a07001 	mov	r7, r1
 1b4:	e24dd00c 	sub	sp, sp, #12
 1b8:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1bc:	e3a05000 	mov	r5, #0
 1c0:	ea000008 	b	1e8 <gets+0x44>
    cc = read(0, &c, 1);
 1c4:	eb000076 	bl	3a4 <read>
    if(cc < 1)
 1c8:	e3500000 	cmp	r0, #0
 1cc:	da00000b 	ble	200 <gets+0x5c>
      break;
    buf[i++] = c;
 1d0:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1d4:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 1d8:	e353000d 	cmp	r3, #13
 1dc:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1e0:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 1e4:	0a000005 	beq	200 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e8:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ec:	e0854002 	add	r4, r5, r2
 1f0:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 1f4:	e24b101d 	sub	r1, fp, #29
 1f8:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fc:	bafffff0 	blt	1c4 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 200:	e3a03000 	mov	r3, #0
  return buf;
}
 204:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 208:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 20c:	e24bd018 	sub	sp, fp, #24
 210:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000214 <stat>:

int
stat(char *n, struct stat *st)
{
 214:	e92d4830 	push	{r4, r5, fp, lr}
 218:	e1a04001 	mov	r4, r1
 21c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 220:	e3a01000 	mov	r1, #0
 224:	eb00009f 	bl	4a8 <open>
  if(fd < 0)
 228:	e2505000 	subs	r5, r0, #0
 22c:	ba000006 	blt	24c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 230:	e1a01004 	mov	r1, r4
 234:	eb0000c2 	bl	544 <fstat>
 238:	e1a04000 	mov	r4, r0
  close(fd);
 23c:	e1a00005 	mov	r0, r5
 240:	eb000071 	bl	40c <close>
  return r;
 244:	e1a00004 	mov	r0, r4
 248:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 24c:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 250:	e8bd8830 	pop	{r4, r5, fp, pc}

00000254 <atoi>:

int
atoi(const char *s)
{
 254:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 258:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25c:	e5d01000 	ldrb	r1, [r0]
 260:	e2413030 	sub	r3, r1, #48	; 0x30
 264:	e3530009 	cmp	r3, #9
 268:	e3a03000 	mov	r3, #0
 26c:	8a000007 	bhi	290 <atoi+0x3c>
    n = n*10 + *s++ - '0';
 270:	e1a02183 	lsl	r2, r3, #3
 274:	e0823083 	add	r3, r2, r3, lsl #1
 278:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 27c:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 280:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 284:	e2412030 	sub	r2, r1, #48	; 0x30
 288:	e3520009 	cmp	r2, #9
 28c:	9afffff7 	bls	270 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 290:	e1a00003 	mov	r0, r3
 294:	e24bd000 	sub	sp, fp, #0
 298:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 29c:	e12fff1e 	bx	lr

000002a0 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a0:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 2a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2a8:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ac:	da000005 	ble	2c8 <memmove+0x28>
 2b0:	e0812002 	add	r2, r1, r2
 2b4:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2b8:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2bc:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2c0:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c4:	1afffffb 	bne	2b8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2c8:	e24bd000 	sub	sp, fp, #0
 2cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d0:	e12fff1e 	bx	lr

000002d4 <fork>:
 2d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 2e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 2e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 2e8:	e3a00001 	mov	r0, #1
 2ec:	ef000040 	svc	0x00000040
 2f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 2f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 2fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 300:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 304:	e12fff1e 	bx	lr

00000308 <exit>:
 308:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 30c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 310:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 314:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 318:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 31c:	e3a00002 	mov	r0, #2
 320:	ef000040 	svc	0x00000040
 324:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 328:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 32c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 330:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 334:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 338:	e12fff1e 	bx	lr

0000033c <wait>:
 33c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 340:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 344:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 348:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 34c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 350:	e3a00003 	mov	r0, #3
 354:	ef000040 	svc	0x00000040
 358:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 35c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 360:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 364:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 368:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 36c:	e12fff1e 	bx	lr

00000370 <pipe>:
 370:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 374:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 378:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 37c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 380:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 384:	e3a00004 	mov	r0, #4
 388:	ef000040 	svc	0x00000040
 38c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 390:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 394:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 398:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 39c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3a0:	e12fff1e 	bx	lr

000003a4 <read>:
 3a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3b8:	e3a00005 	mov	r0, #5
 3bc:	ef000040 	svc	0x00000040
 3c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3d4:	e12fff1e 	bx	lr

000003d8 <write>:
 3d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3ec:	e3a00010 	mov	r0, #16
 3f0:	ef000040 	svc	0x00000040
 3f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 400:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 404:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 408:	e12fff1e 	bx	lr

0000040c <close>:
 40c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 410:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 414:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 418:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 41c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 420:	e3a00015 	mov	r0, #21
 424:	ef000040 	svc	0x00000040
 428:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 42c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 430:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 434:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 438:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 43c:	e12fff1e 	bx	lr

00000440 <kill>:
 440:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 444:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 448:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 44c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 450:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 454:	e3a00006 	mov	r0, #6
 458:	ef000040 	svc	0x00000040
 45c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 460:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 464:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 468:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 46c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 470:	e12fff1e 	bx	lr

00000474 <exec>:
 474:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 478:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 47c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 480:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 484:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 488:	e3a00007 	mov	r0, #7
 48c:	ef000040 	svc	0x00000040
 490:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 494:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 498:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 49c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a4:	e12fff1e 	bx	lr

000004a8 <open>:
 4a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4bc:	e3a0000f 	mov	r0, #15
 4c0:	ef000040 	svc	0x00000040
 4c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d8:	e12fff1e 	bx	lr

000004dc <mknod>:
 4dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4f0:	e3a00011 	mov	r0, #17
 4f4:	ef000040 	svc	0x00000040
 4f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 500:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 504:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 508:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 50c:	e12fff1e 	bx	lr

00000510 <unlink>:
 510:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 514:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 518:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 51c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 520:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 524:	e3a00012 	mov	r0, #18
 528:	ef000040 	svc	0x00000040
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 534:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 538:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 53c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 540:	e12fff1e 	bx	lr

00000544 <fstat>:
 544:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 548:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 54c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 550:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 554:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 558:	e3a00008 	mov	r0, #8
 55c:	ef000040 	svc	0x00000040
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 568:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 56c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 570:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 574:	e12fff1e 	bx	lr

00000578 <link>:
 578:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 57c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 580:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 584:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 588:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 58c:	e3a00013 	mov	r0, #19
 590:	ef000040 	svc	0x00000040
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 59c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a8:	e12fff1e 	bx	lr

000005ac <mkdir>:
 5ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5c0:	e3a00014 	mov	r0, #20
 5c4:	ef000040 	svc	0x00000040
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5dc:	e12fff1e 	bx	lr

000005e0 <chdir>:
 5e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f4:	e3a00009 	mov	r0, #9
 5f8:	ef000040 	svc	0x00000040
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 604:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 608:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 60c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 610:	e12fff1e 	bx	lr

00000614 <dup>:
 614:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 618:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 61c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 620:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 624:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 628:	e3a0000a 	mov	r0, #10
 62c:	ef000040 	svc	0x00000040
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 638:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 63c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 640:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 644:	e12fff1e 	bx	lr

00000648 <getpid>:
 648:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 64c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 650:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 654:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 658:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 65c:	e3a0000b 	mov	r0, #11
 660:	ef000040 	svc	0x00000040
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 66c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 670:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 674:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 678:	e12fff1e 	bx	lr

0000067c <sbrk>:
 67c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 680:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 684:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 688:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 68c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 690:	e3a0000c 	mov	r0, #12
 694:	ef000040 	svc	0x00000040
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6ac:	e12fff1e 	bx	lr

000006b0 <sleep>:
 6b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c4:	e3a0000d 	mov	r0, #13
 6c8:	ef000040 	svc	0x00000040
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6e0:	e12fff1e 	bx	lr

000006e4 <uptime>:
 6e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f8:	e3a0000e 	mov	r0, #14
 6fc:	ef000040 	svc	0x00000040
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 708:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 70c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 710:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 714:	e12fff1e 	bx	lr

00000718 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 718:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 71c:	e1a09fa1 	lsr	r9, r1, #31
 720:	e3530000 	cmp	r3, #0
 724:	03a03000 	moveq	r3, #0
 728:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 72c:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 730:	e3530000 	cmp	r3, #0
 734:	e3008b64 	movw	r8, #2916	; 0xb64
    neg = 1;
    x = -xx;
 738:	1261e000 	rsbne	lr, r1, #0
 73c:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 740:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 744:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 748:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 74c:	01a09003 	moveq	r9, r3
 750:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 754:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 758:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 75c:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 760:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 764:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 768:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 76c:	e1a0033e 	lsr	r0, lr, r3
 770:	e2000001 	and	r0, r0, #1
 774:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 778:	e1520001 	cmp	r2, r1
            r = r - d;
 77c:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 780:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 784:	e2533001 	subs	r3, r3, #1
 788:	2afffff7 	bcs	76c <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 78c:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 790:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 794:	e2873001 	add	r3, r7, #1
 798:	e7d8100e 	ldrb	r1, [r8, lr]
 79c:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 7a0:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7a4:	11a07003 	movne	r7, r3
 7a8:	1affffec 	bne	760 <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 7ac:	e3590000 	cmp	r9, #0
 7b0:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 7b4:	124b201c 	subne	r2, fp, #28
 7b8:	10822003 	addne	r2, r2, r3
 7bc:	12873002 	addne	r3, r7, #2
 7c0:	e0865003 	add	r5, r6, r3
 7c4:	13a0102d 	movne	r1, #45	; 0x2d
 7c8:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7cc:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7d0:	e3a02001 	mov	r2, #1
 7d4:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7d8:	e1a00004 	mov	r0, r4
 7dc:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 7e0:	ebfffefc 	bl	3d8 <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 7e4:	e1560005 	cmp	r6, r5
 7e8:	1afffff7 	bne	7cc <printint+0xb4>
    putc(fd, buf[i]);
}
 7ec:	e24bd01c 	sub	sp, fp, #28
 7f0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000007f4 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 7f4:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 7f8:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 7fc:	e28db008 	add	fp, sp, #8
 800:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 804:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 808:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 80c:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 810:	e1a0c33e 	lsr	ip, lr, r3
 814:	e20cc001 	and	ip, ip, #1
 818:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 81c:	e1520001 	cmp	r2, r1
            r = r - d;
 820:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 824:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 828:	e2533001 	subs	r3, r3, #1
 82c:	2afffff7 	bcs	810 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 830:	e8bd8810 	pop	{r4, fp, pc}

00000834 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 834:	e92d000e 	push	{r1, r2, r3}
 838:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 83c:	e28db01c 	add	fp, sp, #28
 840:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 844:	e59b6004 	ldr	r6, [fp, #4]
 848:	e5d64000 	ldrb	r4, [r6]
 84c:	e3540000 	cmp	r4, #0
 850:	0a00002d 	beq	90c <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 854:	e3008b78 	movw	r8, #2936	; 0xb78
 858:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 85c:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 860:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 864:	e3a05000 	mov	r5, #0
 868:	ea00000a 	b	898 <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 86c:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 870:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 874:	0a000004 	beq	88c <printf+0x58>
 878:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 87c:	e3a02001 	mov	r2, #1
 880:	e1a00007 	mov	r0, r7
 884:	e5614006 	strb	r4, [r1, #-6]!
 888:	ebfffed2 	bl	3d8 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 88c:	e5f64001 	ldrb	r4, [r6, #1]!
 890:	e3540000 	cmp	r4, #0
 894:	0a00001c 	beq	90c <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 898:	e3550000 	cmp	r5, #0
 89c:	0afffff2 	beq	86c <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8a0:	e3550025 	cmp	r5, #37	; 0x25
 8a4:	1afffff8 	bne	88c <printf+0x58>
      if(c == 'd'){
 8a8:	e3540064 	cmp	r4, #100	; 0x64
 8ac:	0a000037 	beq	990 <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8b0:	e20430f7 	and	r3, r4, #247	; 0xf7
 8b4:	e3530070 	cmp	r3, #112	; 0x70
 8b8:	0a000017 	beq	91c <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8bc:	e3540073 	cmp	r4, #115	; 0x73
 8c0:	0a00001c 	beq	938 <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8c4:	e3540063 	cmp	r4, #99	; 0x63
 8c8:	0a000037 	beq	9ac <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8cc:	e3540025 	cmp	r4, #37	; 0x25
 8d0:	0a000027 	beq	974 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8d4:	e3a02001 	mov	r2, #1
 8d8:	e24b1021 	sub	r1, fp, #33	; 0x21
 8dc:	e1a00007 	mov	r0, r7
 8e0:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 8e4:	ebfffebb 	bl	3d8 <write>
 8e8:	e24b1020 	sub	r1, fp, #32
 8ec:	e3a02001 	mov	r2, #1
 8f0:	e1a00007 	mov	r0, r7
 8f4:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8f8:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8fc:	ebfffeb5 	bl	3d8 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 900:	e5f64001 	ldrb	r4, [r6, #1]!
 904:	e3540000 	cmp	r4, #0
 908:	1affffe2 	bne	898 <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 90c:	e24bd01c 	sub	sp, fp, #28
 910:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 914:	e28dd00c 	add	sp, sp, #12
 918:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 91c:	e3a03000 	mov	r3, #0
 920:	e3a02010 	mov	r2, #16
 924:	e4991004 	ldr	r1, [r9], #4
 928:	e1a00007 	mov	r0, r7
 92c:	ebffff79 	bl	718 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 930:	e3a05000 	mov	r5, #0
 934:	eaffffd4 	b	88c <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 938:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 93c:	e3540000 	cmp	r4, #0
 940:	01a04008 	moveq	r4, r8
        while(*s != 0){
 944:	e5d45000 	ldrb	r5, [r4]
 948:	e3550000 	cmp	r5, #0
 94c:	0affffce 	beq	88c <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 950:	e3a02001 	mov	r2, #1
 954:	e24b1025 	sub	r1, fp, #37	; 0x25
 958:	e1a00007 	mov	r0, r7
 95c:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 960:	ebfffe9c 	bl	3d8 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 964:	e5f45001 	ldrb	r5, [r4, #1]!
 968:	e3550000 	cmp	r5, #0
 96c:	1afffff7 	bne	950 <printf+0x11c>
 970:	eaffffc5 	b	88c <printf+0x58>
 974:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 978:	e3a02001 	mov	r2, #1
 97c:	e1a00007 	mov	r0, r7
 980:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 984:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 988:	ebfffe92 	bl	3d8 <write>
 98c:	eaffffbe 	b	88c <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 990:	e3a03001 	mov	r3, #1
 994:	e3a0200a 	mov	r2, #10
 998:	e4991004 	ldr	r1, [r9], #4
 99c:	e1a00007 	mov	r0, r7
 9a0:	ebffff5c 	bl	718 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9a4:	e3a05000 	mov	r5, #0
 9a8:	eaffffb7 	b	88c <printf+0x58>
 9ac:	e4993004 	ldr	r3, [r9], #4
 9b0:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9b4:	e3a02001 	mov	r2, #1
 9b8:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9bc:	e3a05000 	mov	r5, #0
 9c0:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9c4:	ebfffe83 	bl	3d8 <write>
 9c8:	eaffffaf 	b	88c <printf+0x58>

000009cc <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9cc:	e300cb80 	movw	ip, #2944	; 0xb80
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9d0:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d4:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 9d8:	e92d4810 	push	{r4, fp, lr}
 9dc:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9e0:	e59c3000 	ldr	r3, [ip]
 9e4:	ea000004 	b	9fc <free+0x30>
 9e8:	e1510002 	cmp	r1, r2
 9ec:	3a000009 	bcc	a18 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9f0:	e1530002 	cmp	r3, r2
 9f4:	2a000007 	bcs	a18 <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 9f8:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9fc:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a00:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a04:	3afffff7 	bcc	9e8 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a08:	e1530002 	cmp	r3, r2
 a0c:	3afffff9 	bcc	9f8 <free+0x2c>
 a10:	e1510002 	cmp	r1, r2
 a14:	2afffff7 	bcs	9f8 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a18:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a1c:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a20:	e081418e 	add	r4, r1, lr, lsl #3
 a24:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 a28:	05922004 	ldreq	r2, [r2, #4]
 a2c:	0082e00e 	addeq	lr, r2, lr
 a30:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a34:	05932000 	ldreq	r2, [r3]
 a38:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 a3c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a40:	e5932004 	ldr	r2, [r3, #4]
 a44:	e083e182 	add	lr, r3, r2, lsl #3
 a48:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a4c:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a50:	05101004 	ldreq	r1, [r0, #-4]
 a54:	00812002 	addeq	r2, r1, r2
 a58:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a5c:	05102008 	ldreq	r2, [r0, #-8]
 a60:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a64:	e8bd8810 	pop	{r4, fp, pc}

00000a68 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a68:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a6c:	e3008b80 	movw	r8, #2944	; 0xb80
 a70:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a74:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 a78:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 a7c:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a80:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 a84:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a88:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 a8c:	0a00002a 	beq	b3c <malloc+0xd4>
 a90:	e5930000 	ldr	r0, [r3]
 a94:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 a98:	e1540002 	cmp	r4, r2
 a9c:	9a00001c 	bls	b14 <malloc+0xac>
 aa0:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 aa4:	e3005b80 	movw	r5, #2944	; 0xb80
 aa8:	e3405000 	movt	r5, #0
 aac:	33a06902 	movcc	r6, #32768	; 0x8000
 ab0:	21a06184 	lslcs	r6, r4, #3
 ab4:	21a07004 	movcs	r7, r4
 ab8:	33a07a01 	movcc	r7, #4096	; 0x1000
 abc:	ea000003 	b	ad0 <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ac4:	e5902004 	ldr	r2, [r0, #4]
 ac8:	e1540002 	cmp	r4, r2
 acc:	9a000010 	bls	b14 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ad0:	e5982000 	ldr	r2, [r8]
 ad4:	e1a03000 	mov	r3, r0
 ad8:	e1520000 	cmp	r2, r0
 adc:	1afffff7 	bne	ac0 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 ae0:	e1a00006 	mov	r0, r6
 ae4:	ebfffee4 	bl	67c <sbrk>
 ae8:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 aec:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 af0:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 af4:	0a000004 	beq	b0c <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 af8:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 afc:	ebffffb2 	bl	9cc <free>
  return freep;
 b00:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b04:	e3530000 	cmp	r3, #0
 b08:	1affffec 	bne	ac0 <malloc+0x58>
        return 0;
 b0c:	e3a00000 	mov	r0, #0
  }
}
 b10:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b14:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 b18:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b1c:	10642002 	rsbne	r2, r4, r2
 b20:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b24:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 b28:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b2c:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 b30:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b34:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b38:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b3c:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 b40:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b44:	e5880000 	str	r0, [r8]
 b48:	e5880004 	str	r0, [r8, #4]
 b4c:	eaffffd3 	b	aa0 <malloc+0x38>
