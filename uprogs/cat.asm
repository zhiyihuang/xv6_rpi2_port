
_cat:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
   0:	e3500001 	cmp	r0, #1
  }
}

int
main(int argc, char *argv[])
{
   4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
   8:	c1a08000 	movgt	r8, r0
   c:	e28db01c 	add	fp, sp, #28
  10:	c2814004 	addgt	r4, r1, #4
  int fd, i;

  if(argc <= 1){
  14:	c3a05001 	movgt	r5, #1
  18:	da000013 	ble	6c <main+0x6c>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  1c:	e5940000 	ldr	r0, [r4]
  20:	e3a01000 	mov	r1, #0
  24:	eb00013e 	bl	524 <open>
  28:	e1a06004 	mov	r6, r4
  2c:	e2844004 	add	r4, r4, #4
  30:	e2507000 	subs	r7, r0, #0
  34:	ba000006 	blt	54 <main+0x54>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  38:	eb00000e 	bl	78 <cat>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  3c:	e2855001 	add	r5, r5, #1
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    close(fd);
  40:	e1a00007 	mov	r0, r7
  44:	eb00010f 	bl	488 <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  48:	e1580005 	cmp	r8, r5
  4c:	1afffff2 	bne	1c <main+0x1c>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
  50:	eb0000cb 	bl	384 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
  54:	e3001be0 	movw	r1, #3040	; 0xbe0
  58:	e5962000 	ldr	r2, [r6]
  5c:	e3401000 	movt	r1, #0
  60:	e3a00001 	mov	r0, #1
  64:	eb000211 	bl	8b0 <printf>
      exit();
  68:	eb0000c5 	bl	384 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
  6c:	e3a00000 	mov	r0, #0
  70:	eb000000 	bl	78 <cat>
    exit();
  74:	eb0000c2 	bl	384 <exit>

00000078 <cat>:

char buf[512];

void
cat(int fd)
{
  78:	e92d4830 	push	{r4, r5, fp, lr}
  7c:	e1a04000 	mov	r4, r0
  80:	e28db00c 	add	fp, sp, #12
  int n;
  while((n = read(fd, buf, sizeof(buf))) > 0)
  84:	ea000003 	b	98 <cat+0x20>
    write(1, buf, n);
  88:	e3001c20 	movw	r1, #3104	; 0xc20
  8c:	e3a00001 	mov	r0, #1
  90:	e3401000 	movt	r1, #0
  94:	eb0000ee 	bl	454 <write>

void
cat(int fd)
{
  int n;
  while((n = read(fd, buf, sizeof(buf))) > 0)
  98:	e3001c20 	movw	r1, #3104	; 0xc20
  9c:	e3a02c02 	mov	r2, #512	; 0x200
  a0:	e3401000 	movt	r1, #0
  a4:	e1a00004 	mov	r0, r4
  a8:	eb0000dc 	bl	420 <read>
  ac:	e2502000 	subs	r2, r0, #0
  b0:	cafffff4 	bgt	88 <cat+0x10>
    write(1, buf, n);
  if(n < 0){
  b4:	08bd8830 	popeq	{r4, r5, fp, pc}
    printf(1, "cat: read error\n");
  b8:	e3001bcc 	movw	r1, #3020	; 0xbcc
  bc:	e3a00001 	mov	r0, #1
  c0:	e3401000 	movt	r1, #0
  c4:	eb0001f9 	bl	8b0 <printf>
    exit();
  c8:	eb0000ad 	bl	384 <exit>

000000cc <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  d0:	e2402001 	sub	r2, r0, #1
  d4:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  d8:	e4d13001 	ldrb	r3, [r1], #1
  dc:	e3530000 	cmp	r3, #0
  e0:	e5e23001 	strb	r3, [r2, #1]!
  e4:	1afffffb 	bne	d8 <strcpy+0xc>
    ;
  return os;
}
  e8:	e24bd000 	sub	sp, fp, #0
  ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  f0:	e12fff1e 	bx	lr

000000f4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  f8:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  fc:	e5d03000 	ldrb	r3, [r0]
 100:	e3530000 	cmp	r3, #0
 104:	05d10000 	ldrbeq	r0, [r1]
 108:	0a00000a 	beq	138 <strcmp+0x44>
 10c:	e5d12000 	ldrb	r2, [r1]
 110:	e1530002 	cmp	r3, r2
 114:	0a000003 	beq	128 <strcmp+0x34>
 118:	ea00000a 	b	148 <strcmp+0x54>
 11c:	e5f12001 	ldrb	r2, [r1, #1]!
 120:	e1530002 	cmp	r3, r2
 124:	1a000007 	bne	148 <strcmp+0x54>
 128:	e5f03001 	ldrb	r3, [r0, #1]!
 12c:	e3530000 	cmp	r3, #0
 130:	1afffff9 	bne	11c <strcmp+0x28>
 134:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 138:	e0600003 	rsb	r0, r0, r3
 13c:	e24bd000 	sub	sp, fp, #0
 140:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 144:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 148:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 14c:	e0600003 	rsb	r0, r0, r3
 150:	e24bd000 	sub	sp, fp, #0
 154:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 158:	e12fff1e 	bx	lr

0000015c <strlen>:

uint
strlen(char *s)
{
 15c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 160:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 164:	e5d03000 	ldrb	r3, [r0]
 168:	e3530000 	cmp	r3, #0
 16c:	0a000009 	beq	198 <strlen+0x3c>
 170:	e1a02000 	mov	r2, r0
 174:	e3a03000 	mov	r3, #0
 178:	e5f21001 	ldrb	r1, [r2, #1]!
 17c:	e2833001 	add	r3, r3, #1
 180:	e3510000 	cmp	r1, #0
 184:	e1a00003 	mov	r0, r3
 188:	1afffffa 	bne	178 <strlen+0x1c>
    ;
  return n;
}
 18c:	e24bd000 	sub	sp, fp, #0
 190:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 194:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 198:	e1a00003 	mov	r0, r3
 19c:	eafffffa 	b	18c <strlen+0x30>

000001a0 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1a0:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 1a4:	e1a03000 	mov	r3, r0
 1a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1ac:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 1b0:	0a000004 	beq	1c8 <memset+0x28>
 1b4:	e6ef1071 	uxtb	r1, r1
 1b8:	e0800002 	add	r0, r0, r2
 1bc:	e4c31001 	strb	r1, [r3], #1
 1c0:	e1500003 	cmp	r0, r3
 1c4:	1afffffc 	bne	1bc <memset+0x1c>
  return (void *)p;
}
 1c8:	e24bd000 	sub	sp, fp, #0
 1cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1d0:	e12fff1e 	bx	lr

000001d4 <strchr>:

char*
strchr(const char *s, char c)
{
 1d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1d8:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 1dc:	e5d02000 	ldrb	r2, [r0]
 1e0:	e3520000 	cmp	r2, #0
 1e4:	0a00000b 	beq	218 <strchr+0x44>
    if(*s == c)
 1e8:	e1510002 	cmp	r1, r2
 1ec:	1a000002 	bne	1fc <strchr+0x28>
 1f0:	ea000005 	b	20c <strchr+0x38>
 1f4:	e1530001 	cmp	r3, r1
 1f8:	0a000003 	beq	20c <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1fc:	e5f03001 	ldrb	r3, [r0, #1]!
 200:	e3530000 	cmp	r3, #0
 204:	1afffffa 	bne	1f4 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 208:	e1a00003 	mov	r0, r3
}
 20c:	e24bd000 	sub	sp, fp, #0
 210:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 214:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 218:	e1a00002 	mov	r0, r2
 21c:	eafffffa 	b	20c <strchr+0x38>

00000220 <gets>:
}

char*
gets(char *buf, int max)
{
 220:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 224:	e1a08000 	mov	r8, r0
 228:	e28db018 	add	fp, sp, #24
 22c:	e1a07001 	mov	r7, r1
 230:	e24dd00c 	sub	sp, sp, #12
 234:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 238:	e3a05000 	mov	r5, #0
 23c:	ea000008 	b	264 <gets+0x44>
    cc = read(0, &c, 1);
 240:	eb000076 	bl	420 <read>
    if(cc < 1)
 244:	e3500000 	cmp	r0, #0
 248:	da00000b 	ble	27c <gets+0x5c>
      break;
    buf[i++] = c;
 24c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 250:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 254:	e353000d 	cmp	r3, #13
 258:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 25c:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 260:	0a000005 	beq	27c <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 264:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 268:	e0854002 	add	r4, r5, r2
 26c:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 270:	e24b101d 	sub	r1, fp, #29
 274:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 278:	bafffff0 	blt	240 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 27c:	e3a03000 	mov	r3, #0
  return buf;
}
 280:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 284:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 288:	e24bd018 	sub	sp, fp, #24
 28c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000290 <stat>:

int
stat(char *n, struct stat *st)
{
 290:	e92d4830 	push	{r4, r5, fp, lr}
 294:	e1a04001 	mov	r4, r1
 298:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29c:	e3a01000 	mov	r1, #0
 2a0:	eb00009f 	bl	524 <open>
  if(fd < 0)
 2a4:	e2505000 	subs	r5, r0, #0
 2a8:	ba000006 	blt	2c8 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 2ac:	e1a01004 	mov	r1, r4
 2b0:	eb0000c2 	bl	5c0 <fstat>
 2b4:	e1a04000 	mov	r4, r0
  close(fd);
 2b8:	e1a00005 	mov	r0, r5
 2bc:	eb000071 	bl	488 <close>
  return r;
 2c0:	e1a00004 	mov	r0, r4
 2c4:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2c8:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 2cc:	e8bd8830 	pop	{r4, r5, fp, pc}

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2d4:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d8:	e5d01000 	ldrb	r1, [r0]
 2dc:	e2413030 	sub	r3, r1, #48	; 0x30
 2e0:	e3530009 	cmp	r3, #9
 2e4:	e3a03000 	mov	r3, #0
 2e8:	8a000007 	bhi	30c <atoi+0x3c>
    n = n*10 + *s++ - '0';
 2ec:	e1a02183 	lsl	r2, r3, #3
 2f0:	e0823083 	add	r3, r2, r3, lsl #1
 2f4:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f8:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 2fc:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 300:	e2412030 	sub	r2, r1, #48	; 0x30
 304:	e3520009 	cmp	r2, #9
 308:	9afffff7 	bls	2ec <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 30c:	e1a00003 	mov	r0, r3
 310:	e24bd000 	sub	sp, fp, #0
 314:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 318:	e12fff1e 	bx	lr

0000031c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 320:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 324:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 328:	da000005 	ble	344 <memmove+0x28>
 32c:	e0812002 	add	r2, r1, r2
 330:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 334:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 338:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 33c:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 340:	1afffffb 	bne	334 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 344:	e24bd000 	sub	sp, fp, #0
 348:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 34c:	e12fff1e 	bx	lr

00000350 <fork>:
 350:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 354:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 358:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 35c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 360:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 364:	e3a00001 	mov	r0, #1
 368:	ef000040 	svc	0x00000040
 36c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 370:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 374:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 378:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 37c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 380:	e12fff1e 	bx	lr

00000384 <exit>:
 384:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 388:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 38c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 390:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 394:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 398:	e3a00002 	mov	r0, #2
 39c:	ef000040 	svc	0x00000040
 3a0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3a8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3ac:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3b0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3b4:	e12fff1e 	bx	lr

000003b8 <wait>:
 3b8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3bc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3c0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3c4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3c8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3cc:	e3a00003 	mov	r0, #3
 3d0:	ef000040 	svc	0x00000040
 3d4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3dc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3e0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3e4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3e8:	e12fff1e 	bx	lr

000003ec <pipe>:
 3ec:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3f0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3f4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3f8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3fc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 400:	e3a00004 	mov	r0, #4
 404:	ef000040 	svc	0x00000040
 408:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 40c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 410:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 414:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 418:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 41c:	e12fff1e 	bx	lr

00000420 <read>:
 420:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 424:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 428:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 42c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 430:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 434:	e3a00005 	mov	r0, #5
 438:	ef000040 	svc	0x00000040
 43c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 440:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 444:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 448:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 44c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 450:	e12fff1e 	bx	lr

00000454 <write>:
 454:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 458:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 45c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 460:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 464:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 468:	e3a00010 	mov	r0, #16
 46c:	ef000040 	svc	0x00000040
 470:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 474:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 478:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 47c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 480:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 484:	e12fff1e 	bx	lr

00000488 <close>:
 488:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 48c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 490:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 494:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 498:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 49c:	e3a00015 	mov	r0, #21
 4a0:	ef000040 	svc	0x00000040
 4a4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ac:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4b0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4b4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4b8:	e12fff1e 	bx	lr

000004bc <kill>:
 4bc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4c0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4c4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4c8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4cc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4d0:	e3a00006 	mov	r0, #6
 4d4:	ef000040 	svc	0x00000040
 4d8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4e4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4e8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4ec:	e12fff1e 	bx	lr

000004f0 <exec>:
 4f0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4f4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4f8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4fc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 500:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 504:	e3a00007 	mov	r0, #7
 508:	ef000040 	svc	0x00000040
 50c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 510:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 514:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 518:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 51c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 520:	e12fff1e 	bx	lr

00000524 <open>:
 524:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 528:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 52c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 530:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 534:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 538:	e3a0000f 	mov	r0, #15
 53c:	ef000040 	svc	0x00000040
 540:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 544:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 548:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 54c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 550:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 554:	e12fff1e 	bx	lr

00000558 <mknod>:
 558:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 55c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 560:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 564:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 568:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 56c:	e3a00011 	mov	r0, #17
 570:	ef000040 	svc	0x00000040
 574:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 578:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 57c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 580:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 584:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 588:	e12fff1e 	bx	lr

0000058c <unlink>:
 58c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 590:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 594:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 598:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 59c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5a0:	e3a00012 	mov	r0, #18
 5a4:	ef000040 	svc	0x00000040
 5a8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5b4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5b8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5bc:	e12fff1e 	bx	lr

000005c0 <fstat>:
 5c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d4:	e3a00008 	mov	r0, #8
 5d8:	ef000040 	svc	0x00000040
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f0:	e12fff1e 	bx	lr

000005f4 <link>:
 5f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 600:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 604:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 608:	e3a00013 	mov	r0, #19
 60c:	ef000040 	svc	0x00000040
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 61c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 620:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 624:	e12fff1e 	bx	lr

00000628 <mkdir>:
 628:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 62c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 630:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 634:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 638:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 63c:	e3a00014 	mov	r0, #20
 640:	ef000040 	svc	0x00000040
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 650:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 654:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 658:	e12fff1e 	bx	lr

0000065c <chdir>:
 65c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 660:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 664:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 668:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 66c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 670:	e3a00009 	mov	r0, #9
 674:	ef000040 	svc	0x00000040
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 684:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 688:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 68c:	e12fff1e 	bx	lr

00000690 <dup>:
 690:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 694:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 698:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 69c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a4:	e3a0000a 	mov	r0, #10
 6a8:	ef000040 	svc	0x00000040
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c0:	e12fff1e 	bx	lr

000006c4 <getpid>:
 6c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d8:	e3a0000b 	mov	r0, #11
 6dc:	ef000040 	svc	0x00000040
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f4:	e12fff1e 	bx	lr

000006f8 <sbrk>:
 6f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 700:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 704:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 708:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 70c:	e3a0000c 	mov	r0, #12
 710:	ef000040 	svc	0x00000040
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 720:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 724:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 728:	e12fff1e 	bx	lr

0000072c <sleep>:
 72c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 730:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 734:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 738:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 73c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 740:	e3a0000d 	mov	r0, #13
 744:	ef000040 	svc	0x00000040
 748:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 74c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 750:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 754:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 758:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 75c:	e12fff1e 	bx	lr

00000760 <uptime>:
 760:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 764:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 768:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 76c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 770:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 774:	e3a0000e 	mov	r0, #14
 778:	ef000040 	svc	0x00000040
 77c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 780:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 784:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 788:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 78c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 790:	e12fff1e 	bx	lr

00000794 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 794:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 798:	e1a09fa1 	lsr	r9, r1, #31
 79c:	e3530000 	cmp	r3, #0
 7a0:	03a03000 	moveq	r3, #0
 7a4:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7a8:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 7ac:	e3530000 	cmp	r3, #0
 7b0:	e3008bf8 	movw	r8, #3064	; 0xbf8
    neg = 1;
    x = -xx;
 7b4:	1261e000 	rsbne	lr, r1, #0
 7b8:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7bc:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 7c0:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 7c4:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 7c8:	01a09003 	moveq	r9, r3
 7cc:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 7d0:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 7d4:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7d8:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7dc:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 7e0:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 7e4:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 7e8:	e1a0033e 	lsr	r0, lr, r3
 7ec:	e2000001 	and	r0, r0, #1
 7f0:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 7f4:	e1520001 	cmp	r2, r1
            r = r - d;
 7f8:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 7fc:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 800:	e2533001 	subs	r3, r3, #1
 804:	2afffff7 	bcs	7e8 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 808:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 80c:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 810:	e2873001 	add	r3, r7, #1
 814:	e7d8100e 	ldrb	r1, [r8, lr]
 818:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 81c:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 820:	11a07003 	movne	r7, r3
 824:	1affffec 	bne	7dc <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 828:	e3590000 	cmp	r9, #0
 82c:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 830:	124b201c 	subne	r2, fp, #28
 834:	10822003 	addne	r2, r2, r3
 838:	12873002 	addne	r3, r7, #2
 83c:	e0865003 	add	r5, r6, r3
 840:	13a0102d 	movne	r1, #45	; 0x2d
 844:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 848:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 84c:	e3a02001 	mov	r2, #1
 850:	e24b102d 	sub	r1, fp, #45	; 0x2d
 854:	e1a00004 	mov	r0, r4
 858:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 85c:	ebfffefc 	bl	454 <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 860:	e1560005 	cmp	r6, r5
 864:	1afffff7 	bne	848 <printint+0xb4>
    putc(fd, buf[i]);
}
 868:	e24bd01c 	sub	sp, fp, #28
 86c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000870 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 870:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 874:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 878:	e28db008 	add	fp, sp, #8
 87c:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 880:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 884:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 888:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 88c:	e1a0c33e 	lsr	ip, lr, r3
 890:	e20cc001 	and	ip, ip, #1
 894:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 898:	e1520001 	cmp	r2, r1
            r = r - d;
 89c:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 8a0:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8a4:	e2533001 	subs	r3, r3, #1
 8a8:	2afffff7 	bcs	88c <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 8ac:	e8bd8810 	pop	{r4, fp, pc}

000008b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 8b0:	e92d000e 	push	{r1, r2, r3}
 8b4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 8b8:	e28db01c 	add	fp, sp, #28
 8bc:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8c0:	e59b6004 	ldr	r6, [fp, #4]
 8c4:	e5d64000 	ldrb	r4, [r6]
 8c8:	e3540000 	cmp	r4, #0
 8cc:	0a00002d 	beq	988 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 8d0:	e3008c0c 	movw	r8, #3084	; 0xc0c
 8d4:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8d8:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 8dc:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8e0:	e3a05000 	mov	r5, #0
 8e4:	ea00000a 	b	914 <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8e8:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 8ec:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8f0:	0a000004 	beq	908 <printf+0x58>
 8f4:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8f8:	e3a02001 	mov	r2, #1
 8fc:	e1a00007 	mov	r0, r7
 900:	e5614006 	strb	r4, [r1, #-6]!
 904:	ebfffed2 	bl	454 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 908:	e5f64001 	ldrb	r4, [r6, #1]!
 90c:	e3540000 	cmp	r4, #0
 910:	0a00001c 	beq	988 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 914:	e3550000 	cmp	r5, #0
 918:	0afffff2 	beq	8e8 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 91c:	e3550025 	cmp	r5, #37	; 0x25
 920:	1afffff8 	bne	908 <printf+0x58>
      if(c == 'd'){
 924:	e3540064 	cmp	r4, #100	; 0x64
 928:	0a000037 	beq	a0c <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 92c:	e20430f7 	and	r3, r4, #247	; 0xf7
 930:	e3530070 	cmp	r3, #112	; 0x70
 934:	0a000017 	beq	998 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 938:	e3540073 	cmp	r4, #115	; 0x73
 93c:	0a00001c 	beq	9b4 <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 940:	e3540063 	cmp	r4, #99	; 0x63
 944:	0a000037 	beq	a28 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 948:	e3540025 	cmp	r4, #37	; 0x25
 94c:	0a000027 	beq	9f0 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 950:	e3a02001 	mov	r2, #1
 954:	e24b1021 	sub	r1, fp, #33	; 0x21
 958:	e1a00007 	mov	r0, r7
 95c:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 960:	ebfffebb 	bl	454 <write>
 964:	e24b1020 	sub	r1, fp, #32
 968:	e3a02001 	mov	r2, #1
 96c:	e1a00007 	mov	r0, r7
 970:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 974:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 978:	ebfffeb5 	bl	454 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 97c:	e5f64001 	ldrb	r4, [r6, #1]!
 980:	e3540000 	cmp	r4, #0
 984:	1affffe2 	bne	914 <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 988:	e24bd01c 	sub	sp, fp, #28
 98c:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 990:	e28dd00c 	add	sp, sp, #12
 994:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 998:	e3a03000 	mov	r3, #0
 99c:	e3a02010 	mov	r2, #16
 9a0:	e4991004 	ldr	r1, [r9], #4
 9a4:	e1a00007 	mov	r0, r7
 9a8:	ebffff79 	bl	794 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9ac:	e3a05000 	mov	r5, #0
 9b0:	eaffffd4 	b	908 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 9b4:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 9b8:	e3540000 	cmp	r4, #0
 9bc:	01a04008 	moveq	r4, r8
        while(*s != 0){
 9c0:	e5d45000 	ldrb	r5, [r4]
 9c4:	e3550000 	cmp	r5, #0
 9c8:	0affffce 	beq	908 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9cc:	e3a02001 	mov	r2, #1
 9d0:	e24b1025 	sub	r1, fp, #37	; 0x25
 9d4:	e1a00007 	mov	r0, r7
 9d8:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 9dc:	ebfffe9c 	bl	454 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 9e0:	e5f45001 	ldrb	r5, [r4, #1]!
 9e4:	e3550000 	cmp	r5, #0
 9e8:	1afffff7 	bne	9cc <printf+0x11c>
 9ec:	eaffffc5 	b	908 <printf+0x58>
 9f0:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9f4:	e3a02001 	mov	r2, #1
 9f8:	e1a00007 	mov	r0, r7
 9fc:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a00:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a04:	ebfffe92 	bl	454 <write>
 a08:	eaffffbe 	b	908 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 a0c:	e3a03001 	mov	r3, #1
 a10:	e3a0200a 	mov	r2, #10
 a14:	e4991004 	ldr	r1, [r9], #4
 a18:	e1a00007 	mov	r0, r7
 a1c:	ebffff5c 	bl	794 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a20:	e3a05000 	mov	r5, #0
 a24:	eaffffb7 	b	908 <printf+0x58>
 a28:	e4993004 	ldr	r3, [r9], #4
 a2c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a30:	e3a02001 	mov	r2, #1
 a34:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a38:	e3a05000 	mov	r5, #0
 a3c:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a40:	ebfffe83 	bl	454 <write>
 a44:	eaffffaf 	b	908 <printf+0x58>

00000a48 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a48:	e300cc14 	movw	ip, #3092	; 0xc14
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a4c:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a50:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 a54:	e92d4810 	push	{r4, fp, lr}
 a58:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a5c:	e59c3000 	ldr	r3, [ip]
 a60:	ea000004 	b	a78 <free+0x30>
 a64:	e1510002 	cmp	r1, r2
 a68:	3a000009 	bcc	a94 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a6c:	e1530002 	cmp	r3, r2
 a70:	2a000007 	bcs	a94 <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a74:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a78:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a7c:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a80:	3afffff7 	bcc	a64 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a84:	e1530002 	cmp	r3, r2
 a88:	3afffff9 	bcc	a74 <free+0x2c>
 a8c:	e1510002 	cmp	r1, r2
 a90:	2afffff7 	bcs	a74 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a94:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a98:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a9c:	e081418e 	add	r4, r1, lr, lsl #3
 aa0:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 aa4:	05922004 	ldreq	r2, [r2, #4]
 aa8:	0082e00e 	addeq	lr, r2, lr
 aac:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 ab0:	05932000 	ldreq	r2, [r3]
 ab4:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 ab8:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 abc:	e5932004 	ldr	r2, [r3, #4]
 ac0:	e083e182 	add	lr, r3, r2, lsl #3
 ac4:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 ac8:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 acc:	05101004 	ldreq	r1, [r0, #-4]
 ad0:	00812002 	addeq	r2, r1, r2
 ad4:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 ad8:	05102008 	ldreq	r2, [r0, #-8]
 adc:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 ae0:	e8bd8810 	pop	{r4, fp, pc}

00000ae4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ae4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 ae8:	e3008c14 	movw	r8, #3092	; 0xc14
 aec:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 af0:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 af4:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 af8:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 afc:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 b00:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b04:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 b08:	0a00002a 	beq	bb8 <malloc+0xd4>
 b0c:	e5930000 	ldr	r0, [r3]
 b10:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 b14:	e1540002 	cmp	r4, r2
 b18:	9a00001c 	bls	b90 <malloc+0xac>
 b1c:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b20:	e3005c14 	movw	r5, #3092	; 0xc14
 b24:	e3405000 	movt	r5, #0
 b28:	33a06902 	movcc	r6, #32768	; 0x8000
 b2c:	21a06184 	lslcs	r6, r4, #3
 b30:	21a07004 	movcs	r7, r4
 b34:	33a07a01 	movcc	r7, #4096	; 0x1000
 b38:	ea000003 	b	b4c <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b3c:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 b40:	e5902004 	ldr	r2, [r0, #4]
 b44:	e1540002 	cmp	r4, r2
 b48:	9a000010 	bls	b90 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b4c:	e5982000 	ldr	r2, [r8]
 b50:	e1a03000 	mov	r3, r0
 b54:	e1520000 	cmp	r2, r0
 b58:	1afffff7 	bne	b3c <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b5c:	e1a00006 	mov	r0, r6
 b60:	ebfffee4 	bl	6f8 <sbrk>
 b64:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b68:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 b6c:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 b70:	0a000004 	beq	b88 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b74:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 b78:	ebffffb2 	bl	a48 <free>
  return freep;
 b7c:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b80:	e3530000 	cmp	r3, #0
 b84:	1affffec 	bne	b3c <malloc+0x58>
        return 0;
 b88:	e3a00000 	mov	r0, #0
  }
}
 b8c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b90:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 b94:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b98:	10642002 	rsbne	r2, r4, r2
 b9c:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 ba0:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 ba4:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 ba8:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 bac:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 bb0:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 bb4:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 bb8:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 bbc:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 bc0:	e5880000 	str	r0, [r8]
 bc4:	e5880004 	str	r0, [r8, #4]
 bc8:	eaffffd3 	b	b1c <malloc+0x38>
