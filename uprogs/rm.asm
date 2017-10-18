
_rm:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
   0:	e3500001 	cmp	r0, #1
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	c1a07000 	movgt	r7, r0
   c:	e28db014 	add	fp, sp, #20
  10:	c2814004 	addgt	r4, r1, #4
  int i;

  if(argc < 2){
  14:	c3a05001 	movgt	r5, #1
  18:	da00000f 	ble	5c <main+0x5c>
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  1c:	e1a06004 	mov	r6, r4
  20:	e2844004 	add	r4, r4, #4
  24:	e5960000 	ldr	r0, [r6]
  28:	eb000140 	bl	530 <unlink>
  2c:	e3500000 	cmp	r0, #0
  30:	ba000003 	blt	44 <main+0x44>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  34:	e2855001 	add	r5, r5, #1
  38:	e1570005 	cmp	r7, r5
  3c:	1afffff6 	bne	1c <main+0x1c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  40:	eb0000b8 	bl	328 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
      printf(2, "rm: %s failed to delete\n", argv[i]);
  44:	e3001b84 	movw	r1, #2948	; 0xb84
  48:	e5962000 	ldr	r2, [r6]
  4c:	e3401000 	movt	r1, #0
  50:	e3a00002 	mov	r0, #2
  54:	eb0001fe 	bl	854 <printf>
      break;
  58:	eafffff8 	b	40 <main+0x40>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: rm files...\n");
  5c:	e3001b70 	movw	r1, #2928	; 0xb70
  60:	e3a00002 	mov	r0, #2
  64:	e3401000 	movt	r1, #0
  68:	eb0001f9 	bl	854 <printf>
    exit();
  6c:	eb0000ad 	bl	328 <exit>

00000070 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
  70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  74:	e2402001 	sub	r2, r0, #1
  78:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7c:	e4d13001 	ldrb	r3, [r1], #1
  80:	e3530000 	cmp	r3, #0
  84:	e5e23001 	strb	r3, [r2, #1]!
  88:	1afffffb 	bne	7c <strcpy+0xc>
    ;
  return os;
}
  8c:	e24bd000 	sub	sp, fp, #0
  90:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  94:	e12fff1e 	bx	lr

00000098 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  98:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  9c:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
  a0:	e5d03000 	ldrb	r3, [r0]
  a4:	e3530000 	cmp	r3, #0
  a8:	05d10000 	ldrbeq	r0, [r1]
  ac:	0a00000a 	beq	dc <strcmp+0x44>
  b0:	e5d12000 	ldrb	r2, [r1]
  b4:	e1530002 	cmp	r3, r2
  b8:	0a000003 	beq	cc <strcmp+0x34>
  bc:	ea00000a 	b	ec <strcmp+0x54>
  c0:	e5f12001 	ldrb	r2, [r1, #1]!
  c4:	e1530002 	cmp	r3, r2
  c8:	1a000007 	bne	ec <strcmp+0x54>
  cc:	e5f03001 	ldrb	r3, [r0, #1]!
  d0:	e3530000 	cmp	r3, #0
  d4:	1afffff9 	bne	c0 <strcmp+0x28>
  d8:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  dc:	e0600003 	rsb	r0, r0, r3
  e0:	e24bd000 	sub	sp, fp, #0
  e4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  e8:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ec:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  f0:	e0600003 	rsb	r0, r0, r3
  f4:	e24bd000 	sub	sp, fp, #0
  f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
  fc:	e12fff1e 	bx	lr

00000100 <strlen>:

uint
strlen(char *s)
{
 100:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 104:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 108:	e5d03000 	ldrb	r3, [r0]
 10c:	e3530000 	cmp	r3, #0
 110:	0a000009 	beq	13c <strlen+0x3c>
 114:	e1a02000 	mov	r2, r0
 118:	e3a03000 	mov	r3, #0
 11c:	e5f21001 	ldrb	r1, [r2, #1]!
 120:	e2833001 	add	r3, r3, #1
 124:	e3510000 	cmp	r1, #0
 128:	e1a00003 	mov	r0, r3
 12c:	1afffffa 	bne	11c <strlen+0x1c>
    ;
  return n;
}
 130:	e24bd000 	sub	sp, fp, #0
 134:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 138:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 13c:	e1a00003 	mov	r0, r3
 140:	eafffffa 	b	130 <strlen+0x30>

00000144 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 144:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 148:	e1a03000 	mov	r3, r0
 14c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 150:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 154:	0a000004 	beq	16c <memset+0x28>
 158:	e6ef1071 	uxtb	r1, r1
 15c:	e0800002 	add	r0, r0, r2
 160:	e4c31001 	strb	r1, [r3], #1
 164:	e1500003 	cmp	r0, r3
 168:	1afffffc 	bne	160 <memset+0x1c>
  return (void *)p;
}
 16c:	e24bd000 	sub	sp, fp, #0
 170:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 174:	e12fff1e 	bx	lr

00000178 <strchr>:

char*
strchr(const char *s, char c)
{
 178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 17c:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 180:	e5d02000 	ldrb	r2, [r0]
 184:	e3520000 	cmp	r2, #0
 188:	0a00000b 	beq	1bc <strchr+0x44>
    if(*s == c)
 18c:	e1510002 	cmp	r1, r2
 190:	1a000002 	bne	1a0 <strchr+0x28>
 194:	ea000005 	b	1b0 <strchr+0x38>
 198:	e1530001 	cmp	r3, r1
 19c:	0a000003 	beq	1b0 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1a0:	e5f03001 	ldrb	r3, [r0, #1]!
 1a4:	e3530000 	cmp	r3, #0
 1a8:	1afffffa 	bne	198 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 1ac:	e1a00003 	mov	r0, r3
}
 1b0:	e24bd000 	sub	sp, fp, #0
 1b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1b8:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 1bc:	e1a00002 	mov	r0, r2
 1c0:	eafffffa 	b	1b0 <strchr+0x38>

000001c4 <gets>:
}

char*
gets(char *buf, int max)
{
 1c4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 1c8:	e1a08000 	mov	r8, r0
 1cc:	e28db018 	add	fp, sp, #24
 1d0:	e1a07001 	mov	r7, r1
 1d4:	e24dd00c 	sub	sp, sp, #12
 1d8:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1dc:	e3a05000 	mov	r5, #0
 1e0:	ea000008 	b	208 <gets+0x44>
    cc = read(0, &c, 1);
 1e4:	eb000076 	bl	3c4 <read>
    if(cc < 1)
 1e8:	e3500000 	cmp	r0, #0
 1ec:	da00000b 	ble	220 <gets+0x5c>
      break;
    buf[i++] = c;
 1f0:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 1f4:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 1f8:	e353000d 	cmp	r3, #13
 1fc:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 200:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 204:	0a000005 	beq	220 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 208:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 20c:	e0854002 	add	r4, r5, r2
 210:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 214:	e24b101d 	sub	r1, fp, #29
 218:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21c:	bafffff0 	blt	1e4 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 220:	e3a03000 	mov	r3, #0
  return buf;
}
 224:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 228:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 22c:	e24bd018 	sub	sp, fp, #24
 230:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000234 <stat>:

int
stat(char *n, struct stat *st)
{
 234:	e92d4830 	push	{r4, r5, fp, lr}
 238:	e1a04001 	mov	r4, r1
 23c:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 240:	e3a01000 	mov	r1, #0
 244:	eb00009f 	bl	4c8 <open>
  if(fd < 0)
 248:	e2505000 	subs	r5, r0, #0
 24c:	ba000006 	blt	26c <stat+0x38>
    return -1;
  r = fstat(fd, st);
 250:	e1a01004 	mov	r1, r4
 254:	eb0000c2 	bl	564 <fstat>
 258:	e1a04000 	mov	r4, r0
  close(fd);
 25c:	e1a00005 	mov	r0, r5
 260:	eb000071 	bl	42c <close>
  return r;
 264:	e1a00004 	mov	r0, r4
 268:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 26c:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 270:	e8bd8830 	pop	{r4, r5, fp, pc}

00000274 <atoi>:

int
atoi(const char *s)
{
 274:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 278:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 27c:	e5d01000 	ldrb	r1, [r0]
 280:	e2413030 	sub	r3, r1, #48	; 0x30
 284:	e3530009 	cmp	r3, #9
 288:	e3a03000 	mov	r3, #0
 28c:	8a000007 	bhi	2b0 <atoi+0x3c>
    n = n*10 + *s++ - '0';
 290:	e1a02183 	lsl	r2, r3, #3
 294:	e0823083 	add	r3, r2, r3, lsl #1
 298:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 29c:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 2a0:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a4:	e2412030 	sub	r2, r1, #48	; 0x30
 2a8:	e3520009 	cmp	r2, #9
 2ac:	9afffff7 	bls	290 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 2b0:	e1a00003 	mov	r0, r3
 2b4:	e24bd000 	sub	sp, fp, #0
 2b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2bc:	e12fff1e 	bx	lr

000002c0 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c0:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 2c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2c8:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2cc:	da000005 	ble	2e8 <memmove+0x28>
 2d0:	e0812002 	add	r2, r1, r2
 2d4:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 2d8:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2dc:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 2e0:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2e4:	1afffffb 	bne	2d8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2e8:	e24bd000 	sub	sp, fp, #0
 2ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2f0:	e12fff1e 	bx	lr

000002f4 <fork>:
 2f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 2f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 2fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 300:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 304:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 308:	e3a00001 	mov	r0, #1
 30c:	ef000040 	svc	0x00000040
 310:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 314:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 318:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 31c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 320:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 324:	e12fff1e 	bx	lr

00000328 <exit>:
 328:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 32c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 330:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 334:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 338:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 33c:	e3a00002 	mov	r0, #2
 340:	ef000040 	svc	0x00000040
 344:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 348:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 34c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 350:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 354:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 358:	e12fff1e 	bx	lr

0000035c <wait>:
 35c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 360:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 364:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 368:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 36c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 370:	e3a00003 	mov	r0, #3
 374:	ef000040 	svc	0x00000040
 378:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 37c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 380:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 384:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 388:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 38c:	e12fff1e 	bx	lr

00000390 <pipe>:
 390:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 394:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 398:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 39c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3a4:	e3a00004 	mov	r0, #4
 3a8:	ef000040 	svc	0x00000040
 3ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3c0:	e12fff1e 	bx	lr

000003c4 <read>:
 3c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 3cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 3d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 3d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 3d8:	e3a00005 	mov	r0, #5
 3dc:	ef000040 	svc	0x00000040
 3e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 3e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 3ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 3f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 3f4:	e12fff1e 	bx	lr

000003f8 <write>:
 3f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 3fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 400:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 404:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 408:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 40c:	e3a00010 	mov	r0, #16
 410:	ef000040 	svc	0x00000040
 414:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 420:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 424:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 428:	e12fff1e 	bx	lr

0000042c <close>:
 42c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 430:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 434:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 438:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 43c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 440:	e3a00015 	mov	r0, #21
 444:	ef000040 	svc	0x00000040
 448:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 454:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 458:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 45c:	e12fff1e 	bx	lr

00000460 <kill>:
 460:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 464:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 468:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 46c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 470:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 474:	e3a00006 	mov	r0, #6
 478:	ef000040 	svc	0x00000040
 47c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 488:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 48c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 490:	e12fff1e 	bx	lr

00000494 <exec>:
 494:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 498:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 49c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4a8:	e3a00007 	mov	r0, #7
 4ac:	ef000040 	svc	0x00000040
 4b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c4:	e12fff1e 	bx	lr

000004c8 <open>:
 4c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4dc:	e3a0000f 	mov	r0, #15
 4e0:	ef000040 	svc	0x00000040
 4e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4f8:	e12fff1e 	bx	lr

000004fc <mknod>:
 4fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 500:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 504:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 508:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 50c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 510:	e3a00011 	mov	r0, #17
 514:	ef000040 	svc	0x00000040
 518:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 524:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 528:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 52c:	e12fff1e 	bx	lr

00000530 <unlink>:
 530:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 534:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 538:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 53c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 540:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 544:	e3a00012 	mov	r0, #18
 548:	ef000040 	svc	0x00000040
 54c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 558:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 55c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 560:	e12fff1e 	bx	lr

00000564 <fstat>:
 564:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 568:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 56c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 570:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 574:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 578:	e3a00008 	mov	r0, #8
 57c:	ef000040 	svc	0x00000040
 580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 58c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 590:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 594:	e12fff1e 	bx	lr

00000598 <link>:
 598:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 59c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5ac:	e3a00013 	mov	r0, #19
 5b0:	ef000040 	svc	0x00000040
 5b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c8:	e12fff1e 	bx	lr

000005cc <mkdir>:
 5cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e0:	e3a00014 	mov	r0, #20
 5e4:	ef000040 	svc	0x00000040
 5e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5fc:	e12fff1e 	bx	lr

00000600 <chdir>:
 600:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 604:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 608:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 60c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 610:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 614:	e3a00009 	mov	r0, #9
 618:	ef000040 	svc	0x00000040
 61c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 628:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 62c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 630:	e12fff1e 	bx	lr

00000634 <dup>:
 634:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 638:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 63c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 640:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 644:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 648:	e3a0000a 	mov	r0, #10
 64c:	ef000040 	svc	0x00000040
 650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 65c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 660:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 664:	e12fff1e 	bx	lr

00000668 <getpid>:
 668:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 66c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 670:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 674:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 678:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 67c:	e3a0000b 	mov	r0, #11
 680:	ef000040 	svc	0x00000040
 684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 690:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 694:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 698:	e12fff1e 	bx	lr

0000069c <sbrk>:
 69c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b0:	e3a0000c 	mov	r0, #12
 6b4:	ef000040 	svc	0x00000040
 6b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6cc:	e12fff1e 	bx	lr

000006d0 <sleep>:
 6d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e4:	e3a0000d 	mov	r0, #13
 6e8:	ef000040 	svc	0x00000040
 6ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 700:	e12fff1e 	bx	lr

00000704 <uptime>:
 704:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 708:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 70c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 710:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 714:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 718:	e3a0000e 	mov	r0, #14
 71c:	ef000040 	svc	0x00000040
 720:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 72c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 730:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 734:	e12fff1e 	bx	lr

00000738 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 738:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 73c:	e1a09fa1 	lsr	r9, r1, #31
 740:	e3530000 	cmp	r3, #0
 744:	03a03000 	moveq	r3, #0
 748:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 74c:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 750:	e3530000 	cmp	r3, #0
 754:	e3008ba0 	movw	r8, #2976	; 0xba0
    neg = 1;
    x = -xx;
 758:	1261e000 	rsbne	lr, r1, #0
 75c:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 760:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 764:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 768:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 76c:	01a09003 	moveq	r9, r3
 770:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 774:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 778:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 77c:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 780:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 784:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 788:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 78c:	e1a0033e 	lsr	r0, lr, r3
 790:	e2000001 	and	r0, r0, #1
 794:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 798:	e1520001 	cmp	r2, r1
            r = r - d;
 79c:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 7a0:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 7a4:	e2533001 	subs	r3, r3, #1
 7a8:	2afffff7 	bcs	78c <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7ac:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 7b0:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7b4:	e2873001 	add	r3, r7, #1
 7b8:	e7d8100e 	ldrb	r1, [r8, lr]
 7bc:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 7c0:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 7c4:	11a07003 	movne	r7, r3
 7c8:	1affffec 	bne	780 <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 7cc:	e3590000 	cmp	r9, #0
 7d0:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 7d4:	124b201c 	subne	r2, fp, #28
 7d8:	10822003 	addne	r2, r2, r3
 7dc:	12873002 	addne	r3, r7, #2
 7e0:	e0865003 	add	r5, r6, r3
 7e4:	13a0102d 	movne	r1, #45	; 0x2d
 7e8:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 7ec:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 7f0:	e3a02001 	mov	r2, #1
 7f4:	e24b102d 	sub	r1, fp, #45	; 0x2d
 7f8:	e1a00004 	mov	r0, r4
 7fc:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 800:	ebfffefc 	bl	3f8 <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 804:	e1560005 	cmp	r6, r5
 808:	1afffff7 	bne	7ec <printint+0xb4>
    putc(fd, buf[i]);
}
 80c:	e24bd01c 	sub	sp, fp, #28
 810:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000814 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 814:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 818:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 81c:	e28db008 	add	fp, sp, #8
 820:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 824:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 828:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 82c:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 830:	e1a0c33e 	lsr	ip, lr, r3
 834:	e20cc001 	and	ip, ip, #1
 838:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 83c:	e1520001 	cmp	r2, r1
            r = r - d;
 840:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 844:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 848:	e2533001 	subs	r3, r3, #1
 84c:	2afffff7 	bcs	830 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 850:	e8bd8810 	pop	{r4, fp, pc}

00000854 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 854:	e92d000e 	push	{r1, r2, r3}
 858:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 85c:	e28db01c 	add	fp, sp, #28
 860:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 864:	e59b6004 	ldr	r6, [fp, #4]
 868:	e5d64000 	ldrb	r4, [r6]
 86c:	e3540000 	cmp	r4, #0
 870:	0a00002d 	beq	92c <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 874:	e3008bb4 	movw	r8, #2996	; 0xbb4
 878:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 87c:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 880:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 884:	e3a05000 	mov	r5, #0
 888:	ea00000a 	b	8b8 <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 88c:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 890:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 894:	0a000004 	beq	8ac <printf+0x58>
 898:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 89c:	e3a02001 	mov	r2, #1
 8a0:	e1a00007 	mov	r0, r7
 8a4:	e5614006 	strb	r4, [r1, #-6]!
 8a8:	ebfffed2 	bl	3f8 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8ac:	e5f64001 	ldrb	r4, [r6, #1]!
 8b0:	e3540000 	cmp	r4, #0
 8b4:	0a00001c 	beq	92c <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 8b8:	e3550000 	cmp	r5, #0
 8bc:	0afffff2 	beq	88c <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8c0:	e3550025 	cmp	r5, #37	; 0x25
 8c4:	1afffff8 	bne	8ac <printf+0x58>
      if(c == 'd'){
 8c8:	e3540064 	cmp	r4, #100	; 0x64
 8cc:	0a000037 	beq	9b0 <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8d0:	e20430f7 	and	r3, r4, #247	; 0xf7
 8d4:	e3530070 	cmp	r3, #112	; 0x70
 8d8:	0a000017 	beq	93c <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 8dc:	e3540073 	cmp	r4, #115	; 0x73
 8e0:	0a00001c 	beq	958 <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8e4:	e3540063 	cmp	r4, #99	; 0x63
 8e8:	0a000037 	beq	9cc <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 8ec:	e3540025 	cmp	r4, #37	; 0x25
 8f0:	0a000027 	beq	994 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8f4:	e3a02001 	mov	r2, #1
 8f8:	e24b1021 	sub	r1, fp, #33	; 0x21
 8fc:	e1a00007 	mov	r0, r7
 900:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 904:	ebfffebb 	bl	3f8 <write>
 908:	e24b1020 	sub	r1, fp, #32
 90c:	e3a02001 	mov	r2, #1
 910:	e1a00007 	mov	r0, r7
 914:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 918:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 91c:	ebfffeb5 	bl	3f8 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 920:	e5f64001 	ldrb	r4, [r6, #1]!
 924:	e3540000 	cmp	r4, #0
 928:	1affffe2 	bne	8b8 <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 92c:	e24bd01c 	sub	sp, fp, #28
 930:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 934:	e28dd00c 	add	sp, sp, #12
 938:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 93c:	e3a03000 	mov	r3, #0
 940:	e3a02010 	mov	r2, #16
 944:	e4991004 	ldr	r1, [r9], #4
 948:	e1a00007 	mov	r0, r7
 94c:	ebffff79 	bl	738 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 950:	e3a05000 	mov	r5, #0
 954:	eaffffd4 	b	8ac <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 958:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 95c:	e3540000 	cmp	r4, #0
 960:	01a04008 	moveq	r4, r8
        while(*s != 0){
 964:	e5d45000 	ldrb	r5, [r4]
 968:	e3550000 	cmp	r5, #0
 96c:	0affffce 	beq	8ac <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 970:	e3a02001 	mov	r2, #1
 974:	e24b1025 	sub	r1, fp, #37	; 0x25
 978:	e1a00007 	mov	r0, r7
 97c:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 980:	ebfffe9c 	bl	3f8 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 984:	e5f45001 	ldrb	r5, [r4, #1]!
 988:	e3550000 	cmp	r5, #0
 98c:	1afffff7 	bne	970 <printf+0x11c>
 990:	eaffffc5 	b	8ac <printf+0x58>
 994:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 998:	e3a02001 	mov	r2, #1
 99c:	e1a00007 	mov	r0, r7
 9a0:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9a4:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9a8:	ebfffe92 	bl	3f8 <write>
 9ac:	eaffffbe 	b	8ac <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 9b0:	e3a03001 	mov	r3, #1
 9b4:	e3a0200a 	mov	r2, #10
 9b8:	e4991004 	ldr	r1, [r9], #4
 9bc:	e1a00007 	mov	r0, r7
 9c0:	ebffff5c 	bl	738 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9c4:	e3a05000 	mov	r5, #0
 9c8:	eaffffb7 	b	8ac <printf+0x58>
 9cc:	e4993004 	ldr	r3, [r9], #4
 9d0:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9d4:	e3a02001 	mov	r2, #1
 9d8:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9dc:	e3a05000 	mov	r5, #0
 9e0:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9e4:	ebfffe83 	bl	3f8 <write>
 9e8:	eaffffaf 	b	8ac <printf+0x58>

000009ec <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9ec:	e300cbbc 	movw	ip, #3004	; 0xbbc
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9f0:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9f4:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 9f8:	e92d4810 	push	{r4, fp, lr}
 9fc:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a00:	e59c3000 	ldr	r3, [ip]
 a04:	ea000004 	b	a1c <free+0x30>
 a08:	e1510002 	cmp	r1, r2
 a0c:	3a000009 	bcc	a38 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a10:	e1530002 	cmp	r3, r2
 a14:	2a000007 	bcs	a38 <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a18:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a1c:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a20:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a24:	3afffff7 	bcc	a08 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a28:	e1530002 	cmp	r3, r2
 a2c:	3afffff9 	bcc	a18 <free+0x2c>
 a30:	e1510002 	cmp	r1, r2
 a34:	2afffff7 	bcs	a18 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a38:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a3c:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a40:	e081418e 	add	r4, r1, lr, lsl #3
 a44:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 a48:	05922004 	ldreq	r2, [r2, #4]
 a4c:	0082e00e 	addeq	lr, r2, lr
 a50:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 a54:	05932000 	ldreq	r2, [r3]
 a58:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 a5c:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 a60:	e5932004 	ldr	r2, [r3, #4]
 a64:	e083e182 	add	lr, r3, r2, lsl #3
 a68:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a6c:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a70:	05101004 	ldreq	r1, [r0, #-4]
 a74:	00812002 	addeq	r2, r1, r2
 a78:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 a7c:	05102008 	ldreq	r2, [r0, #-8]
 a80:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 a84:	e8bd8810 	pop	{r4, fp, pc}

00000a88 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a88:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 a8c:	e3008bbc 	movw	r8, #3004	; 0xbbc
 a90:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a94:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 a98:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 a9c:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa0:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 aa4:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa8:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 aac:	0a00002a 	beq	b5c <malloc+0xd4>
 ab0:	e5930000 	ldr	r0, [r3]
 ab4:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ab8:	e1540002 	cmp	r4, r2
 abc:	9a00001c 	bls	b34 <malloc+0xac>
 ac0:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ac4:	e3005bbc 	movw	r5, #3004	; 0xbbc
 ac8:	e3405000 	movt	r5, #0
 acc:	33a06902 	movcc	r6, #32768	; 0x8000
 ad0:	21a06184 	lslcs	r6, r4, #3
 ad4:	21a07004 	movcs	r7, r4
 ad8:	33a07a01 	movcc	r7, #4096	; 0x1000
 adc:	ea000003 	b	af0 <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ae0:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 ae4:	e5902004 	ldr	r2, [r0, #4]
 ae8:	e1540002 	cmp	r4, r2
 aec:	9a000010 	bls	b34 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 af0:	e5982000 	ldr	r2, [r8]
 af4:	e1a03000 	mov	r3, r0
 af8:	e1520000 	cmp	r2, r0
 afc:	1afffff7 	bne	ae0 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b00:	e1a00006 	mov	r0, r6
 b04:	ebfffee4 	bl	69c <sbrk>
 b08:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 b0c:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 b10:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 b14:	0a000004 	beq	b2c <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b18:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 b1c:	ebffffb2 	bl	9ec <free>
  return freep;
 b20:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b24:	e3530000 	cmp	r3, #0
 b28:	1affffec 	bne	ae0 <malloc+0x58>
        return 0;
 b2c:	e3a00000 	mov	r0, #0
  }
}
 b30:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b34:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 b38:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b3c:	10642002 	rsbne	r2, r4, r2
 b40:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b44:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 b48:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b4c:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 b50:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b54:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 b58:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b5c:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 b60:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b64:	e5880000 	str	r0, [r8]
 b68:	e5880004 	str	r0, [r8, #4]
 b6c:	eaffffd3 	b	ac0 <malloc+0x38>
