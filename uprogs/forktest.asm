
_forktest:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	e92d4800 	push	{fp, lr}
   4:	e28db004 	add	fp, sp, #4
  forktest();
   8:	eb00000e 	bl	48 <forktest>
  exit();
   c:	eb0000fd 	bl	408 <exit>

00000010 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
  10:	e92d000e 	push	{r1, r2, r3}
  14:	e92d4810 	push	{r4, fp, lr}
  18:	e28db008 	add	fp, sp, #8
  1c:	e1a04000 	mov	r4, r0
  write(fd, s, strlen(s));
  20:	e59b0004 	ldr	r0, [fp, #4]
  24:	eb00006d 	bl	1e0 <strlen>
  28:	e59b1004 	ldr	r1, [fp, #4]
  2c:	e1a02000 	mov	r2, r0
  30:	e1a00004 	mov	r0, r4
  34:	eb000127 	bl	4d8 <write>
}
  38:	e24bd008 	sub	sp, fp, #8
  3c:	e8bd4810 	pop	{r4, fp, lr}
  40:	e28dd00c 	add	sp, sp, #12
  44:	e12fff1e 	bx	lr

00000048 <forktest>:
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  48:	e3000818 	movw	r0, #2072	; 0x818
}

void
forktest(void)
{
  4c:	e92d4830 	push	{r4, r5, fp, lr}
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  50:	e3400000 	movt	r0, #0
}

