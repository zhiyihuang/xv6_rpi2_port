
_init:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   0:	e3000be4 	movw	r0, #3044	; 0xbe4
   4:	e3a01002 	mov	r1, #2

char *argv[] = { "sh", 0 };

int
main(void)
{
   8:	e92d4830 	push	{r4, r5, fp, lr}
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   c:	e3400000 	movt	r0, #0

char *argv[] = { "sh", 0 };

int
main(void)
{
  10:	e28db00c 	add	fp, sp, #12
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  14:	eb000148 	bl	53c <open>
  18:	e3500000 	cmp	r0, #0
  1c:	ba000026 	blt	bc <main+0xbc>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  20:	e3a00000 	mov	r0, #0
  24:	eb00019f 	bl	6a8 <dup>
  dup(0);  // stderr
  28:	e3a00000 	mov	r0, #0
  2c:	eb00019d 	bl	6a8 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  30:	e3001bec 	movw	r1, #3052	; 0xbec
  34:	e3a00001 	mov	r0, #1
  38:	e3401000 	movt	r1, #0
  3c:	eb000221 	bl	8c8 <printf>
    pid = fork();
  40:	eb0000c8 	bl	368 <fork>
    if(pid < 0){
  44:	e2504000 	subs	r4, r0, #0
  48:	ba00000c 	blt	80 <main+0x80>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  4c:	0a000010 	beq	94 <main+0x94>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  50:	eb0000de 	bl	3d0 <wait>
  54:	e1540000 	cmp	r4, r0
  58:	e1e03000 	mvn	r3, r0
  5c:	e1a03fa3 	lsr	r3, r3, #31
  60:	03a03000 	moveq	r3, #0
  64:	e3530000 	cmp	r3, #0
  68:	0afffff0 	beq	30 <main+0x30>
      printf(1, "zombie!\n");
  6c:	e3001c30 	movw	r1, #3120	; 0xc30
  70:	e3a00001 	mov	r0, #1
  74:	e3401000 	movt	r1, #0
  78:	eb000212 	bl	8c8 <printf>
  7c:	eafffff3 	b	50 <main+0x50>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  80:	e3001c00 	movw	r1, #3072	; 0xc00
  84:	e3a00001 	mov	r0, #1
  88:	e3401000 	movt	r1, #0
  8c:	eb00020d 	bl	8c8 <printf>
      exit();
  90:	eb0000c1 	bl	39c <exit>
    }
    if(pid == 0){
      exec("sh", argv);
  94:	e3001c58 	movw	r1, #3160	; 0xc58
  98:	e3000c14 	movw	r0, #3092	; 0xc14
  9c:	e3401000 	movt	r1, #0
  a0:	e3400000 	movt	r0, #0
  a4:	eb000117 	bl	508 <exec>
      printf(1, "init: exec sh failed\n");
  a8:	e3001c18 	movw	r1, #3096	; 0xc18
  ac:	e3401000 	movt	r1, #0
  b0:	e3a00001 	mov	r0, #1
  b4:	eb000203 	bl	8c8 <printf>
      exit();
  b8:	eb0000b7 	bl	39c <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
  bc:	e3a02001 	mov	r2, #1
  c0:	e3000be4 	movw	r0, #3044	; 0xbe4
  c4:	e1a01002 	mov	r1, r2
  c8:	e3400000 	movt	r0, #0
  cc:	eb000127 	bl	570 <mknod>
    open("console", O_RDWR);
  d0:	e3000be4 	movw	r0, #3044	; 0xbe4
  d4:	e3a01002 	mov	r1, #2
  d8:	e3400000 	movt	r0, #0
  dc:	eb000116 	bl	53c <open>
  e0:	eaffffce 	b	20 <main+0x20>

000000e4 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  e8:	e2402001 	sub	r2, r0, #1
  ec:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f0:	e4d13001 	ldrb	r3, [r1], #1
  f4:	e3530000 	cmp	r3, #0
  f8:	e5e23001 	strb	r3, [r2, #1]!
  fc:	1afffffb 	bne	f0 <strcpy+0xc>
    ;
  return os;
}
 100:	e24bd000 	sub	sp, fp, #0
 104:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 108:	e12fff1e 	bx	lr

0000010c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 10c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 110:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 114:	e5d03000 	ldrb	r3, [r0]
 118:	e3530000 	cmp	r3, #0
 11c:	05d10000 	ldrbeq	r0, [r1]
 120:	0a00000a 	beq	150 <strcmp+0x44>
 124:	e5d12000 	ldrb	r2, [r1]
 128:	e1530002 	cmp	r3, r2
 12c:	0a000003 	beq	140 <strcmp+0x34>
 130:	ea00000a 	b	160 <strcmp+0x54>
 134:	e5f12001 	ldrb	r2, [r1, #1]!
 138:	e1530002 	cmp	r3, r2
 13c:	1a000007 	bne	160 <strcmp+0x54>
 140:	e5f03001 	ldrb	r3, [r0, #1]!
 144:	e3530000 	cmp	r3, #0
 148:	1afffff9 	bne	134 <strcmp+0x28>
 14c:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 150:	e0600003 	rsb	r0, r0, r3
 154:	e24bd000 	sub	sp, fp, #0
 158:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 15c:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 160:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 164:	e0600003 	rsb	r0, r0, r3
 168:	e24bd000 	sub	sp, fp, #0
 16c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 170:	e12fff1e 	bx	lr

00000174 <strlen>:

uint
strlen(char *s)
{
 174:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 178:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 17c:	e5d03000 	ldrb	r3, [r0]
 180:	e3530000 	cmp	r3, #0
 184:	0a000009 	beq	1b0 <strlen+0x3c>
 188:	e1a02000 	mov	r2, r0
 18c:	e3a03000 	mov	r3, #0
 190:	e5f21001 	ldrb	r1, [r2, #1]!
 194:	e2833001 	add	r3, r3, #1
 198:	e3510000 	cmp	r1, #0
 19c:	e1a00003 	mov	r0, r3
 1a0:	1afffffa 	bne	190 <strlen+0x1c>
    ;
  return n;
}
 1a4:	e24bd000 	sub	sp, fp, #0
 1a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1ac:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1b0:	e1a00003 	mov	r0, r3
 1b4:	eafffffa 	b	1a4 <strlen+0x30>

000001b8 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1b8:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 1bc:	e1a03000 	mov	r3, r0
 1c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1c4:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1c8:	0a000004 	beq	1e0 <memset+0x28>
 1cc:	e6ef1071 	uxtb	r1, r1
 1d0:	e0800002 	add	r0, r0, r2
 1d4:	e4c31001 	strb	r1, [r3], #1
 1d8:	e1500003 	cmp	r0, r3
 1dc:	1afffffc 	bne	1d4 <memset+0x1c>
  return (void *)p;
}
 1e0:	e24bd000 	sub	sp, fp, #0
 1e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1e8:	e12fff1e 	bx	lr

000001ec <strchr>:

char*
strchr(const char *s, char c)
{
 1ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1f0:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1f4:	e5d02000 	ldrb	r2, [r0]
 1f8:	e3520000 	cmp	r2, #0
 1fc:	0a00000b 	beq	230 <strchr+0x44>
    if(*s == c)
 200:	e1510002 	cmp	r1, r2
 204:	1a000002 	bne	214 <strchr+0x28>
 208:	ea000005 	b	224 <strchr+0x38>
 20c:	e1530001 	cmp	r3, r1
 210:	0a000003 	beq	224 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 214:	e5f03001 	ldrb	r3, [r0, #1]!
 218:	e3530000 	cmp	r3, #0
 21c:	1afffffa 	bne	20c <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 220:	e1a00003 	mov	r0, r3
}
 224:	e24bd000 	sub	sp, fp, #0
 228:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 22c:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 230:	e1a00002 	mov	r0, r2
 234:	eafffffa 	b	224 <strchr+0x38>

00000238 <gets>:
}

char*
gets(char *buf, int max)
{
 238:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 23c:	e1a08000 	mov	r8, r0
 240:	e28db018 	add	fp, sp, #24
 244:	e1a07001 	mov	r7, r1
 248:	e24dd00c 	sub	sp, sp, #12
 24c:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 250:	e3a05000 	mov	r5, #0
 254:	ea000008 	b	27c <gets+0x44>
    cc = read(0, &c, 1);
 258:	eb000076 	bl	438 <read>
    if(cc < 1)
 25c:	e3500000 	cmp	r0, #0
 260:	da00000b 	ble	294 <gets+0x5c>
      break;
    buf[i++] = c;
 264:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 268:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 26c:	e353000d 	cmp	r3, #13
 270:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 274:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 278:	0a000005 	beq	294 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 27c:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 280:	e0854002 	add	r4, r5, r2
 284:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 288:	e24b101d 	sub	r1, fp, #29
 28c:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 290:	bafffff0 	blt	258 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 294:	e3a03000 	mov	r3, #0
  return buf;
}
 298:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 29c:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 2a0:	e24bd018 	sub	sp, fp, #24
 2a4:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

000002a8 <stat>:

int
stat(char *n, struct stat *st)
{
 2a8:	e92d4830 	push	{r4, r5, fp, lr}
 2ac:	e1a04001 	mov	r4, r1
 2b0:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b4:	e3a01000 	mov	r1, #0
 2b8:	eb00009f 	bl	53c <open>
  if(fd < 0)
 2bc:	e2505000 	subs	r5, r0, #0
 2c0:	ba000006 	blt	2e0 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 2c4:	e1a01004 	mov	r1, r4
 2c8:	eb0000c2 	bl	5d8 <fstat>
 2cc:	e1a04000 	mov	r4, r0
  close(fd);
 2d0:	e1a00005 	mov	r0, r5
 2d4:	eb000071 	bl	4a0 <close>
  return r;
 2d8:	e1a00004 	mov	r0, r4
 2dc:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2e0:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 2e4:	e8bd8830 	pop	{r4, r5, fp, pc}

000002e8 <atoi>:

int
atoi(const char *s)
{
 2e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2ec:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f0:	e5d01000 	ldrb	r1, [r0]
 2f4:	e2413030 	sub	r3, r1, #48	; 0x30
 2f8:	e3530009 	cmp	r3, #9
 2fc:	e3a03000 	mov	r3, #0
 300:	8a000007 	bhi	324 <atoi+0x3c>
    n = n*10 + *s++ - '0';
 304:	e1a02183 	lsl	r2, r3, #3
 308:	e0823083 	add	r3, r2, r3, lsl #1
 30c:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 310:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 314:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 318:	e2412030 	sub	r2, r1, #48	; 0x30
 31c:	e3520009 	cmp	r2, #9
 320:	9afffff7 	bls	304 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 324:	e1a00003 	mov	r0, r3
 328:	e24bd000 	sub	sp, fp, #0
 32c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 330:	e12fff1e 	bx	lr

00000334 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 334:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 338:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 33c:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 340:	da000005 	ble	35c <memmove+0x28>
 344:	e0812002 	add	r2, r1, r2
 348:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 34c:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 350:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 354:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 358:	1afffffb 	bne	34c <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 35c:	e24bd000 	sub	sp, fp, #0
 360:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 364:	e12fff1e 	bx	lr

00000368 <fork>:
 368:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 36c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 370:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 374:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 378:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 37c:	e3a00001 	mov	r0, #1
 380:	ef000040 	svc	0x00000040
 384:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 388:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 38c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 390:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 394:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 398:	e12fff1e 	bx	lr

0000039c <exit>:
 39c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3b0:	e3a00002 	mov	r0, #2
 3b4:	ef000040 	svc	0x00000040
 3b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3cc:	e12fff1e 	bx	lr

000003d0 <wait>:
 3d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3e4:	e3a00003 	mov	r0, #3
 3e8:	ef000040 	svc	0x00000040
 3ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 400:	e12fff1e 	bx	lr

00000404 <pipe>:
 404:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 408:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 40c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 410:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 414:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 418:	e3a00004 	mov	r0, #4
 41c:	ef000040 	svc	0x00000040
 420:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 424:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 428:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 42c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 430:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 434:	e12fff1e 	bx	lr

00000438 <read>:
 438:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 43c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 440:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 444:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 448:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 44c:	e3a00005 	mov	r0, #5
 450:	ef000040 	svc	0x00000040
 454:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 458:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 45c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 460:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 464:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 468:	e12fff1e 	bx	lr

0000046c <write>:
 46c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 470:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 474:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 478:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 47c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 480:	e3a00010 	mov	r0, #16
 484:	ef000040 	svc	0x00000040
 488:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 48c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 490:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 494:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 498:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 49c:	e12fff1e 	bx	lr

000004a0 <close>:
 4a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4b4:	e3a00015 	mov	r0, #21
 4b8:	ef000040 	svc	0x00000040
 4bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d0:	e12fff1e 	bx	lr

000004d4 <kill>:
 4d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e8:	e3a00006 	mov	r0, #6
 4ec:	ef000040 	svc	0x00000040
 4f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 500:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 504:	e12fff1e 	bx	lr

00000508 <exec>:
 508:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 50c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 510:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 514:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 518:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 51c:	e3a00007 	mov	r0, #7
 520:	ef000040 	svc	0x00000040
 524:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 52c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 530:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 534:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 538:	e12fff1e 	bx	lr

0000053c <open>:
 53c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 540:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 544:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 548:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 54c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 550:	e3a0000f 	mov	r0, #15
 554:	ef000040 	svc	0x00000040
 558:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 55c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 560:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 564:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 568:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 56c:	e12fff1e 	bx	lr

00000570 <mknod>:
 570:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 574:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 578:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 57c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 580:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 584:	e3a00011 	mov	r0, #17
 588:	ef000040 	svc	0x00000040
 58c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 594:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 598:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 59c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a0:	e12fff1e 	bx	lr

000005a4 <unlink>:
 5a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b8:	e3a00012 	mov	r0, #18
 5bc:	ef000040 	svc	0x00000040
 5c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d4:	e12fff1e 	bx	lr

000005d8 <fstat>:
 5d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5ec:	e3a00008 	mov	r0, #8
 5f0:	ef000040 	svc	0x00000040
 5f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 600:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 604:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 608:	e12fff1e 	bx	lr

0000060c <link>:
 60c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 610:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 614:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 618:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 61c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 620:	e3a00013 	mov	r0, #19
 624:	ef000040 	svc	0x00000040
 628:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 62c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 630:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 634:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 638:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 63c:	e12fff1e 	bx	lr

00000640 <mkdir>:
 640:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 644:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 648:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 64c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 650:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 654:	e3a00014 	mov	r0, #20
 658:	ef000040 	svc	0x00000040
 65c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 664:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 668:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 66c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 670:	e12fff1e 	bx	lr

00000674 <chdir>:
 674:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 678:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 67c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 680:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 684:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 688:	e3a00009 	mov	r0, #9
 68c:	ef000040 	svc	0x00000040
 690:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 698:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 69c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a4:	e12fff1e 	bx	lr

000006a8 <dup>:
 6a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6bc:	e3a0000a 	mov	r0, #10
 6c0:	ef000040 	svc	0x00000040
 6c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d8:	e12fff1e 	bx	lr

000006dc <getpid>:
 6dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f0:	e3a0000b 	mov	r0, #11
 6f4:	ef000040 	svc	0x00000040
 6f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 700:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 704:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 708:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 70c:	e12fff1e 	bx	lr

00000710 <sbrk>:
 710:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 714:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 718:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 71c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 720:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 724:	e3a0000c 	mov	r0, #12
 728:	ef000040 	svc	0x00000040
 72c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 734:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 738:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 73c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 740:	e12fff1e 	bx	lr

00000744 <sleep>:
 744:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 748:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 74c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 750:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 754:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 758:	e3a0000d 	mov	r0, #13
 75c:	ef000040 	svc	0x00000040
 760:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 764:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 768:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 76c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 770:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 774:	e12fff1e 	bx	lr

00000778 <uptime>:
 778:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 77c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 780:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 784:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 788:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 78c:	e3a0000e 	mov	r0, #14
 790:	ef000040 	svc	0x00000040
 794:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 798:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 79c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7a8:	e12fff1e 	bx	lr

000007ac <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7ac:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7b0:	e1a09fa1 	lsr	r9, r1, #31
 7b4:	e3530000 	cmp	r3, #0
 7b8:	03a03000 	moveq	r3, #0
 7bc:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7c0:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7c4:	e3530000 	cmp	r3, #0
 7c8:	e3008c3c 	movw	r8, #3132	; 0xc3c
    neg = 1;
    x = -xx;
 7cc:	1261e000 	rsbne	lr, r1, #0
 7d0:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7d4:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 7d8:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 7dc:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 7e0:	01a09003 	moveq	r9, r3
 7e4:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 7e8:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 7ec:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7f0:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7f4:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 7f8:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7fc:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 800:	e1a0033e 	lsr	r0, lr, r3
 804:	e2000001 	and	r0, r0, #1
 808:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 80c:	e1520001 	cmp	r2, r1
            r = r - d;
 810:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 814:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 818:	e2533001 	subs	r3, r3, #1
 81c:	2afffff7 	bcs	800 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 820:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 824:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 828:	e2873001 	add	r3, r7, #1
 82c:	e7d8100e 	ldrb	r1, [r8, lr]
 830:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 834:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 838:	11a07003 	movne	r7, r3
 83c:	1affffec 	bne	7f4 <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 840:	e3590000 	cmp	r9, #0
 844:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 848:	124b201c 	subne	r2, fp, #28
 84c:	10822003 	addne	r2, r2, r3
 850:	12873002 	addne	r3, r7, #2
 854:	e0865003 	add	r5, r6, r3
 858:	13a0102d 	movne	r1, #45	; 0x2d
 85c:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 860:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 864:	e3a02001 	mov	r2, #1
 868:	e24b102d 	sub	r1, fp, #45	; 0x2d
 86c:	e1a00004 	mov	r0, r4
 870:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 874:	ebfffefc 	bl	46c <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 878:	e1560005 	cmp	r6, r5
 87c:	1afffff7 	bne	860 <printint+0xb4>
    putc(fd, buf[i]);
}
 880:	e24bd01c 	sub	sp, fp, #28
 884:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000888 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 888:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 88c:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 890:	e28db008 	add	fp, sp, #8
 894:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 898:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 89c:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 8a0:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 8a4:	e1a0c33e 	lsr	ip, lr, r3
 8a8:	e20cc001 	and	ip, ip, #1
 8ac:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 8b0:	e1520001 	cmp	r2, r1
            r = r - d;
 8b4:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 8b8:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8bc:	e2533001 	subs	r3, r3, #1
 8c0:	2afffff7 	bcs	8a4 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 8c4:	e8bd8810 	pop	{r4, fp, pc}

000008c8 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8c8:	e92d000e 	push	{r1, r2, r3}
 8cc:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 8d0:	e28db01c 	add	fp, sp, #28
 8d4:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8d8:	e59b6004 	ldr	r6, [fp, #4]
 8dc:	e5d64000 	ldrb	r4, [r6]
 8e0:	e3540000 	cmp	r4, #0
 8e4:	0a00002d 	beq	9a0 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 8e8:	e3008c50 	movw	r8, #3152	; 0xc50
 8ec:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8f0:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 8f4:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8f8:	e3a05000 	mov	r5, #0
 8fc:	ea00000a 	b	92c <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 900:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 904:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 908:	0a000004 	beq	920 <printf+0x58>
 90c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 910:	e3a02001 	mov	r2, #1
 914:	e1a00007 	mov	r0, r7
 918:	e5614006 	strb	r4, [r1, #-6]!
 91c:	ebfffed2 	bl	46c <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 920:	e5f64001 	ldrb	r4, [r6, #1]!
 924:	e3540000 	cmp	r4, #0
 928:	0a00001c 	beq	9a0 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 92c:	e3550000 	cmp	r5, #0
 930:	0afffff2 	beq	900 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 934:	e3550025 	cmp	r5, #37	; 0x25
 938:	1afffff8 	bne	920 <printf+0x58>
      if(c == 'd'){
 93c:	e3540064 	cmp	r4, #100	; 0x64
 940:	0a000037 	beq	a24 <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 944:	e20430f7 	and	r3, r4, #247	; 0xf7
 948:	e3530070 	cmp	r3, #112	; 0x70
 94c:	0a000017 	beq	9b0 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 950:	e3540073 	cmp	r4, #115	; 0x73
 954:	0a00001c 	beq	9cc <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 958:	e3540063 	cmp	r4, #99	; 0x63
 95c:	0a000037 	beq	a40 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 960:	e3540025 	cmp	r4, #37	; 0x25
 964:	0a000027 	beq	a08 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 968:	e3a02001 	mov	r2, #1
 96c:	e24b1021 	sub	r1, fp, #33	; 0x21
 970:	e1a00007 	mov	r0, r7
 974:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 978:	ebfffebb 	bl	46c <write>
 97c:	e24b1020 	sub	r1, fp, #32
 980:	e3a02001 	mov	r2, #1
 984:	e1a00007 	mov	r0, r7
 988:	e5614002 	strb	r4, [r1, #-2]!
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
 990:	ebfffeb5 	bl	46c <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 994:	e5f64001 	ldrb	r4, [r6, #1]!
 998:	e3540000 	cmp	r4, #0
 99c:	1affffe2 	bne	92c <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9a0:	e24bd01c 	sub	sp, fp, #28
 9a4:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 9a8:	e28dd00c 	add	sp, sp, #12
 9ac:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 9b0:	e3a03000 	mov	r3, #0
 9b4:	e3a02010 	mov	r2, #16
 9b8:	e4991004 	ldr	r1, [r9], #4
 9bc:	e1a00007 	mov	r0, r7
 9c0:	ebffff79 	bl	7ac <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9c4:	e3a05000 	mov	r5, #0
 9c8:	eaffffd4 	b	920 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 9cc:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 9d0:	e3540000 	cmp	r4, #0
 9d4:	01a04008 	moveq	r4, r8
        while(*s != 0){
 9d8:	e5d45000 	ldrb	r5, [r4]
 9dc:	e3550000 	cmp	r5, #0
 9e0:	0affffce 	beq	920 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9e4:	e3a02001 	mov	r2, #1
 9e8:	e24b1025 	sub	r1, fp, #37	; 0x25
 9ec:	e1a00007 	mov	r0, r7
 9f0:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 9f4:	ebfffe9c 	bl	46c <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 9f8:	e5f45001 	ldrb	r5, [r4, #1]!
 9fc:	e3550000 	cmp	r5, #0
 a00:	1afffff7 	bne	9e4 <printf+0x11c>
 a04:	eaffffc5 	b	920 <printf+0x58>
 a08:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a0c:	e3a02001 	mov	r2, #1
 a10:	e1a00007 	mov	r0, r7
 a14:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a18:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a1c:	ebfffe92 	bl	46c <write>
 a20:	eaffffbe 	b	920 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a24:	e3a03001 	mov	r3, #1
 a28:	e3a0200a 	mov	r2, #10
 a2c:	e4991004 	ldr	r1, [r9], #4
 a30:	e1a00007 	mov	r0, r7
 a34:	ebffff5c 	bl	7ac <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a38:	e3a05000 	mov	r5, #0
 a3c:	eaffffb7 	b	920 <printf+0x58>
 a40:	e4993004 	ldr	r3, [r9], #4
 a44:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a48:	e3a02001 	mov	r2, #1
 a4c:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a50:	e3a05000 	mov	r5, #0
 a54:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a58:	ebfffe83 	bl	46c <write>
 a5c:	eaffffaf 	b	920 <printf+0x58>

00000a60 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a60:	e300cc60 	movw	ip, #3168	; 0xc60
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a64:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a68:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 a6c:	e92d4810 	push	{r4, fp, lr}
 a70:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a74:	e59c3000 	ldr	r3, [ip]
 a78:	ea000004 	b	a90 <free+0x30>
 a7c:	e1510002 	cmp	r1, r2
 a80:	3a000009 	bcc	aac <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a84:	e1530002 	cmp	r3, r2
 a88:	2a000007 	bcs	aac <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a8c:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a90:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a94:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a98:	3afffff7 	bcc	a7c <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a9c:	e1530002 	cmp	r3, r2
 aa0:	3afffff9 	bcc	a8c <free+0x2c>
 aa4:	e1510002 	cmp	r1, r2
 aa8:	2afffff7 	bcs	a8c <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 aac:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 ab0:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 ab4:	e081418e 	add	r4, r1, lr, lsl #3
 ab8:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 abc:	05922004 	ldreq	r2, [r2, #4]
 ac0:	0082e00e 	addeq	lr, r2, lr
 ac4:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 ac8:	05932000 	ldreq	r2, [r3]
 acc:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 ad0:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 ad4:	e5932004 	ldr	r2, [r3, #4]
 ad8:	e083e182 	add	lr, r3, r2, lsl #3
 adc:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 ae0:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 ae4:	05101004 	ldreq	r1, [r0, #-4]
 ae8:	00812002 	addeq	r2, r1, r2
 aec:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 af0:	05102008 	ldreq	r2, [r0, #-8]
 af4:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 af8:	e8bd8810 	pop	{r4, fp, pc}

00000afc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 afc:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b00:	e3008c60 	movw	r8, #3168	; 0xc60
 b04:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b08:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 b0c:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 b10:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b14:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 b18:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b1c:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b20:	0a00002a 	beq	bd0 <malloc+0xd4>
 b24:	e5930000 	ldr	r0, [r3]
 b28:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b2c:	e1540002 	cmp	r4, r2
 b30:	9a00001c 	bls	ba8 <malloc+0xac>
 b34:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b38:	e3005c60 	movw	r5, #3168	; 0xc60
 b3c:	e3405000 	movt	r5, #0
 b40:	33a06902 	movcc	r6, #32768	; 0x8000
 b44:	21a06184 	lslcs	r6, r4, #3
 b48:	21a07004 	movcs	r7, r4
 b4c:	33a07a01 	movcc	r7, #4096	; 0x1000
 b50:	ea000003 	b	b64 <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b54:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b58:	e5902004 	ldr	r2, [r0, #4]
 b5c:	e1540002 	cmp	r4, r2
 b60:	9a000010 	bls	ba8 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b64:	e5982000 	ldr	r2, [r8]
 b68:	e1a03000 	mov	r3, r0
 b6c:	e1520000 	cmp	r2, r0
 b70:	1afffff7 	bne	b54 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b74:	e1a00006 	mov	r0, r6
 b78:	ebfffee4 	bl	710 <sbrk>
 b7c:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b80:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 b84:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 b88:	0a000004 	beq	ba0 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b8c:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 b90:	ebffffb2 	bl	a60 <free>
  return freep;
 b94:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b98:	e3530000 	cmp	r3, #0
 b9c:	1affffec 	bne	b54 <malloc+0x58>
        return 0;
 ba0:	e3a00000 	mov	r0, #0
  }
}
 ba4:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ba8:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 bac:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 bb0:	10642002 	rsbne	r2, r4, r2
 bb4:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 bb8:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 bbc:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 bc0:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 bc4:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 bc8:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 bcc:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 bd0:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 bd4:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 bd8:	e5880000 	str	r0, [r8]
 bdc:	e5880004 	str	r0, [r8, #4]
 be0:	eaffffd3 	b	b34 <malloc+0x38>
