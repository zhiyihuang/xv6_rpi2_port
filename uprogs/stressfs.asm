
_stressfs:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
   0:	e3003c34 	movw	r3, #3124	; 0xc34
   4:	e3403000 	movt	r3, #0
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   8:	e92d4830 	push	{r4, r5, fp, lr}
   c:	e28db00c 	add	fp, sp, #12
  10:	e24dde21 	sub	sp, sp, #528	; 0x210
  int fd, i;
  char path[] = "stressfs0";
  14:	e8930007 	ldm	r3, {r0, r1, r2}
  18:	e24b3f86 	sub	r3, fp, #536	; 0x218
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  1c:	e3a04000 	mov	r4, #0

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
  20:	e8a30003 	stmia	r3!, {r0, r1}
  char data[512];

  printf(1, "stressfs starting\n");
  24:	e3001c0c 	movw	r1, #3084	; 0xc0c
  28:	e3401000 	movt	r1, #0
  2c:	e3a00001 	mov	r0, #1

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
  30:	e1c320b0 	strh	r2, [r3]
  char data[512];

  printf(1, "stressfs starting\n");
  34:	eb00022d 	bl	8f0 <printf>
  memset(data, 'a', sizeof(data));
  38:	e24b0f83 	sub	r0, fp, #524	; 0x20c
  3c:	e3a02c02 	mov	r2, #512	; 0x200
  40:	e3a01061 	mov	r1, #97	; 0x61
  44:	eb000065 	bl	1e0 <memset>

  for(i = 0; i < 4; i++)
    if(fork() > 0)
  48:	eb0000d0 	bl	390 <fork>
  4c:	e3500000 	cmp	r0, #0
  50:	ca00002b 	bgt	104 <main+0x104>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  54:	e2844001 	add	r4, r4, #1
  58:	e3540004 	cmp	r4, #4
  5c:	1afffff9 	bne	48 <main+0x48>
  60:	e1a05004 	mov	r5, r4
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  64:	e3001c20 	movw	r1, #3104	; 0xc20
  68:	e1a02004 	mov	r2, r4
  6c:	e3401000 	movt	r1, #0
  70:	e3a00001 	mov	r0, #1
  74:	eb00021d 	bl	8f0 <printf>

  path[8] += i;
  78:	e55b3210 	ldrb	r3, [fp, #-528]	; 0xfffffdf0
  fd = open(path, O_CREATE | O_RDWR);
  7c:	e3001202 	movw	r1, #514	; 0x202
  80:	e24b0f86 	sub	r0, fp, #536	; 0x218
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);

  path[8] += i;
  84:	e0855003 	add	r5, r5, r3
  88:	e54b5210 	strb	r5, [fp, #-528]	; 0xfffffdf0
  fd = open(path, O_CREATE | O_RDWR);
  8c:	eb000134 	bl	564 <open>
  90:	e3a04014 	mov	r4, #20
  94:	e1a05000 	mov	r5, r0
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  98:	e3a02c02 	mov	r2, #512	; 0x200
  9c:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  a0:	e1a00005 	mov	r0, r5
  a4:	eb0000fa 	bl	494 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  a8:	e2544001 	subs	r4, r4, #1
  ac:	1afffff9 	bne	98 <main+0x98>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  b0:	e1a00005 	mov	r0, r5

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  b4:	e3a05014 	mov	r5, #20
  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  b8:	eb000102 	bl	4c8 <close>

  printf(1, "read\n");
  bc:	e3001c2c 	movw	r1, #3116	; 0xc2c
  c0:	e3401000 	movt	r1, #0
  c4:	e3a00001 	mov	r0, #1
  c8:	eb000208 	bl	8f0 <printf>

  fd = open(path, O_RDONLY);
  cc:	e1a01004 	mov	r1, r4
  d0:	e24b0f86 	sub	r0, fp, #536	; 0x218
  d4:	eb000122 	bl	564 <open>
  d8:	e1a04000 	mov	r4, r0
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
  dc:	e3a02c02 	mov	r2, #512	; 0x200
  e0:	e24b1f83 	sub	r1, fp, #524	; 0x20c
  e4:	e1a00004 	mov	r0, r4
  e8:	eb0000dc 	bl	460 <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
  ec:	e2555001 	subs	r5, r5, #1
  f0:	1afffff9 	bne	dc <main+0xdc>
    read(fd, data, sizeof(data));
  close(fd);
  f4:	e1a00004 	mov	r0, r4
  f8:	eb0000f2 	bl	4c8 <close>

  wait();
  fc:	eb0000bd 	bl	3f8 <wait>
  
  exit();
 100:	eb0000af 	bl	3c4 <exit>
 104:	e6ef5074 	uxtb	r5, r4
 108:	eaffffd5 	b	64 <main+0x64>

0000010c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 10c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 110:	e2402001 	sub	r2, r0, #1
 114:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 118:	e4d13001 	ldrb	r3, [r1], #1
 11c:	e3530000 	cmp	r3, #0
 120:	e5e23001 	strb	r3, [r2, #1]!
 124:	1afffffb 	bne	118 <strcpy+0xc>
    ;
  return os;
}
 128:	e24bd000 	sub	sp, fp, #0
 12c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 130:	e12fff1e 	bx	lr

00000134 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 134:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 138:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 13c:	e5d03000 	ldrb	r3, [r0]
 140:	e3530000 	cmp	r3, #0
 144:	05d10000 	ldrbeq	r0, [r1]
 148:	0a00000a 	beq	178 <strcmp+0x44>
 14c:	e5d12000 	ldrb	r2, [r1]
 150:	e1530002 	cmp	r3, r2
 154:	0a000003 	beq	168 <strcmp+0x34>
 158:	ea00000a 	b	188 <strcmp+0x54>
 15c:	e5f12001 	ldrb	r2, [r1, #1]!
 160:	e1530002 	cmp	r3, r2
 164:	1a000007 	bne	188 <strcmp+0x54>
 168:	e5f03001 	ldrb	r3, [r0, #1]!
 16c:	e3530000 	cmp	r3, #0
 170:	1afffff9 	bne	15c <strcmp+0x28>
 174:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 178:	e0600003 	rsb	r0, r0, r3
 17c:	e24bd000 	sub	sp, fp, #0
 180:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 184:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 188:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 18c:	e0600003 	rsb	r0, r0, r3
 190:	e24bd000 	sub	sp, fp, #0
 194:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 198:	e12fff1e 	bx	lr

0000019c <strlen>:

uint
strlen(char *s)
{
 19c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1a0:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 1a4:	e5d03000 	ldrb	r3, [r0]
 1a8:	e3530000 	cmp	r3, #0
 1ac:	0a000009 	beq	1d8 <strlen+0x3c>
 1b0:	e1a02000 	mov	r2, r0
 1b4:	e3a03000 	mov	r3, #0
 1b8:	e5f21001 	ldrb	r1, [r2, #1]!
 1bc:	e2833001 	add	r3, r3, #1
 1c0:	e3510000 	cmp	r1, #0
 1c4:	e1a00003 	mov	r0, r3
 1c8:	1afffffa 	bne	1b8 <strlen+0x1c>
    ;
  return n;
}
 1cc:	e24bd000 	sub	sp, fp, #0
 1d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1d4:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 1d8:	e1a00003 	mov	r0, r3
 1dc:	eafffffa 	b	1cc <strlen+0x30>

000001e0 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1e0:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 1e4:	e1a03000 	mov	r3, r0
 1e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1ec:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1f0:	0a000004 	beq	208 <memset+0x28>
 1f4:	e6ef1071 	uxtb	r1, r1
 1f8:	e0800002 	add	r0, r0, r2
 1fc:	e4c31001 	strb	r1, [r3], #1
 200:	e1500003 	cmp	r0, r3
 204:	1afffffc 	bne	1fc <memset+0x1c>
  return (void *)p;
}
 208:	e24bd000 	sub	sp, fp, #0
 20c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 210:	e12fff1e 	bx	lr

00000214 <strchr>:

char*
strchr(const char *s, char c)
{
 214:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 218:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 21c:	e5d02000 	ldrb	r2, [r0]
 220:	e3520000 	cmp	r2, #0
 224:	0a00000b 	beq	258 <strchr+0x44>
    if(*s == c)
 228:	e1510002 	cmp	r1, r2
 22c:	1a000002 	bne	23c <strchr+0x28>
 230:	ea000005 	b	24c <strchr+0x38>
 234:	e1530001 	cmp	r3, r1
 238:	0a000003 	beq	24c <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 23c:	e5f03001 	ldrb	r3, [r0, #1]!
 240:	e3530000 	cmp	r3, #0
 244:	1afffffa 	bne	234 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 248:	e1a00003 	mov	r0, r3
}
 24c:	e24bd000 	sub	sp, fp, #0
 250:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 254:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 258:	e1a00002 	mov	r0, r2
 25c:	eafffffa 	b	24c <strchr+0x38>

00000260 <gets>:
}

char*
gets(char *buf, int max)
{
 260:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 264:	e1a08000 	mov	r8, r0
 268:	e28db018 	add	fp, sp, #24
 26c:	e1a07001 	mov	r7, r1
 270:	e24dd00c 	sub	sp, sp, #12
 274:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 278:	e3a05000 	mov	r5, #0
 27c:	ea000008 	b	2a4 <gets+0x44>
    cc = read(0, &c, 1);
 280:	eb000076 	bl	460 <read>
    if(cc < 1)
 284:	e3500000 	cmp	r0, #0
 288:	da00000b 	ble	2bc <gets+0x5c>
      break;
    buf[i++] = c;
 28c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 290:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 294:	e353000d 	cmp	r3, #13
 298:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 29c:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 2a0:	0a000005 	beq	2bc <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2a4:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a8:	e0854002 	add	r4, r5, r2
 2ac:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 2b0:	e24b101d 	sub	r1, fp, #29
 2b4:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2b8:	bafffff0 	blt	280 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2bc:	e3a03000 	mov	r3, #0
  return buf;
}
 2c0:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2c4:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 2c8:	e24bd018 	sub	sp, fp, #24
 2cc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

000002d0 <stat>:

int
stat(char *n, struct stat *st)
{
 2d0:	e92d4830 	push	{r4, r5, fp, lr}
 2d4:	e1a04001 	mov	r4, r1
 2d8:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2dc:	e3a01000 	mov	r1, #0
 2e0:	eb00009f 	bl	564 <open>
  if(fd < 0)
 2e4:	e2505000 	subs	r5, r0, #0
 2e8:	ba000006 	blt	308 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 2ec:	e1a01004 	mov	r1, r4
 2f0:	eb0000c2 	bl	600 <fstat>
 2f4:	e1a04000 	mov	r4, r0
  close(fd);
 2f8:	e1a00005 	mov	r0, r5
 2fc:	eb000071 	bl	4c8 <close>
  return r;
 300:	e1a00004 	mov	r0, r4
 304:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 308:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 30c:	e8bd8830 	pop	{r4, r5, fp, pc}

00000310 <atoi>:

int
atoi(const char *s)
{
 310:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 314:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 318:	e5d01000 	ldrb	r1, [r0]
 31c:	e2413030 	sub	r3, r1, #48	; 0x30
 320:	e3530009 	cmp	r3, #9
 324:	e3a03000 	mov	r3, #0
 328:	8a000007 	bhi	34c <atoi+0x3c>
    n = n*10 + *s++ - '0';
 32c:	e1a02183 	lsl	r2, r3, #3
 330:	e0823083 	add	r3, r2, r3, lsl #1
 334:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 338:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 33c:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 340:	e2412030 	sub	r2, r1, #48	; 0x30
 344:	e3520009 	cmp	r2, #9
 348:	9afffff7 	bls	32c <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 34c:	e1a00003 	mov	r0, r3
 350:	e24bd000 	sub	sp, fp, #0
 354:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 358:	e12fff1e 	bx	lr

0000035c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 360:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 364:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 368:	da000005 	ble	384 <memmove+0x28>
 36c:	e0812002 	add	r2, r1, r2
 370:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 374:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 378:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 37c:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 380:	1afffffb 	bne	374 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 384:	e24bd000 	sub	sp, fp, #0
 388:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 38c:	e12fff1e 	bx	lr

00000390 <fork>:
 390:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 394:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 398:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 39c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a4:	e3a00001 	mov	r0, #1
 3a8:	ef000040 	svc	0x00000040
 3ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c0:	e12fff1e 	bx	lr

000003c4 <exit>:
 3c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3d8:	e3a00002 	mov	r0, #2
 3dc:	ef000040 	svc	0x00000040
 3e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f4:	e12fff1e 	bx	lr

000003f8 <wait>:
 3f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 400:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 404:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 408:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 40c:	e3a00003 	mov	r0, #3
 410:	ef000040 	svc	0x00000040
 414:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 420:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 424:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 428:	e12fff1e 	bx	lr

0000042c <pipe>:
 42c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 430:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 434:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 438:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 43c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 440:	e3a00004 	mov	r0, #4
 444:	ef000040 	svc	0x00000040
 448:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 454:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 458:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 45c:	e12fff1e 	bx	lr

00000460 <read>:
 460:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 464:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 468:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 46c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 470:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 474:	e3a00005 	mov	r0, #5
 478:	ef000040 	svc	0x00000040
 47c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 488:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 48c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 490:	e12fff1e 	bx	lr

00000494 <write>:
 494:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 498:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 49c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a8:	e3a00010 	mov	r0, #16
 4ac:	ef000040 	svc	0x00000040
 4b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c4:	e12fff1e 	bx	lr

000004c8 <close>:
 4c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4dc:	e3a00015 	mov	r0, #21
 4e0:	ef000040 	svc	0x00000040
 4e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f8:	e12fff1e 	bx	lr

000004fc <kill>:
 4fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 500:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 504:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 508:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 50c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 510:	e3a00006 	mov	r0, #6
 514:	ef000040 	svc	0x00000040
 518:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 524:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 528:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 52c:	e12fff1e 	bx	lr

00000530 <exec>:
 530:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 534:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 538:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 53c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 540:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 544:	e3a00007 	mov	r0, #7
 548:	ef000040 	svc	0x00000040
 54c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 558:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 55c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 560:	e12fff1e 	bx	lr

00000564 <open>:
 564:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 568:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 56c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 570:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 574:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 578:	e3a0000f 	mov	r0, #15
 57c:	ef000040 	svc	0x00000040
 580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 58c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 590:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 594:	e12fff1e 	bx	lr

00000598 <mknod>:
 598:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 59c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5ac:	e3a00011 	mov	r0, #17
 5b0:	ef000040 	svc	0x00000040
 5b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c8:	e12fff1e 	bx	lr

000005cc <unlink>:
 5cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e0:	e3a00012 	mov	r0, #18
 5e4:	ef000040 	svc	0x00000040
 5e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5fc:	e12fff1e 	bx	lr

00000600 <fstat>:
 600:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 604:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 608:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 60c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 610:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 614:	e3a00008 	mov	r0, #8
 618:	ef000040 	svc	0x00000040
 61c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 628:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 62c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 630:	e12fff1e 	bx	lr

00000634 <link>:
 634:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 638:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 63c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 640:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 644:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 648:	e3a00013 	mov	r0, #19
 64c:	ef000040 	svc	0x00000040
 650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 65c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 660:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 664:	e12fff1e 	bx	lr

00000668 <mkdir>:
 668:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 66c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 670:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 674:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 678:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 67c:	e3a00014 	mov	r0, #20
 680:	ef000040 	svc	0x00000040
 684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 690:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 694:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 698:	e12fff1e 	bx	lr

0000069c <chdir>:
 69c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b0:	e3a00009 	mov	r0, #9
 6b4:	ef000040 	svc	0x00000040
 6b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6cc:	e12fff1e 	bx	lr

000006d0 <dup>:
 6d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e4:	e3a0000a 	mov	r0, #10
 6e8:	ef000040 	svc	0x00000040
 6ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 700:	e12fff1e 	bx	lr

00000704 <getpid>:
 704:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 708:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 70c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 710:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 714:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 718:	e3a0000b 	mov	r0, #11
 71c:	ef000040 	svc	0x00000040
 720:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 72c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 730:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 734:	e12fff1e 	bx	lr

00000738 <sbrk>:
 738:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 73c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 740:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 744:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 748:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 74c:	e3a0000c 	mov	r0, #12
 750:	ef000040 	svc	0x00000040
 754:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 760:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 764:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 768:	e12fff1e 	bx	lr

0000076c <sleep>:
 76c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 770:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 774:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 778:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 77c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 780:	e3a0000d 	mov	r0, #13
 784:	ef000040 	svc	0x00000040
 788:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 78c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 790:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 794:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 798:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 79c:	e12fff1e 	bx	lr

000007a0 <uptime>:
 7a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b4:	e3a0000e 	mov	r0, #14
 7b8:	ef000040 	svc	0x00000040
 7bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7d0:	e12fff1e 	bx	lr

000007d4 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7d4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7d8:	e1a09fa1 	lsr	r9, r1, #31
 7dc:	e3530000 	cmp	r3, #0
 7e0:	03a03000 	moveq	r3, #0
 7e4:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7e8:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7ec:	e3530000 	cmp	r3, #0
 7f0:	e3008c40 	movw	r8, #3136	; 0xc40
    neg = 1;
    x = -xx;
 7f4:	1261e000 	rsbne	lr, r1, #0
 7f8:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7fc:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 800:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 804:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 808:	01a09003 	moveq	r9, r3
 80c:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 810:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 814:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 818:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 81c:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 820:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 824:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 828:	e1a0033e 	lsr	r0, lr, r3
 82c:	e2000001 	and	r0, r0, #1
 830:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 834:	e1520001 	cmp	r2, r1
            r = r - d;
 838:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 83c:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 840:	e2533001 	subs	r3, r3, #1
 844:	2afffff7 	bcs	828 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 848:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 84c:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 850:	e2873001 	add	r3, r7, #1
 854:	e7d8100e 	ldrb	r1, [r8, lr]
 858:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 85c:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 860:	11a07003 	movne	r7, r3
 864:	1affffec 	bne	81c <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 868:	e3590000 	cmp	r9, #0
 86c:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 870:	124b201c 	subne	r2, fp, #28
 874:	10822003 	addne	r2, r2, r3
 878:	12873002 	addne	r3, r7, #2
 87c:	e0865003 	add	r5, r6, r3
 880:	13a0102d 	movne	r1, #45	; 0x2d
 884:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 888:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 88c:	e3a02001 	mov	r2, #1
 890:	e24b102d 	sub	r1, fp, #45	; 0x2d
 894:	e1a00004 	mov	r0, r4
 898:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 89c:	ebfffefc 	bl	494 <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 8a0:	e1560005 	cmp	r6, r5
 8a4:	1afffff7 	bne	888 <printint+0xb4>
    putc(fd, buf[i]);
}
 8a8:	e24bd01c 	sub	sp, fp, #28
 8ac:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000008b0 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 8b0:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 8b4:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 8b8:	e28db008 	add	fp, sp, #8
 8bc:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8c0:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 8c4:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 8c8:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 8cc:	e1a0c33e 	lsr	ip, lr, r3
 8d0:	e20cc001 	and	ip, ip, #1
 8d4:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 8d8:	e1520001 	cmp	r2, r1
            r = r - d;
 8dc:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 8e0:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8e4:	e2533001 	subs	r3, r3, #1
 8e8:	2afffff7 	bcs	8cc <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 8ec:	e8bd8810 	pop	{r4, fp, pc}

000008f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8f0:	e92d000e 	push	{r1, r2, r3}
 8f4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 8f8:	e28db01c 	add	fp, sp, #28
 8fc:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 900:	e59b6004 	ldr	r6, [fp, #4]
 904:	e5d64000 	ldrb	r4, [r6]
 908:	e3540000 	cmp	r4, #0
 90c:	0a00002d 	beq	9c8 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 910:	e3008c54 	movw	r8, #3156	; 0xc54
 914:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 918:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 91c:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 920:	e3a05000 	mov	r5, #0
 924:	ea00000a 	b	954 <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 928:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 92c:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 930:	0a000004 	beq	948 <printf+0x58>
 934:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 938:	e3a02001 	mov	r2, #1
 93c:	e1a00007 	mov	r0, r7
 940:	e5614006 	strb	r4, [r1, #-6]!
 944:	ebfffed2 	bl	494 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 948:	e5f64001 	ldrb	r4, [r6, #1]!
 94c:	e3540000 	cmp	r4, #0
 950:	0a00001c 	beq	9c8 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 954:	e3550000 	cmp	r5, #0
 958:	0afffff2 	beq	928 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 95c:	e3550025 	cmp	r5, #37	; 0x25
 960:	1afffff8 	bne	948 <printf+0x58>
      if(c == 'd'){
 964:	e3540064 	cmp	r4, #100	; 0x64
 968:	0a000037 	beq	a4c <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 96c:	e20430f7 	and	r3, r4, #247	; 0xf7
 970:	e3530070 	cmp	r3, #112	; 0x70
 974:	0a000017 	beq	9d8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 978:	e3540073 	cmp	r4, #115	; 0x73
 97c:	0a00001c 	beq	9f4 <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 980:	e3540063 	cmp	r4, #99	; 0x63
 984:	0a000037 	beq	a68 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 988:	e3540025 	cmp	r4, #37	; 0x25
 98c:	0a000027 	beq	a30 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 990:	e3a02001 	mov	r2, #1
 994:	e24b1021 	sub	r1, fp, #33	; 0x21
 998:	e1a00007 	mov	r0, r7
 99c:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 9a0:	ebfffebb 	bl	494 <write>
 9a4:	e24b1020 	sub	r1, fp, #32
 9a8:	e3a02001 	mov	r2, #1
 9ac:	e1a00007 	mov	r0, r7
 9b0:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9b4:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9b8:	ebfffeb5 	bl	494 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9bc:	e5f64001 	ldrb	r4, [r6, #1]!
 9c0:	e3540000 	cmp	r4, #0
 9c4:	1affffe2 	bne	954 <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9c8:	e24bd01c 	sub	sp, fp, #28
 9cc:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 9d0:	e28dd00c 	add	sp, sp, #12
 9d4:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 9d8:	e3a03000 	mov	r3, #0
 9dc:	e3a02010 	mov	r2, #16
 9e0:	e4991004 	ldr	r1, [r9], #4
 9e4:	e1a00007 	mov	r0, r7
 9e8:	ebffff79 	bl	7d4 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9ec:	e3a05000 	mov	r5, #0
 9f0:	eaffffd4 	b	948 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 9f4:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 9f8:	e3540000 	cmp	r4, #0
 9fc:	01a04008 	moveq	r4, r8
        while(*s != 0){
 a00:	e5d45000 	ldrb	r5, [r4]
 a04:	e3550000 	cmp	r5, #0
 a08:	0affffce 	beq	948 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a0c:	e3a02001 	mov	r2, #1
 a10:	e24b1025 	sub	r1, fp, #37	; 0x25
 a14:	e1a00007 	mov	r0, r7
 a18:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 a1c:	ebfffe9c 	bl	494 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 a20:	e5f45001 	ldrb	r5, [r4, #1]!
 a24:	e3550000 	cmp	r5, #0
 a28:	1afffff7 	bne	a0c <printf+0x11c>
 a2c:	eaffffc5 	b	948 <printf+0x58>
 a30:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a34:	e3a02001 	mov	r2, #1
 a38:	e1a00007 	mov	r0, r7
 a3c:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a40:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a44:	ebfffe92 	bl	494 <write>
 a48:	eaffffbe 	b	948 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a4c:	e3a03001 	mov	r3, #1
 a50:	e3a0200a 	mov	r2, #10
 a54:	e4991004 	ldr	r1, [r9], #4
 a58:	e1a00007 	mov	r0, r7
 a5c:	ebffff5c 	bl	7d4 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a60:	e3a05000 	mov	r5, #0
 a64:	eaffffb7 	b	948 <printf+0x58>
 a68:	e4993004 	ldr	r3, [r9], #4
 a6c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a70:	e3a02001 	mov	r2, #1
 a74:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a78:	e3a05000 	mov	r5, #0
 a7c:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a80:	ebfffe83 	bl	494 <write>
 a84:	eaffffaf 	b	948 <printf+0x58>

00000a88 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a88:	e300cc5c 	movw	ip, #3164	; 0xc5c
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a8c:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a90:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 a94:	e92d4810 	push	{r4, fp, lr}
 a98:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a9c:	e59c3000 	ldr	r3, [ip]
 aa0:	ea000004 	b	ab8 <free+0x30>
 aa4:	e1510002 	cmp	r1, r2
 aa8:	3a000009 	bcc	ad4 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 aac:	e1530002 	cmp	r3, r2
 ab0:	2a000007 	bcs	ad4 <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 ab4:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ab8:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 abc:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ac0:	3afffff7 	bcc	aa4 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ac4:	e1530002 	cmp	r3, r2
 ac8:	3afffff9 	bcc	ab4 <free+0x2c>
 acc:	e1510002 	cmp	r1, r2
 ad0:	2afffff7 	bcs	ab4 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ad4:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 ad8:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 adc:	e081418e 	add	r4, r1, lr, lsl #3
 ae0:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 ae4:	05922004 	ldreq	r2, [r2, #4]
 ae8:	0082e00e 	addeq	lr, r2, lr
 aec:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 af0:	05932000 	ldreq	r2, [r3]
 af4:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 af8:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 afc:	e5932004 	ldr	r2, [r3, #4]
 b00:	e083e182 	add	lr, r3, r2, lsl #3
 b04:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b08:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 b0c:	05101004 	ldreq	r1, [r0, #-4]
 b10:	00812002 	addeq	r2, r1, r2
 b14:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b18:	05102008 	ldreq	r2, [r0, #-8]
 b1c:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 b20:	e8bd8810 	pop	{r4, fp, pc}

00000b24 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b24:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b28:	e3008c5c 	movw	r8, #3164	; 0xc5c
 b2c:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b30:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 b34:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 b38:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b3c:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 b40:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b44:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b48:	0a00002a 	beq	bf8 <malloc+0xd4>
 b4c:	e5930000 	ldr	r0, [r3]
 b50:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b54:	e1540002 	cmp	r4, r2
 b58:	9a00001c 	bls	bd0 <malloc+0xac>
 b5c:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b60:	e3005c5c 	movw	r5, #3164	; 0xc5c
 b64:	e3405000 	movt	r5, #0
 b68:	33a06902 	movcc	r6, #32768	; 0x8000
 b6c:	21a06184 	lslcs	r6, r4, #3
 b70:	21a07004 	movcs	r7, r4
 b74:	33a07a01 	movcc	r7, #4096	; 0x1000
 b78:	ea000003 	b	b8c <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b7c:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b80:	e5902004 	ldr	r2, [r0, #4]
 b84:	e1540002 	cmp	r4, r2
 b88:	9a000010 	bls	bd0 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b8c:	e5982000 	ldr	r2, [r8]
 b90:	e1a03000 	mov	r3, r0
 b94:	e1520000 	cmp	r2, r0
 b98:	1afffff7 	bne	b7c <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b9c:	e1a00006 	mov	r0, r6
 ba0:	ebfffee4 	bl	738 <sbrk>
 ba4:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 ba8:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 bac:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 bb0:	0a000004 	beq	bc8 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 bb4:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 bb8:	ebffffb2 	bl	a88 <free>
  return freep;
 bbc:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 bc0:	e3530000 	cmp	r3, #0
 bc4:	1affffec 	bne	b7c <malloc+0x58>
        return 0;
 bc8:	e3a00000 	mov	r0, #0
  }
}
 bcc:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 bd0:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 bd4:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 bd8:	10642002 	rsbne	r2, r4, r2
 bdc:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 be0:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 be4:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 be8:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 bec:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 bf0:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 bf4:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 bf8:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 bfc:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 c00:	e5880000 	str	r0, [r8]
 c04:	e5880004 	str	r0, [r8, #4]
 c08:	eaffffd3 	b	b5c <malloc+0x38>