void
forktest(void)
{
  54:	e28db00c 	add	fp, sp, #12
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  58:	e3a04000 	mov	r4, #0
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  5c:	eb00005f 	bl	1e0 <strlen>
  60:	e3001818 	movw	r1, #2072	; 0x818
  64:	e3401000 	movt	r1, #0
  68:	e1a02000 	mov	r2, r0
  6c:	e3a00001 	mov	r0, #1
  70:	eb000118 	bl	4d8 <write>
  74:	ea000003 	b	88 <forktest+0x40>

  for(n=0; n<N; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
  78:	0a00002a 	beq	128 <forktest+0xe0>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  7c:	e2844001 	add	r4, r4, #1
  80:	e3540ffa 	cmp	r4, #1000	; 0x3e8
  84:	0a000016 	beq	e4 <forktest+0x9c>
    pid = fork();
  88:	eb0000d1 	bl	3d4 <fork>
    if(pid < 0)
  8c:	e3500000 	cmp	r0, #0
  90:	aafffff8 	bge	78 <forktest+0x30>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
  94:	e3540000 	cmp	r4, #0
  98:	0a000004 	beq	b0 <forktest+0x68>
    if(wait() < 0){
  9c:	eb0000e6 	bl	43c <wait>
  a0:	e3500000 	cmp	r0, #0
  a4:	ba000017 	blt	108 <forktest+0xc0>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }
  
  for(; n > 0; n--){
  a8:	e2544001 	subs	r4, r4, #1
  ac:	1afffffa 	bne	9c <forktest+0x54>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
  b0:	eb0000e1 	bl	43c <wait>
  b4:	e3700001 	cmn	r0, #1
  b8:	1a00001b 	bne	12c <forktest+0xe4>
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  bc:	e300084c 	movw	r0, #2124	; 0x84c
  c0:	e3400000 	movt	r0, #0
  c4:	eb000045 	bl	1e0 <strlen>
  c8:	e300184c 	movw	r1, #2124	; 0x84c
  cc:	e3401000 	movt	r1, #0
  d0:	e1a02000 	mov	r2, r0
  d4:	e3a00001 	mov	r0, #1
    printf(1, "wait got too many\n");
    exit();
  }
  
  printf(1, "fork test OK\n");
}
  d8:	e24bd00c 	sub	sp, fp, #12
  dc:	e8bd4830 	pop	{r4, r5, fp, lr}
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  e0:	ea0000fc 	b	4d8 <write>
  e4:	e300085c 	movw	r0, #2140	; 0x85c
  e8:	e3400000 	movt	r0, #0
  ec:	eb00003b 	bl	1e0 <strlen>
  f0:	e300185c 	movw	r1, #2140	; 0x85c
  f4:	e3401000 	movt	r1, #0
  f8:	e1a02000 	mov	r2, r0
  fc:	e3a00001 	mov	r0, #1
 100:	eb0000f4 	bl	4d8 <write>
      exit();
  }
  
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
 104:	eb0000bf 	bl	408 <exit>
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
 108:	e3000824 	movw	r0, #2084	; 0x824
 10c:	e3400000 	movt	r0, #0
 110:	eb000032 	bl	1e0 <strlen>
 114:	e3001824 	movw	r1, #2084	; 0x824
 118:	e3401000 	movt	r1, #0
 11c:	e1a02000 	mov	r2, r0
 120:	e3a00001 	mov	r0, #1
 124:	eb0000eb 	bl	4d8 <write>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
      exit();
 128:	eb0000b6 	bl	408 <exit>
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
 12c:	e3000838 	movw	r0, #2104	; 0x838
 130:	e3400000 	movt	r0, #0
 134:	eb000029 	bl	1e0 <strlen>
 138:	e3001838 	movw	r1, #2104	; 0x838
 13c:	e3401000 	movt	r1, #0
 140:	e1a02000 	mov	r2, r0
 144:	e3a00001 	mov	r0, #1
 148:	eb0000e2 	bl	4d8 <write>
    }
  }
  
  if(wait() != -1){
    printf(1, "wait got too many\n");
    exit();
 14c:	eb0000ad 	bl	408 <exit>

00000150 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 150:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 154:	e2402001 	sub	r2, r0, #1
 158:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 15c:	e4d13001 	ldrb	r3, [r1], #1
 160:	e3530000 	cmp	r3, #0
 164:	e5e23001 	strb	r3, [r2, #1]!
 168:	1afffffb 	bne	15c <strcpy+0xc>
    ;
  return os;
}
 16c:	e24bd000 	sub	sp, fp, #0
 170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 174:	e12fff1e 	bx	lr

00000178 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 17c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 180:	e5d03000 	ldrb	r3, [r0]
 184:	e3530000 	cmp	r3, #0
 188:	05d10000 	ldrbeq	r0, [r1]
 18c:	0a00000a 	beq	1bc <strcmp+0x44>
 190:	e5d12000 	ldrb	r2, [r1]
 194:	e1530002 	cmp	r3, r2
 198:	0a000003 	beq	1ac <strcmp+0x34>
 19c:	ea00000a 	b	1cc <strcmp+0x54>
 1a0:	e5f12001 	ldrb	r2, [r1, #1]!
 1a4:	e1530002 	cmp	r3, r2
 1a8:	1a000007 	bne	1cc <strcmp+0x54>
 1ac:	e5f03001 	ldrb	r3, [r0, #1]!
 1b0:	e3530000 	cmp	r3, #0
 1b4:	1afffff9 	bne	1a0 <strcmp+0x28>
 1b8:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1bc:	e0600003 	rsb	r0, r0, r3
 1c0:	e24bd000 	sub	sp, fp, #0
 1c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1c8:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1cc:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1d0:	e0600003 	rsb	r0, r0, r3
 1d4:	e24bd000 	sub	sp, fp, #0
 1d8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1dc:	e12fff1e 	bx	lr

000001e0 <strlen>:

uint
strlen(char *s)
{
 1e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1e4:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 1e8:	e5d03000 	ldrb	r3, [r0]
 1ec:	e3530000 	cmp	r3, #0
 1f0:	0a000009 	beq	21c <strlen+0x3c>
 1f4:	e1a02000 	mov	r2, r0
 1f8:	e3a03000 	mov	r3, #0
 1fc:	e5f21001 	ldrb	r1, [r2, #1]!
 200:	e2833001 	add	r3, r3, #1
 204:	e3510000 	cmp	r1, #0
 208:	e1a00003 	mov	r0, r3
 20c:	1afffffa 	bne	1fc <strlen+0x1c>
    ;
  return n;
}
 210:	e24bd000 	sub	sp, fp, #0
 214:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 218:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 21c:	e1a00003 	mov	r0, r3
 220:	eafffffa 	b	210 <strlen+0x30>

00000224 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 224:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 228:	e1a03000 	mov	r3, r0
 22c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 230:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 234:	0a000004 	beq	24c <memset+0x28>
 238:	e6ef1071 	uxtb	r1, r1
 23c:	e0800002 	add	r0, r0, r2
 240:	e4c31001 	strb	r1, [r3], #1
 244:	e1500003 	cmp	r0, r3
 248:	1afffffc 	bne	240 <memset+0x1c>
  return (void *)p;
}
 24c:	e24bd000 	sub	sp, fp, #0
 250:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 254:	e12fff1e 	bx	lr

00000258 <strchr>:

char*
strchr(const char *s, char c)
{
 258:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 25c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 260:	e5d02000 	ldrb	r2, [r0]
 264:	e3520000 	cmp	r2, #0
 268:	0a00000b 	beq	29c <strchr+0x44>
    if(*s == c)
 26c:	e1510002 	cmp	r1, r2
 270:	1a000002 	bne	280 <strchr+0x28>
 274:	ea000005 	b	290 <strchr+0x38>
 278:	e1530001 	cmp	r3, r1
 27c:	0a000003 	beq	290 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 280:	e5f03001 	ldrb	r3, [r0, #1]!
 284:	e3530000 	cmp	r3, #0
 288:	1afffffa 	bne	278 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 28c:	e1a00003 	mov	r0, r3
}
 290:	e24bd000 	sub	sp, fp, #0
 294:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 298:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 29c:	e1a00002 	mov	r0, r2
 2a0:	eafffffa 	b	290 <strchr+0x38>

000002a4 <gets>:
}

char*
gets(char *buf, int max)
{
 2a4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 2a8:	e1a08000 	mov	r8, r0
 2ac:	e28db018 	add	fp, sp, #24
 2b0:	e1a07001 	mov	r7, r1
 2b4:	e24dd00c 	sub	sp, sp, #12
 2b8:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2bc:	e3a05000 	mov	r5, #0
 2c0:	ea000008 	b	2e8 <gets+0x44>
    cc = read(0, &c, 1);
 2c4:	eb000076 	bl	4a4 <read>
    if(cc < 1)
 2c8:	e3500000 	cmp	r0, #0
 2cc:	da00000b 	ble	300 <gets+0x5c>
      break;
    buf[i++] = c;
 2d0:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 2d4:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 2d8:	e353000d 	cmp	r3, #13
 2dc:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2e0:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 2e4:	0a000005 	beq	300 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2e8:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ec:	e0854002 	add	r4, r5, r2
 2f0:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 2f4:	e24b101d 	sub	r1, fp, #29
 2f8:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2fc:	bafffff0 	blt	2c4 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 300:	e3a03000 	mov	r3, #0
  return buf;
}
 304:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 308:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 30c:	e24bd018 	sub	sp, fp, #24
 310:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000314 <stat>:

int
stat(char *n, struct stat *st)
{
 314:	e92d4830 	push	{r4, r5, fp, lr}
 318:	e1a04001 	mov	r4, r1
 31c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 320:	e3a01000 	mov	r1, #0
 324:	eb00009f 	bl	5a8 <open>
  if(fd < 0)
 328:	e2505000 	subs	r5, r0, #0
 32c:	ba000006 	blt	34c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 330:	e1a01004 	mov	r1, r4
 334:	eb0000c2 	bl	644 <fstat>
 338:	e1a04000 	mov	r4, r0
  close(fd);
 33c:	e1a00005 	mov	r0, r5
 340:	eb000071 	bl	50c <close>
  return r;
 344:	e1a00004 	mov	r0, r4
 348:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 34c:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 350:	e8bd8830 	pop	{r4, r5, fp, pc}

00000354 <atoi>:

int
atoi(const char *s)
{
 354:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 358:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 35c:	e5d01000 	ldrb	r1, [r0]
 360:	e2413030 	sub	r3, r1, #48	; 0x30
 364:	e3530009 	cmp	r3, #9
 368:	e3a03000 	mov	r3, #0
 36c:	8a000007 	bhi	390 <atoi+0x3c>
    n = n*10 + *s++ - '0';
 370:	e1a02183 	lsl	r2, r3, #3
 374:	e0823083 	add	r3, r2, r3, lsl #1
 378:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 37c:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 380:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 384:	e2412030 	sub	r2, r1, #48	; 0x30
 388:	e3520009 	cmp	r2, #9
 38c:	9afffff7 	bls	370 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 390:	e1a00003 	mov	r0, r3
 394:	e24bd000 	sub	sp, fp, #0
 398:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 39c:	e12fff1e 	bx	lr

000003a0 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a0:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 3a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3a8:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ac:	da000005 	ble	3c8 <memmove+0x28>
 3b0:	e0812002 	add	r2, r1, r2
 3b4:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 3b8:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3bc:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 3c0:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3c4:	1afffffb 	bne	3b8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3c8:	e24bd000 	sub	sp, fp, #0
 3cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3d0:	e12fff1e 	bx	lr

000003d4 <fork>:
 3d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3e8:	e3a00001 	mov	r0, #1
 3ec:	ef000040 	svc	0x00000040
 3f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 400:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 404:	e12fff1e 	bx	lr

00000408 <exit>:
 408:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 40c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 410:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 414:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 418:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 41c:	e3a00002 	mov	r0, #2
 420:	ef000040 	svc	0x00000040
 424:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 428:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 42c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 430:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 434:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 438:	e12fff1e 	bx	lr

0000043c <wait>:
 43c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 440:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 444:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 448:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 44c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 450:	e3a00003 	mov	r0, #3
 454:	ef000040 	svc	0x00000040
 458:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 45c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 460:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 464:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 468:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 46c:	e12fff1e 	bx	lr

00000470 <pipe>:
 470:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 474:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 478:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 47c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 480:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 484:	e3a00004 	mov	r0, #4
 488:	ef000040 	svc	0x00000040
 48c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 490:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 494:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 498:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 49c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4a0:	e12fff1e 	bx	lr

000004a4 <read>:
 4a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4b8:	e3a00005 	mov	r0, #5
 4bc:	ef000040 	svc	0x00000040
 4c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4d4:	e12fff1e 	bx	lr

000004d8 <write>:
 4d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ec:	e3a00010 	mov	r0, #16
 4f0:	ef000040 	svc	0x00000040
 4f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 500:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 504:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 508:	e12fff1e 	bx	lr

0000050c <close>:
 50c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 510:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 514:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 518:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 51c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 520:	e3a00015 	mov	r0, #21
 524:	ef000040 	svc	0x00000040
 528:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 52c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 530:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 534:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 538:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 53c:	e12fff1e 	bx	lr

00000540 <kill>:
 540:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 544:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 548:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 54c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 550:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 554:	e3a00006 	mov	r0, #6
 558:	ef000040 	svc	0x00000040
 55c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 560:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 564:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 568:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 56c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 570:	e12fff1e 	bx	lr

00000574 <exec>:
 574:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 578:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 57c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 580:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 584:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 588:	e3a00007 	mov	r0, #7
 58c:	ef000040 	svc	0x00000040
 590:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 594:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 598:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 59c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5a4:	e12fff1e 	bx	lr

000005a8 <open>:
 5a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5bc:	e3a0000f 	mov	r0, #15
 5c0:	ef000040 	svc	0x00000040
 5c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5d8:	e12fff1e 	bx	lr

000005dc <mknod>:
 5dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5f0:	e3a00011 	mov	r0, #17
 5f4:	ef000040 	svc	0x00000040
 5f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 600:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 604:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 608:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 60c:	e12fff1e 	bx	lr

00000610 <unlink>:
 610:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 614:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 618:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 61c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 620:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 624:	e3a00012 	mov	r0, #18
 628:	ef000040 	svc	0x00000040
 62c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 630:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 634:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 638:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 63c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 640:	e12fff1e 	bx	lr

00000644 <fstat>:
 644:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 648:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 64c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 650:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 654:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 658:	e3a00008 	mov	r0, #8
 65c:	ef000040 	svc	0x00000040
 660:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 664:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 668:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 66c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 670:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 674:	e12fff1e 	bx	lr

00000678 <link>:
 678:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 67c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 680:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 684:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 688:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 68c:	e3a00013 	mov	r0, #19
 690:	ef000040 	svc	0x00000040
 694:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 698:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 69c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6a8:	e12fff1e 	bx	lr

000006ac <mkdir>:
 6ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6c0:	e3a00014 	mov	r0, #20
 6c4:	ef000040 	svc	0x00000040
 6c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6dc:	e12fff1e 	bx	lr

000006e0 <chdir>:
 6e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6f4:	e3a00009 	mov	r0, #9
 6f8:	ef000040 	svc	0x00000040
 6fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 700:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 704:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 708:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 70c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 710:	e12fff1e 	bx	lr

00000714 <dup>:
 714:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 718:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 71c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 720:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 724:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 728:	e3a0000a 	mov	r0, #10
 72c:	ef000040 	svc	0x00000040
 730:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 734:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 738:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 73c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 740:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 744:	e12fff1e 	bx	lr

00000748 <getpid>:
 748:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 74c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 750:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 754:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 758:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 75c:	e3a0000b 	mov	r0, #11
 760:	ef000040 	svc	0x00000040
 764:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 768:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 76c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 770:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 774:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 778:	e12fff1e 	bx	lr

0000077c <sbrk>:
 77c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 780:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 784:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 788:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 78c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 790:	e3a0000c 	mov	r0, #12
 794:	ef000040 	svc	0x00000040
 798:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 79c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7a0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7a4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7a8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7ac:	e12fff1e 	bx	lr

000007b0 <sleep>:
 7b0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7b4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7b8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7bc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7c0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7c4:	e3a0000d 	mov	r0, #13
 7c8:	ef000040 	svc	0x00000040
 7cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7d4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7d8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7dc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7e0:	e12fff1e 	bx	lr

000007e4 <uptime>:
 7e4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7e8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7ec:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7f0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7f4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7f8:	e3a0000e 	mov	r0, #14
 7fc:	ef000040 	svc	0x00000040
 800:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 804:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 808:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 80c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 810:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 814:	e12fff1e 	bx	lr
