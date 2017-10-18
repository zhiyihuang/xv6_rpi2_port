
_wc:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
   0:	e3500001 	cmp	r0, #1
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	c1a07000 	movgt	r7, r0
   c:	e28db014 	add	fp, sp, #20
  10:	c2814004 	addgt	r4, r1, #4
  int fd, i;

  if(argc <= 1){
  14:	c3a05001 	movgt	r5, #1
  18:	da000013 	ble	6c <main+0x6c>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  1c:	e3a01000 	mov	r1, #0
  20:	e5940000 	ldr	r0, [r4]
  24:	eb000169 	bl	5d0 <open>
  28:	e2506000 	subs	r6, r0, #0
  2c:	ba000008 	blt	54 <main+0x54>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  30:	e5941000 	ldr	r1, [r4]
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  34:	e2855001 	add	r5, r5, #1
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  38:	eb000010 	bl	80 <wc>
    close(fd);
  3c:	e1a00006 	mov	r0, r6
  40:	eb00013b 	bl	534 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  44:	e1570005 	cmp	r7, r5
  48:	e2844004 	add	r4, r4, #4
  4c:	1afffff2 	bne	1c <main+0x1c>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
  50:	eb0000f6 	bl	430 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
  54:	e3001ca0 	movw	r1, #3232	; 0xca0
  58:	e5942000 	ldr	r2, [r4]
  5c:	e3401000 	movt	r1, #0
  60:	e3a00001 	mov	r0, #1
  64:	eb00023c 	bl	95c <printf>
      exit();
  68:	eb0000f0 	bl	430 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
  6c:	e3001c9c 	movw	r1, #3228	; 0xc9c
  70:	e3a00000 	mov	r0, #0
  74:	e3401000 	movt	r1, #0
  78:	eb000000 	bl	80 <wc>
    exit();
  7c:	eb0000eb 	bl	430 <exit>

00000080 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
  80:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  84:	e3a04000 	mov	r4, #0

char buf[512];

void
wc(int fd, char *name)
{
  88:	e28db020 	add	fp, sp, #32
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8c:	e3003cdc 	movw	r3, #3292	; 0xcdc
wc(int fd, char *name)
{
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  90:	e1a09004 	mov	r9, r4
  94:	e1a07004 	mov	r7, r4
  98:	e1a06004 	mov	r6, r4

char buf[512];

void
wc(int fd, char *name)
{
  9c:	e24dd01c 	sub	sp, sp, #28
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  a0:	e3403000 	movt	r3, #0

char buf[512];

void
wc(int fd, char *name)
{
  a4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
  a8:	e50b1030 	str	r1, [fp, #-48]	; 0xffffffd0
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  ac:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
  b0:	e3001cdc 	movw	r1, #3292	; 0xcdc
  b4:	e3a02c02 	mov	r2, #512	; 0x200
  b8:	e3401000 	movt	r1, #0
  bc:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
  c0:	eb000101 	bl	4cc <read>
  c4:	e2508000 	subs	r8, r0, #0
  c8:	da000019 	ble	134 <wc+0xb4>
  cc:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
  d0:	e2485001 	sub	r5, r8, #1
  d4:	e300acdb 	movw	sl, #3291	; 0xcdb
  d8:	e340a000 	movt	sl, #0
  dc:	e0855003 	add	r5, r5, r3
  e0:	ea000001 	b	ec <wc+0x6c>
    for(i=0; i<n; i++){
  e4:	e155000a 	cmp	r5, sl
  e8:	0a00000f 	beq	12c <wc+0xac>
      c++;
      if(buf[i] == '\n')
  ec:	e5fa1001 	ldrb	r1, [sl, #1]!
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  f0:	e3000c78 	movw	r0, #3192	; 0xc78
  f4:	e3400000 	movt	r0, #0
  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
  f8:	e351000a 	cmp	r1, #10
        l++;
  fc:	02866001 	addeq	r6, r6, #1
      if(strchr(" \r\t\n\v", buf[i]))
 100:	eb00005e 	bl	280 <strchr>
 104:	e3500000 	cmp	r0, #0
        inword = 0;
 108:	13a04000 	movne	r4, #0
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
 10c:	1afffff4 	bne	e4 <wc+0x64>
        inword = 0;
      else if(!inword){
 110:	e3540000 	cmp	r4, #0
        w++;
 114:	02877001 	addeq	r7, r7, #1
        inword = 1;
 118:	03a04001 	moveq	r4, #1
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
 11c:	0afffff0 	beq	e4 <wc+0x64>
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 120:	e155000a 	cmp	r5, sl
 124:	e3a04001 	mov	r4, #1
 128:	1affffef 	bne	ec <wc+0x6c>
 12c:	e0899008 	add	r9, r9, r8
 130:	eaffffde 	b	b0 <wc+0x30>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
 134:	1a00000a 	bne	164 <wc+0xe4>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
 138:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
 13c:	e3001c90 	movw	r1, #3216	; 0xc90
 140:	e58d9000 	str	r9, [sp]
 144:	e1a02006 	mov	r2, r6
 148:	e3401000 	movt	r1, #0
 14c:	e3a00001 	mov	r0, #1
 150:	e58d3004 	str	r3, [sp, #4]
 154:	e1a03007 	mov	r3, r7
 158:	eb0001ff 	bl	95c <printf>
}
 15c:	e24bd020 	sub	sp, fp, #32
 160:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
 164:	e3001c80 	movw	r1, #3200	; 0xc80
 168:	e3a00001 	mov	r0, #1
 16c:	e3401000 	movt	r1, #0
 170:	eb0001f9 	bl	95c <printf>
    exit();
 174:	eb0000ad 	bl	430 <exit>

00000178 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 178:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 17c:	e2402001 	sub	r2, r0, #1
 180:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 184:	e4d13001 	ldrb	r3, [r1], #1
 188:	e3530000 	cmp	r3, #0
 18c:	e5e23001 	strb	r3, [r2, #1]!
 190:	1afffffb 	bne	184 <strcpy+0xc>
    ;
  return os;
}
 194:	e24bd000 	sub	sp, fp, #0
 198:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 19c:	e12fff1e 	bx	lr

000001a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 1a4:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 1a8:	e5d03000 	ldrb	r3, [r0]
 1ac:	e3530000 	cmp	r3, #0
 1b0:	05d10000 	ldrbeq	r0, [r1]
 1b4:	0a00000a 	beq	1e4 <strcmp+0x44>
 1b8:	e5d12000 	ldrb	r2, [r1]
 1bc:	e1530002 	cmp	r3, r2
 1c0:	0a000003 	beq	1d4 <strcmp+0x34>
 1c4:	ea00000a 	b	1f4 <strcmp+0x54>
 1c8:	e5f12001 	ldrb	r2, [r1, #1]!
 1cc:	e1530002 	cmp	r3, r2
 1d0:	1a000007 	bne	1f4 <strcmp+0x54>
 1d4:	e5f03001 	ldrb	r3, [r0, #1]!
 1d8:	e3530000 	cmp	r3, #0
 1dc:	1afffff9 	bne	1c8 <strcmp+0x28>
 1e0:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1e4:	e0600003 	rsb	r0, r0, r3
 1e8:	e24bd000 	sub	sp, fp, #0
 1ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 1f0:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1f4:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 1f8:	e0600003 	rsb	r0, r0, r3
 1fc:	e24bd000 	sub	sp, fp, #0
 200:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 204:	e12fff1e 	bx	lr

00000208 <strlen>:

uint
strlen(char *s)
{
 208:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 20c:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 210:	e5d03000 	ldrb	r3, [r0]
 214:	e3530000 	cmp	r3, #0
 218:	0a000009 	beq	244 <strlen+0x3c>
 21c:	e1a02000 	mov	r2, r0
 220:	e3a03000 	mov	r3, #0
 224:	e5f21001 	ldrb	r1, [r2, #1]!
 228:	e2833001 	add	r3, r3, #1
 22c:	e3510000 	cmp	r1, #0
 230:	e1a00003 	mov	r0, r3
 234:	1afffffa 	bne	224 <strlen+0x1c>
    ;
  return n;
}
 238:	e24bd000 	sub	sp, fp, #0
 23c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 240:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 244:	e1a00003 	mov	r0, r3
 248:	eafffffa 	b	238 <strlen+0x30>

0000024c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 24c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 250:	e1a03000 	mov	r3, r0
 254:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 258:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 25c:	0a000004 	beq	274 <memset+0x28>
 260:	e6ef1071 	uxtb	r1, r1
 264:	e0800002 	add	r0, r0, r2
 268:	e4c31001 	strb	r1, [r3], #1
 26c:	e1500003 	cmp	r0, r3
 270:	1afffffc 	bne	268 <memset+0x1c>
  return (void *)p;
}
 274:	e24bd000 	sub	sp, fp, #0
 278:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 27c:	e12fff1e 	bx	lr

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 284:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 288:	e5d02000 	ldrb	r2, [r0]
 28c:	e3520000 	cmp	r2, #0
 290:	0a00000b 	beq	2c4 <strchr+0x44>
    if(*s == c)
 294:	e1510002 	cmp	r1, r2
 298:	1a000002 	bne	2a8 <strchr+0x28>
 29c:	ea000005 	b	2b8 <strchr+0x38>
 2a0:	e1530001 	cmp	r3, r1
 2a4:	0a000003 	beq	2b8 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2a8:	e5f03001 	ldrb	r3, [r0, #1]!
 2ac:	e3530000 	cmp	r3, #0
 2b0:	1afffffa 	bne	2a0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 2b4:	e1a00003 	mov	r0, r3
}
 2b8:	e24bd000 	sub	sp, fp, #0
 2bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2c0:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 2c4:	e1a00002 	mov	r0, r2
 2c8:	eafffffa 	b	2b8 <strchr+0x38>

000002cc <gets>:
}

char*
gets(char *buf, int max)
{
 2cc:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 2d0:	e1a08000 	mov	r8, r0
 2d4:	e28db018 	add	fp, sp, #24
 2d8:	e1a07001 	mov	r7, r1
 2dc:	e24dd00c 	sub	sp, sp, #12
 2e0:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e4:	e3a05000 	mov	r5, #0
 2e8:	ea000008 	b	310 <gets+0x44>
    cc = read(0, &c, 1);
 2ec:	eb000076 	bl	4cc <read>
    if(cc < 1)
 2f0:	e3500000 	cmp	r0, #0
 2f4:	da00000b 	ble	328 <gets+0x5c>
      break;
    buf[i++] = c;
 2f8:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 2fc:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 300:	e353000d 	cmp	r3, #13
 304:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 308:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 30c:	0a000005 	beq	328 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 310:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 314:	e0854002 	add	r4, r5, r2
 318:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 31c:	e24b101d 	sub	r1, fp, #29
 320:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 324:	bafffff0 	blt	2ec <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 328:	e3a03000 	mov	r3, #0
  return buf;
}
 32c:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 330:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 334:	e24bd018 	sub	sp, fp, #24
 338:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

0000033c <stat>:

int
stat(char *n, struct stat *st)
{
 33c:	e92d4830 	push	{r4, r5, fp, lr}
 340:	e1a04001 	mov	r4, r1
 344:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 348:	e3a01000 	mov	r1, #0
 34c:	eb00009f 	bl	5d0 <open>
  if(fd < 0)
 350:	e2505000 	subs	r5, r0, #0
 354:	ba000006 	blt	374 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 358:	e1a01004 	mov	r1, r4
 35c:	eb0000c2 	bl	66c <fstat>
 360:	e1a04000 	mov	r4, r0
  close(fd);
 364:	e1a00005 	mov	r0, r5
 368:	eb000071 	bl	534 <close>
  return r;
 36c:	e1a00004 	mov	r0, r4
 370:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 374:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 378:	e8bd8830 	pop	{r4, r5, fp, pc}

0000037c <atoi>:

int
atoi(const char *s)
{
 37c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 380:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 384:	e5d01000 	ldrb	r1, [r0]
 388:	e2413030 	sub	r3, r1, #48	; 0x30
 38c:	e3530009 	cmp	r3, #9
 390:	e3a03000 	mov	r3, #0
 394:	8a000007 	bhi	3b8 <atoi+0x3c>
    n = n*10 + *s++ - '0';
 398:	e1a02183 	lsl	r2, r3, #3
 39c:	e0823083 	add	r3, r2, r3, lsl #1
 3a0:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a4:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 3a8:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ac:	e2412030 	sub	r2, r1, #48	; 0x30
 3b0:	e3520009 	cmp	r2, #9
 3b4:	9afffff7 	bls	398 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 3b8:	e1a00003 	mov	r0, r3
 3bc:	e24bd000 	sub	sp, fp, #0
 3c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3c4:	e12fff1e 	bx	lr

000003c8 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3c8:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 3cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3d0:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3d4:	da000005 	ble	3f0 <memmove+0x28>
 3d8:	e0812002 	add	r2, r1, r2
 3dc:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 3e0:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3e4:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 3e8:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ec:	1afffffb 	bne	3e0 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3f0:	e24bd000 	sub	sp, fp, #0
 3f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3f8:	e12fff1e 	bx	lr

000003fc <fork>:
 3fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 400:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 404:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 408:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 40c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 410:	e3a00001 	mov	r0, #1
 414:	ef000040 	svc	0x00000040
 418:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 41c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 420:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 424:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 428:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 42c:	e12fff1e 	bx	lr

00000430 <exit>:
 430:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 434:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 438:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 43c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 440:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 444:	e3a00002 	mov	r0, #2
 448:	ef000040 	svc	0x00000040
 44c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 450:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 454:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 458:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 45c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 460:	e12fff1e 	bx	lr

00000464 <wait>:
 464:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 468:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 46c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 470:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 474:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 478:	e3a00003 	mov	r0, #3
 47c:	ef000040 	svc	0x00000040
 480:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 484:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 488:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 48c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 490:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 494:	e12fff1e 	bx	lr

00000498 <pipe>:
 498:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 49c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4ac:	e3a00004 	mov	r0, #4
 4b0:	ef000040 	svc	0x00000040
 4b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4c8:	e12fff1e 	bx	lr

000004cc <read>:
 4cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 4d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 4d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 4d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 4dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 4e0:	e3a00005 	mov	r0, #5
 4e4:	ef000040 	svc	0x00000040
 4e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 4f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 4f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 4f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 4fc:	e12fff1e 	bx	lr

00000500 <write>:
 500:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 504:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 508:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 50c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 510:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 514:	e3a00010 	mov	r0, #16
 518:	ef000040 	svc	0x00000040
 51c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 520:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 524:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 528:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 52c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 530:	e12fff1e 	bx	lr

00000534 <close>:
 534:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 538:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 53c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 540:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 544:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 548:	e3a00015 	mov	r0, #21
 54c:	ef000040 	svc	0x00000040
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 558:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 55c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 560:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 564:	e12fff1e 	bx	lr

00000568 <kill>:
 568:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 56c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 570:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 574:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 578:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 57c:	e3a00006 	mov	r0, #6
 580:	ef000040 	svc	0x00000040
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 58c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 590:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 594:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 598:	e12fff1e 	bx	lr

0000059c <exec>:
 59c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5b0:	e3a00007 	mov	r0, #7
 5b4:	ef000040 	svc	0x00000040
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5cc:	e12fff1e 	bx	lr

000005d0 <open>:
 5d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e4:	e3a0000f 	mov	r0, #15
 5e8:	ef000040 	svc	0x00000040
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 600:	e12fff1e 	bx	lr

00000604 <mknod>:
 604:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 608:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 60c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 610:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 614:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 618:	e3a00011 	mov	r0, #17
 61c:	ef000040 	svc	0x00000040
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 628:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 62c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 630:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 634:	e12fff1e 	bx	lr

00000638 <unlink>:
 638:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 63c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 640:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 644:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 648:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 64c:	e3a00012 	mov	r0, #18
 650:	ef000040 	svc	0x00000040
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 65c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 660:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 664:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 668:	e12fff1e 	bx	lr

0000066c <fstat>:
 66c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 670:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 674:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 678:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 67c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 680:	e3a00008 	mov	r0, #8
 684:	ef000040 	svc	0x00000040
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 690:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 694:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 698:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 69c:	e12fff1e 	bx	lr

000006a0 <link>:
 6a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b4:	e3a00013 	mov	r0, #19
 6b8:	ef000040 	svc	0x00000040
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6d0:	e12fff1e 	bx	lr

000006d4 <mkdir>:
 6d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e8:	e3a00014 	mov	r0, #20
 6ec:	ef000040 	svc	0x00000040
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 700:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 704:	e12fff1e 	bx	lr

00000708 <chdir>:
 708:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 70c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 710:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 714:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 718:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 71c:	e3a00009 	mov	r0, #9
 720:	ef000040 	svc	0x00000040
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 72c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 730:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 734:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 738:	e12fff1e 	bx	lr

0000073c <dup>:
 73c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 740:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 744:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 748:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 74c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 750:	e3a0000a 	mov	r0, #10
 754:	ef000040 	svc	0x00000040
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 760:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 764:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 768:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 76c:	e12fff1e 	bx	lr

00000770 <getpid>:
 770:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 774:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 778:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 77c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 780:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 784:	e3a0000b 	mov	r0, #11
 788:	ef000040 	svc	0x00000040
 78c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 790:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 794:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 798:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 79c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7a0:	e12fff1e 	bx	lr

000007a4 <sbrk>:
 7a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b8:	e3a0000c 	mov	r0, #12
 7bc:	ef000040 	svc	0x00000040
 7c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7d4:	e12fff1e 	bx	lr

000007d8 <sleep>:
 7d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7ec:	e3a0000d 	mov	r0, #13
 7f0:	ef000040 	svc	0x00000040
 7f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 800:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 804:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 808:	e12fff1e 	bx	lr

0000080c <uptime>:
 80c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 810:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 814:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 818:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 81c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 820:	e3a0000e 	mov	r0, #14
 824:	ef000040 	svc	0x00000040
 828:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 82c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 830:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 834:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 838:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 83c:	e12fff1e 	bx	lr

00000840 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 840:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 844:	e1a09fa1 	lsr	r9, r1, #31
 848:	e3530000 	cmp	r3, #0
 84c:	03a03000 	moveq	r3, #0
 850:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 854:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 858:	e3530000 	cmp	r3, #0
 85c:	e3008cb4 	movw	r8, #3252	; 0xcb4
    neg = 1;
    x = -xx;
 860:	1261e000 	rsbne	lr, r1, #0
 864:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 868:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 86c:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 870:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 874:	01a09003 	moveq	r9, r3
 878:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 87c:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 880:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 884:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 888:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 88c:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 890:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 894:	e1a0033e 	lsr	r0, lr, r3
 898:	e2000001 	and	r0, r0, #1
 89c:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 8a0:	e1520001 	cmp	r2, r1
            r = r - d;
 8a4:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 8a8:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 8ac:	e2533001 	subs	r3, r3, #1
 8b0:	2afffff7 	bcs	894 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8b4:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 8b8:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8bc:	e2873001 	add	r3, r7, #1
 8c0:	e7d8100e 	ldrb	r1, [r8, lr]
 8c4:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 8c8:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 8cc:	11a07003 	movne	r7, r3
 8d0:	1affffec 	bne	888 <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 8d4:	e3590000 	cmp	r9, #0
 8d8:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 8dc:	124b201c 	subne	r2, fp, #28
 8e0:	10822003 	addne	r2, r2, r3
 8e4:	12873002 	addne	r3, r7, #2
 8e8:	e0865003 	add	r5, r6, r3
 8ec:	13a0102d 	movne	r1, #45	; 0x2d
 8f0:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 8f4:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8f8:	e3a02001 	mov	r2, #1
 8fc:	e24b102d 	sub	r1, fp, #45	; 0x2d
 900:	e1a00004 	mov	r0, r4
 904:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 908:	ebfffefc 	bl	500 <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 90c:	e1560005 	cmp	r6, r5
 910:	1afffff7 	bne	8f4 <printint+0xb4>
    putc(fd, buf[i]);
}
 914:	e24bd01c 	sub	sp, fp, #28
 918:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

0000091c <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 91c:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 920:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 924:	e28db008 	add	fp, sp, #8
 928:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 92c:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 930:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 934:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 938:	e1a0c33e 	lsr	ip, lr, r3
 93c:	e20cc001 	and	ip, ip, #1
 940:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 944:	e1520001 	cmp	r2, r1
            r = r - d;
 948:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 94c:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 950:	e2533001 	subs	r3, r3, #1
 954:	2afffff7 	bcs	938 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 958:	e8bd8810 	pop	{r4, fp, pc}

0000095c <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 95c:	e92d000e 	push	{r1, r2, r3}
 960:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 964:	e28db01c 	add	fp, sp, #28
 968:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 96c:	e59b6004 	ldr	r6, [fp, #4]
 970:	e5d64000 	ldrb	r4, [r6]
 974:	e3540000 	cmp	r4, #0
 978:	0a00002d 	beq	a34 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 97c:	e3008cc8 	movw	r8, #3272	; 0xcc8
 980:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 984:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 988:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 98c:	e3a05000 	mov	r5, #0
 990:	ea00000a 	b	9c0 <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 994:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 998:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 99c:	0a000004 	beq	9b4 <printf+0x58>
 9a0:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9a4:	e3a02001 	mov	r2, #1
 9a8:	e1a00007 	mov	r0, r7
 9ac:	e5614006 	strb	r4, [r1, #-6]!
 9b0:	ebfffed2 	bl	500 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9b4:	e5f64001 	ldrb	r4, [r6, #1]!
 9b8:	e3540000 	cmp	r4, #0
 9bc:	0a00001c 	beq	a34 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 9c0:	e3550000 	cmp	r5, #0
 9c4:	0afffff2 	beq	994 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 9c8:	e3550025 	cmp	r5, #37	; 0x25
 9cc:	1afffff8 	bne	9b4 <printf+0x58>
      if(c == 'd'){
 9d0:	e3540064 	cmp	r4, #100	; 0x64
 9d4:	0a000037 	beq	ab8 <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 9d8:	e20430f7 	and	r3, r4, #247	; 0xf7
 9dc:	e3530070 	cmp	r3, #112	; 0x70
 9e0:	0a000017 	beq	a44 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9e4:	e3540073 	cmp	r4, #115	; 0x73
 9e8:	0a00001c 	beq	a60 <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9ec:	e3540063 	cmp	r4, #99	; 0x63
 9f0:	0a000037 	beq	ad4 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9f4:	e3540025 	cmp	r4, #37	; 0x25
 9f8:	0a000027 	beq	a9c <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9fc:	e3a02001 	mov	r2, #1
 a00:	e24b1021 	sub	r1, fp, #33	; 0x21
 a04:	e1a00007 	mov	r0, r7
 a08:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 a0c:	ebfffebb 	bl	500 <write>
 a10:	e24b1020 	sub	r1, fp, #32
 a14:	e3a02001 	mov	r2, #1
 a18:	e1a00007 	mov	r0, r7
 a1c:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a20:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a24:	ebfffeb5 	bl	500 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a28:	e5f64001 	ldrb	r4, [r6, #1]!
 a2c:	e3540000 	cmp	r4, #0
 a30:	1affffe2 	bne	9c0 <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 a34:	e24bd01c 	sub	sp, fp, #28
 a38:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 a3c:	e28dd00c 	add	sp, sp, #12
 a40:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 a44:	e3a03000 	mov	r3, #0
 a48:	e3a02010 	mov	r2, #16
 a4c:	e4991004 	ldr	r1, [r9], #4
 a50:	e1a00007 	mov	r0, r7
 a54:	ebffff79 	bl	840 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a58:	e3a05000 	mov	r5, #0
 a5c:	eaffffd4 	b	9b4 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 a60:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 a64:	e3540000 	cmp	r4, #0
 a68:	01a04008 	moveq	r4, r8
        while(*s != 0){
 a6c:	e5d45000 	ldrb	r5, [r4]
 a70:	e3550000 	cmp	r5, #0
 a74:	0affffce 	beq	9b4 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a78:	e3a02001 	mov	r2, #1
 a7c:	e24b1025 	sub	r1, fp, #37	; 0x25
 a80:	e1a00007 	mov	r0, r7
 a84:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 a88:	ebfffe9c 	bl	500 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 a8c:	e5f45001 	ldrb	r5, [r4, #1]!
 a90:	e3550000 	cmp	r5, #0
 a94:	1afffff7 	bne	a78 <printf+0x11c>
 a98:	eaffffc5 	b	9b4 <printf+0x58>
 a9c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 aa0:	e3a02001 	mov	r2, #1
 aa4:	e1a00007 	mov	r0, r7
 aa8:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 aac:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 ab0:	ebfffe92 	bl	500 <write>
 ab4:	eaffffbe 	b	9b4 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 ab8:	e3a03001 	mov	r3, #1
 abc:	e3a0200a 	mov	r2, #10
 ac0:	e4991004 	ldr	r1, [r9], #4
 ac4:	e1a00007 	mov	r0, r7
 ac8:	ebffff5c 	bl	840 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 acc:	e3a05000 	mov	r5, #0
 ad0:	eaffffb7 	b	9b4 <printf+0x58>
 ad4:	e4993004 	ldr	r3, [r9], #4
 ad8:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 adc:	e3a02001 	mov	r2, #1
 ae0:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 ae4:	e3a05000 	mov	r5, #0
 ae8:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 aec:	ebfffe83 	bl	500 <write>
 af0:	eaffffaf 	b	9b4 <printf+0x58>

00000af4 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 af4:	e300ccd0 	movw	ip, #3280	; 0xcd0
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 af8:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 afc:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 b00:	e92d4810 	push	{r4, fp, lr}
 b04:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b08:	e59c3000 	ldr	r3, [ip]
 b0c:	ea000004 	b	b24 <free+0x30>
 b10:	e1510002 	cmp	r1, r2
 b14:	3a000009 	bcc	b40 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b18:	e1530002 	cmp	r3, r2
 b1c:	2a000007 	bcs	b40 <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 b20:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b24:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b28:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b2c:	3afffff7 	bcc	b10 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b30:	e1530002 	cmp	r3, r2
 b34:	3afffff9 	bcc	b20 <free+0x2c>
 b38:	e1510002 	cmp	r1, r2
 b3c:	2afffff7 	bcs	b20 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b40:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 b44:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 b48:	e081418e 	add	r4, r1, lr, lsl #3
 b4c:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 b50:	05922004 	ldreq	r2, [r2, #4]
 b54:	0082e00e 	addeq	lr, r2, lr
 b58:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 b5c:	05932000 	ldreq	r2, [r3]
 b60:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 b64:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 b68:	e5932004 	ldr	r2, [r3, #4]
 b6c:	e083e182 	add	lr, r3, r2, lsl #3
 b70:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b74:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 b78:	05101004 	ldreq	r1, [r0, #-4]
 b7c:	00812002 	addeq	r2, r1, r2
 b80:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 b84:	05102008 	ldreq	r2, [r0, #-8]
 b88:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 b8c:	e8bd8810 	pop	{r4, fp, pc}

00000b90 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 b90:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 b94:	e3008cd0 	movw	r8, #3280	; 0xcd0
 b98:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b9c:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 ba0:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 ba4:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ba8:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 bac:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bb0:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 bb4:	0a00002a 	beq	c64 <malloc+0xd4>
 bb8:	e5930000 	ldr	r0, [r3]
 bbc:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bc0:	e1540002 	cmp	r4, r2
 bc4:	9a00001c 	bls	c3c <malloc+0xac>
 bc8:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bcc:	e3005cd0 	movw	r5, #3280	; 0xcd0
 bd0:	e3405000 	movt	r5, #0
 bd4:	33a06902 	movcc	r6, #32768	; 0x8000
 bd8:	21a06184 	lslcs	r6, r4, #3
 bdc:	21a07004 	movcs	r7, r4
 be0:	33a07a01 	movcc	r7, #4096	; 0x1000
 be4:	ea000003 	b	bf8 <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 be8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 bec:	e5902004 	ldr	r2, [r0, #4]
 bf0:	e1540002 	cmp	r4, r2
 bf4:	9a000010 	bls	c3c <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bf8:	e5982000 	ldr	r2, [r8]
 bfc:	e1a03000 	mov	r3, r0
 c00:	e1520000 	cmp	r2, r0
 c04:	1afffff7 	bne	be8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 c08:	e1a00006 	mov	r0, r6
 c0c:	ebfffee4 	bl	7a4 <sbrk>
 c10:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 c14:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 c18:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 c1c:	0a000004 	beq	c34 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 c20:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 c24:	ebffffb2 	bl	af4 <free>
  return freep;
 c28:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 c2c:	e3530000 	cmp	r3, #0
 c30:	1affffec 	bne	be8 <malloc+0x58>
        return 0;
 c34:	e3a00000 	mov	r0, #0
  }
}
 c38:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 c3c:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 c40:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 c44:	10642002 	rsbne	r2, r4, r2
 c48:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 c4c:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 c50:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 c54:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 c58:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 c5c:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 c60:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 c64:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 c68:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 c6c:	e5880000 	str	r0, [r8]
 c70:	e5880004 	str	r0, [r8, #4]
 c74:	eaffffd3 	b	bc8 <malloc+0x38>
