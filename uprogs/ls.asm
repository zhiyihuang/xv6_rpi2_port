
_ls:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
int
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
   0:	e3500001 	cmp	r0, #1
  close(fd);
}

int
main(int argc, char *argv[])
{
   4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
   8:	c1a06000 	movgt	r6, r0
   c:	e28db014 	add	fp, sp, #20
  10:	c1a05001 	movgt	r5, r1
  int i;

  if(argc < 2){
  14:	c3a04001 	movgt	r4, #1
  18:	da000005 	ble	34 <main+0x34>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
  1c:	e2844001 	add	r4, r4, #1
    ls(argv[i]);
  20:	e5b50004 	ldr	r0, [r5, #4]!
  24:	eb000032 	bl	f4 <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
  28:	e1560004 	cmp	r6, r4
  2c:	1afffffa 	bne	1c <main+0x1c>
    ls(argv[i]);
  exit();
  30:	eb00014b 	bl	564 <exit>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    ls(".");
  34:	e3000df8 	movw	r0, #3576	; 0xdf8
  38:	e3400000 	movt	r0, #0
  3c:	eb00002c 	bl	f4 <ls>
    exit();
  40:	eb000147 	bl	564 <exit>

00000044 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
  44:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  48:	e28db014 	add	fp, sp, #20
  4c:	e1a04000 	mov	r4, r0
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  50:	eb0000b9 	bl	33c <strlen>
  54:	e0942000 	adds	r2, r4, r0
  58:	2a00000c 	bcs	90 <fmtname+0x4c>
  5c:	e7d43000 	ldrb	r3, [r4, r0]
  60:	e353002f 	cmp	r3, #47	; 0x2f
  64:	0a000009 	beq	90 <fmtname+0x4c>
  68:	e2423001 	sub	r3, r2, #1
  6c:	e2440001 	sub	r0, r4, #1
  70:	ea000002 	b	80 <fmtname+0x3c>
  74:	e5d21000 	ldrb	r1, [r2]
  78:	e351002f 	cmp	r1, #47	; 0x2f
  7c:	0a000003 	beq	90 <fmtname+0x4c>
  80:	e1530000 	cmp	r3, r0
  84:	e1a02003 	mov	r2, r3
  88:	e2433001 	sub	r3, r3, #1
  8c:	1afffff8 	bne	74 <fmtname+0x30>
    ;
  p++;
  90:	e2824001 	add	r4, r2, #1
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  94:	e1a00004 	mov	r0, r4
  98:	eb0000a7 	bl	33c <strlen>
  9c:	e350000d 	cmp	r0, #13
    return p;
  a0:	e1a00004 	mov	r0, r4
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  a4:	9a000000 	bls	ac <fmtname+0x68>
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}
  a8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  p++;
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  ac:	eb0000a2 	bl	33c <strlen>
  b0:	e3005e18 	movw	r5, #3608	; 0xe18
  b4:	e3405000 	movt	r5, #0
  b8:	e1a01004 	mov	r1, r4
  bc:	e1a02000 	mov	r2, r0
  c0:	e1a00005 	mov	r0, r5
  c4:	eb00010c 	bl	4fc <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  c8:	e1a00004 	mov	r0, r4
  cc:	eb00009a 	bl	33c <strlen>
  d0:	e1a06000 	mov	r6, r0
  d4:	e1a00004 	mov	r0, r4
  d8:	eb000097 	bl	33c <strlen>
  dc:	e3a01020 	mov	r1, #32
  e0:	e260200e 	rsb	r2, r0, #14
  e4:	e0850006 	add	r0, r5, r6
  e8:	eb0000a4 	bl	380 <memset>
  return buf;
  ec:	e1a00005 	mov	r0, r5
  f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000000f4 <ls>:
}

void
ls(char *path)
{
  f4:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  f8:	e3a01000 	mov	r1, #0
  return buf;
}

void
ls(char *path)
{
  fc:	e28db018 	add	fp, sp, #24
 100:	e24ddf8d 	sub	sp, sp, #564	; 0x234
 104:	e1a05000 	mov	r5, r0
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
 108:	eb00017d 	bl	704 <open>
 10c:	e2504000 	subs	r4, r0, #0
 110:	ba00004b 	blt	244 <ls+0x150>
    printf(2, "ls: cannot open %s\n", path);
    return;
  }
  
  if(fstat(fd, &st) < 0){
 114:	e24b1e23 	sub	r1, fp, #560	; 0x230
 118:	eb0001a0 	bl	7a0 <fstat>
 11c:	e3500000 	cmp	r0, #0
 120:	ba000053 	blt	274 <ls+0x180>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }
  
  switch(st.type){
 124:	e24b3e23 	sub	r3, fp, #560	; 0x230
 128:	e1d360f0 	ldrsh	r6, [r3]
 12c:	e3560001 	cmp	r6, #1
 130:	0a000011 	beq	17c <ls+0x88>
 134:	e3560002 	cmp	r6, #2
 138:	1a00000b 	bne	16c <ls+0x78>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 13c:	e1a00005 	mov	r0, r5
 140:	ebffffbf 	bl	44 <fmtname>
 144:	e51b2228 	ldr	r2, [fp, #-552]	; 0xfffffdd8
 148:	e51bc220 	ldr	ip, [fp, #-544]	; 0xfffffde0
 14c:	e24b3e23 	sub	r3, fp, #560	; 0x230
 150:	e3001dd4 	movw	r1, #3540	; 0xdd4
 154:	e1d330f0 	ldrsh	r3, [r3]
 158:	e3401000 	movt	r1, #0
 15c:	e88d1004 	stm	sp, {r2, ip}
 160:	e1a02000 	mov	r2, r0
 164:	e3a00001 	mov	r0, #1
 168:	eb000248 	bl	a90 <printf>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 16c:	e1a00004 	mov	r0, r4
 170:	eb00013c 	bl	668 <close>
}
 174:	e24bd018 	sub	sp, fp, #24
 178:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 17c:	e1a00005 	mov	r0, r5
 180:	eb00006d 	bl	33c <strlen>
 184:	e2800010 	add	r0, r0, #16
 188:	e3500c02 	cmp	r0, #512	; 0x200
 18c:	8a000033 	bhi	260 <ls+0x16c>
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
 190:	e24b6f87 	sub	r6, fp, #540	; 0x21c
 194:	e1a01005 	mov	r1, r5
 198:	e24b5d09 	sub	r5, fp, #576	; 0x240
 19c:	e1a00006 	mov	r0, r6
 1a0:	eb000041 	bl	2ac <strcpy>
    p = buf+strlen(buf);
 1a4:	e1a00006 	mov	r0, r6
 1a8:	eb000063 	bl	33c <strlen>
    *p++ = '/';
 1ac:	e3a0302f 	mov	r3, #47	; 0x2f
 1b0:	e2808001 	add	r8, r0, #1
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
 1b4:	e0867000 	add	r7, r6, r0
    *p++ = '/';
 1b8:	e0868008 	add	r8, r6, r8
 1bc:	e7c63000 	strb	r3, [r6, r0]
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1c0:	e3a02010 	mov	r2, #16
 1c4:	e1a01005 	mov	r1, r5
 1c8:	e1a00004 	mov	r0, r4
 1cc:	eb00010b 	bl	600 <read>
 1d0:	e3500010 	cmp	r0, #16
 1d4:	1affffe4 	bne	16c <ls+0x78>
      if(de.inum == 0)
 1d8:	e1d530b0 	ldrh	r3, [r5]
 1dc:	e3530000 	cmp	r3, #0
 1e0:	0afffff6 	beq	1c0 <ls+0xcc>
        continue;
      memmove(p, de.name, DIRSIZ);
 1e4:	e3a0200e 	mov	r2, #14
 1e8:	e2851002 	add	r1, r5, #2
 1ec:	e1a00008 	mov	r0, r8
 1f0:	eb0000c1 	bl	4fc <memmove>
      p[DIRSIZ] = 0;
 1f4:	e3a03000 	mov	r3, #0
      if(stat(buf, &st) < 0){
 1f8:	e24b1e23 	sub	r1, fp, #560	; 0x230
 1fc:	e1a00006 	mov	r0, r6
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
 200:	e5c7300f 	strb	r3, [r7, #15]
      if(stat(buf, &st) < 0){
 204:	eb000099 	bl	470 <stat>
 208:	e3500000 	cmp	r0, #0
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 20c:	e1a00006 	mov	r0, r6
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
 210:	ba00001f 	blt	294 <ls+0x1a0>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 214:	ebffff8a 	bl	44 <fmtname>
 218:	e51b2228 	ldr	r2, [fp, #-552]	; 0xfffffdd8
 21c:	e51bc220 	ldr	ip, [fp, #-544]	; 0xfffffde0
 220:	e24b3e23 	sub	r3, fp, #560	; 0x230
 224:	e3001dd4 	movw	r1, #3540	; 0xdd4
 228:	e1d330f0 	ldrsh	r3, [r3]
 22c:	e3401000 	movt	r1, #0
 230:	e88d1004 	stm	sp, {r2, ip}
 234:	e1a02000 	mov	r2, r0
 238:	e3a00001 	mov	r0, #1
 23c:	eb000213 	bl	a90 <printf>
 240:	eaffffde 	b	1c0 <ls+0xcc>
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
    printf(2, "ls: cannot open %s\n", path);
 244:	e3001dac 	movw	r1, #3500	; 0xdac
 248:	e1a02005 	mov	r2, r5
 24c:	e3401000 	movt	r1, #0
 250:	e3a00002 	mov	r0, #2
 254:	eb00020d 	bl	a90 <printf>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
}
 258:	e24bd018 	sub	sp, fp, #24
 25c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
 260:	e3001de4 	movw	r1, #3556	; 0xde4
 264:	e1a00006 	mov	r0, r6
 268:	e3401000 	movt	r1, #0
 26c:	eb000207 	bl	a90 <printf>
      break;
 270:	eaffffbd 	b	16c <ls+0x78>
    printf(2, "ls: cannot open %s\n", path);
    return;
  }
  
  if(fstat(fd, &st) < 0){
    printf(2, "ls: cannot stat %s\n", path);
 274:	e3001dc0 	movw	r1, #3520	; 0xdc0
 278:	e1a02005 	mov	r2, r5
 27c:	e3401000 	movt	r1, #0
 280:	e3a00002 	mov	r0, #2
 284:	eb000201 	bl	a90 <printf>
    close(fd);
 288:	e1a00004 	mov	r0, r4
 28c:	eb0000f5 	bl	668 <close>
    return;
 290:	eaffffb7 	b	174 <ls+0x80>
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
 294:	e3001dc0 	movw	r1, #3520	; 0xdc0
 298:	e1a02006 	mov	r2, r6
 29c:	e3401000 	movt	r1, #0
 2a0:	e3a00001 	mov	r0, #1
 2a4:	eb0001f9 	bl	a90 <printf>
        continue;
 2a8:	eaffffc4 	b	1c0 <ls+0xcc>

000002ac <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 2ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2b0:	e2402001 	sub	r2, r0, #1
 2b4:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b8:	e4d13001 	ldrb	r3, [r1], #1
 2bc:	e3530000 	cmp	r3, #0
 2c0:	e5e23001 	strb	r3, [r2, #1]!
 2c4:	1afffffb 	bne	2b8 <strcpy+0xc>
    ;
  return os;
}
 2c8:	e24bd000 	sub	sp, fp, #0
 2cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 2d0:	e12fff1e 	bx	lr

000002d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 2d8:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 2dc:	e5d03000 	ldrb	r3, [r0]
 2e0:	e3530000 	cmp	r3, #0
 2e4:	05d10000 	ldrbeq	r0, [r1]
 2e8:	0a00000a 	beq	318 <strcmp+0x44>
 2ec:	e5d12000 	ldrb	r2, [r1]
 2f0:	e1530002 	cmp	r3, r2
 2f4:	0a000003 	beq	308 <strcmp+0x34>
 2f8:	ea00000a 	b	328 <strcmp+0x54>
 2fc:	e5f12001 	ldrb	r2, [r1, #1]!
 300:	e1530002 	cmp	r3, r2
 304:	1a000007 	bne	328 <strcmp+0x54>
 308:	e5f03001 	ldrb	r3, [r0, #1]!
 30c:	e3530000 	cmp	r3, #0
 310:	1afffff9 	bne	2fc <strcmp+0x28>
 314:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 318:	e0600003 	rsb	r0, r0, r3
 31c:	e24bd000 	sub	sp, fp, #0
 320:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 324:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 328:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 32c:	e0600003 	rsb	r0, r0, r3
 330:	e24bd000 	sub	sp, fp, #0
 334:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 338:	e12fff1e 	bx	lr

0000033c <strlen>:

uint
strlen(char *s)
{
 33c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 340:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 344:	e5d03000 	ldrb	r3, [r0]
 348:	e3530000 	cmp	r3, #0
 34c:	0a000009 	beq	378 <strlen+0x3c>
 350:	e1a02000 	mov	r2, r0
 354:	e3a03000 	mov	r3, #0
 358:	e5f21001 	ldrb	r1, [r2, #1]!
 35c:	e2833001 	add	r3, r3, #1
 360:	e3510000 	cmp	r1, #0
 364:	e1a00003 	mov	r0, r3
 368:	1afffffa 	bne	358 <strlen+0x1c>
    ;
  return n;
}
 36c:	e24bd000 	sub	sp, fp, #0
 370:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 374:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 378:	e1a00003 	mov	r0, r3
 37c:	eafffffa 	b	36c <strlen+0x30>

00000380 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 380:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 384:	e1a03000 	mov	r3, r0
 388:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 38c:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 390:	0a000004 	beq	3a8 <memset+0x28>
 394:	e6ef1071 	uxtb	r1, r1
 398:	e0800002 	add	r0, r0, r2
 39c:	e4c31001 	strb	r1, [r3], #1
 3a0:	e1500003 	cmp	r0, r3
 3a4:	1afffffc 	bne	39c <memset+0x1c>
  return (void *)p;
}
 3a8:	e24bd000 	sub	sp, fp, #0
 3ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3b0:	e12fff1e 	bx	lr

000003b4 <strchr>:

char*
strchr(const char *s, char c)
{
 3b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3b8:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 3bc:	e5d02000 	ldrb	r2, [r0]
 3c0:	e3520000 	cmp	r2, #0
 3c4:	0a00000b 	beq	3f8 <strchr+0x44>
    if(*s == c)
 3c8:	e1510002 	cmp	r1, r2
 3cc:	1a000002 	bne	3dc <strchr+0x28>
 3d0:	ea000005 	b	3ec <strchr+0x38>
 3d4:	e1530001 	cmp	r3, r1
 3d8:	0a000003 	beq	3ec <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3dc:	e5f03001 	ldrb	r3, [r0, #1]!
 3e0:	e3530000 	cmp	r3, #0
 3e4:	1afffffa 	bne	3d4 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 3e8:	e1a00003 	mov	r0, r3
}
 3ec:	e24bd000 	sub	sp, fp, #0
 3f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3f4:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 3f8:	e1a00002 	mov	r0, r2
 3fc:	eafffffa 	b	3ec <strchr+0x38>

00000400 <gets>:
}

char*
gets(char *buf, int max)
{
 400:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 404:	e1a08000 	mov	r8, r0
 408:	e28db018 	add	fp, sp, #24
 40c:	e1a07001 	mov	r7, r1
 410:	e24dd00c 	sub	sp, sp, #12
 414:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 418:	e3a05000 	mov	r5, #0
 41c:	ea000008 	b	444 <gets+0x44>
    cc = read(0, &c, 1);
 420:	eb000076 	bl	600 <read>
    if(cc < 1)
 424:	e3500000 	cmp	r0, #0
 428:	da00000b 	ble	45c <gets+0x5c>
      break;
    buf[i++] = c;
 42c:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 430:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 434:	e353000d 	cmp	r3, #13
 438:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 43c:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 440:	0a000005 	beq	45c <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 444:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 448:	e0854002 	add	r4, r5, r2
 44c:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 450:	e24b101d 	sub	r1, fp, #29
 454:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 458:	bafffff0 	blt	420 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 45c:	e3a03000 	mov	r3, #0
  return buf;
}
 460:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 464:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 468:	e24bd018 	sub	sp, fp, #24
 46c:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000470 <stat>:

int
stat(char *n, struct stat *st)
{
 470:	e92d4830 	push	{r4, r5, fp, lr}
 474:	e1a04001 	mov	r4, r1
 478:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 47c:	e3a01000 	mov	r1, #0
 480:	eb00009f 	bl	704 <open>
  if(fd < 0)
 484:	e2505000 	subs	r5, r0, #0
 488:	ba000006 	blt	4a8 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 48c:	e1a01004 	mov	r1, r4
 490:	eb0000c2 	bl	7a0 <fstat>
 494:	e1a04000 	mov	r4, r0
  close(fd);
 498:	e1a00005 	mov	r0, r5
 49c:	eb000071 	bl	668 <close>
  return r;
 4a0:	e1a00004 	mov	r0, r4
 4a4:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 4a8:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 4ac:	e8bd8830 	pop	{r4, r5, fp, pc}

000004b0 <atoi>:

int
atoi(const char *s)
{
 4b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 4b4:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4b8:	e5d01000 	ldrb	r1, [r0]
 4bc:	e2413030 	sub	r3, r1, #48	; 0x30
 4c0:	e3530009 	cmp	r3, #9
 4c4:	e3a03000 	mov	r3, #0
 4c8:	8a000007 	bhi	4ec <atoi+0x3c>
    n = n*10 + *s++ - '0';
 4cc:	e1a02183 	lsl	r2, r3, #3
 4d0:	e0823083 	add	r3, r2, r3, lsl #1
 4d4:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4d8:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 4dc:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4e0:	e2412030 	sub	r2, r1, #48	; 0x30
 4e4:	e3520009 	cmp	r2, #9
 4e8:	9afffff7 	bls	4cc <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 4ec:	e1a00003 	mov	r0, r3
 4f0:	e24bd000 	sub	sp, fp, #0
 4f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 4f8:	e12fff1e 	bx	lr

000004fc <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4fc:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 500:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 504:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 508:	da000005 	ble	524 <memmove+0x28>
 50c:	e0812002 	add	r2, r1, r2
 510:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 514:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 518:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 51c:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 520:	1afffffb 	bne	514 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 524:	e24bd000 	sub	sp, fp, #0
 528:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 52c:	e12fff1e 	bx	lr

00000530 <fork>:
 530:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 534:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 538:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 53c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 540:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 544:	e3a00001 	mov	r0, #1
 548:	ef000040 	svc	0x00000040
 54c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 550:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 554:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 558:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 55c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 560:	e12fff1e 	bx	lr

00000564 <exit>:
 564:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 568:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 56c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 570:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 574:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 578:	e3a00002 	mov	r0, #2
 57c:	ef000040 	svc	0x00000040
 580:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 584:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 588:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 58c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 590:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 594:	e12fff1e 	bx	lr

00000598 <wait>:
 598:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 59c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5ac:	e3a00003 	mov	r0, #3
 5b0:	ef000040 	svc	0x00000040
 5b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5c8:	e12fff1e 	bx	lr

000005cc <pipe>:
 5cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5e0:	e3a00004 	mov	r0, #4
 5e4:	ef000040 	svc	0x00000040
 5e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5fc:	e12fff1e 	bx	lr

00000600 <read>:
 600:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 604:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 608:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 60c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 610:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 614:	e3a00005 	mov	r0, #5
 618:	ef000040 	svc	0x00000040
 61c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 620:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 624:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 628:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 62c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 630:	e12fff1e 	bx	lr

00000634 <write>:
 634:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 638:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 63c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 640:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 644:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 648:	e3a00010 	mov	r0, #16
 64c:	ef000040 	svc	0x00000040
 650:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 654:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 658:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 65c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 660:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 664:	e12fff1e 	bx	lr

00000668 <close>:
 668:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 66c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 670:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 674:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 678:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 67c:	e3a00015 	mov	r0, #21
 680:	ef000040 	svc	0x00000040
 684:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 688:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 68c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 690:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 694:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 698:	e12fff1e 	bx	lr

0000069c <kill>:
 69c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6b0:	e3a00006 	mov	r0, #6
 6b4:	ef000040 	svc	0x00000040
 6b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6cc:	e12fff1e 	bx	lr

000006d0 <exec>:
 6d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6e4:	e3a00007 	mov	r0, #7
 6e8:	ef000040 	svc	0x00000040
 6ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 700:	e12fff1e 	bx	lr

00000704 <open>:
 704:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 708:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 70c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 710:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 714:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 718:	e3a0000f 	mov	r0, #15
 71c:	ef000040 	svc	0x00000040
 720:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 724:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 728:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 72c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 730:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 734:	e12fff1e 	bx	lr

00000738 <mknod>:
 738:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 73c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 740:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 744:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 748:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 74c:	e3a00011 	mov	r0, #17
 750:	ef000040 	svc	0x00000040
 754:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 758:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 75c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 760:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 764:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 768:	e12fff1e 	bx	lr

0000076c <unlink>:
 76c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 770:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 774:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 778:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 77c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 780:	e3a00012 	mov	r0, #18
 784:	ef000040 	svc	0x00000040
 788:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 78c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 790:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 794:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 798:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 79c:	e12fff1e 	bx	lr

000007a0 <fstat>:
 7a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7b4:	e3a00008 	mov	r0, #8
 7b8:	ef000040 	svc	0x00000040
 7bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7d0:	e12fff1e 	bx	lr

000007d4 <link>:
 7d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7e8:	e3a00013 	mov	r0, #19
 7ec:	ef000040 	svc	0x00000040
 7f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 800:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 804:	e12fff1e 	bx	lr

00000808 <mkdir>:
 808:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 80c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 810:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 814:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 818:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 81c:	e3a00014 	mov	r0, #20
 820:	ef000040 	svc	0x00000040
 824:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 828:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 82c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 830:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 834:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 838:	e12fff1e 	bx	lr

0000083c <chdir>:
 83c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 840:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 844:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 848:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 84c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 850:	e3a00009 	mov	r0, #9
 854:	ef000040 	svc	0x00000040
 858:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 85c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 860:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 864:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 868:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 86c:	e12fff1e 	bx	lr

00000870 <dup>:
 870:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 874:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 878:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 87c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 880:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 884:	e3a0000a 	mov	r0, #10
 888:	ef000040 	svc	0x00000040
 88c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 890:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 894:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 898:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 89c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8a0:	e12fff1e 	bx	lr

000008a4 <getpid>:
 8a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8b8:	e3a0000b 	mov	r0, #11
 8bc:	ef000040 	svc	0x00000040
 8c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8d4:	e12fff1e 	bx	lr

000008d8 <sbrk>:
 8d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8ec:	e3a0000c 	mov	r0, #12
 8f0:	ef000040 	svc	0x00000040
 8f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 900:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 904:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 908:	e12fff1e 	bx	lr

0000090c <sleep>:
 90c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 910:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 914:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 918:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 91c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 920:	e3a0000d 	mov	r0, #13
 924:	ef000040 	svc	0x00000040
 928:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 92c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 930:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 934:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 938:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 93c:	e12fff1e 	bx	lr

00000940 <uptime>:
 940:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 944:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 948:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 94c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 950:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 954:	e3a0000e 	mov	r0, #14
 958:	ef000040 	svc	0x00000040
 95c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 960:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 964:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 968:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 96c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 970:	e12fff1e 	bx	lr

00000974 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 974:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 978:	e1a09fa1 	lsr	r9, r1, #31
 97c:	e3530000 	cmp	r3, #0
 980:	03a03000 	moveq	r3, #0
 984:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 988:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 98c:	e3530000 	cmp	r3, #0
 990:	e3008dfc 	movw	r8, #3580	; 0xdfc
    neg = 1;
    x = -xx;
 994:	1261e000 	rsbne	lr, r1, #0
 998:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 99c:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 9a0:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 9a4:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 9a8:	01a09003 	moveq	r9, r3
 9ac:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 9b0:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 9b4:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 9b8:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 9bc:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 9c0:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 9c4:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 9c8:	e1a0033e 	lsr	r0, lr, r3
 9cc:	e2000001 	and	r0, r0, #1
 9d0:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 9d4:	e1520001 	cmp	r2, r1
            r = r - d;
 9d8:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 9dc:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 9e0:	e2533001 	subs	r3, r3, #1
 9e4:	2afffff7 	bcs	9c8 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 9e8:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 9ec:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 9f0:	e2873001 	add	r3, r7, #1
 9f4:	e7d8100e 	ldrb	r1, [r8, lr]
 9f8:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 9fc:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a00:	11a07003 	movne	r7, r3
 a04:	1affffec 	bne	9bc <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 a08:	e3590000 	cmp	r9, #0
 a0c:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 a10:	124b201c 	subne	r2, fp, #28
 a14:	10822003 	addne	r2, r2, r3
 a18:	12873002 	addne	r3, r7, #2
 a1c:	e0865003 	add	r5, r6, r3
 a20:	13a0102d 	movne	r1, #45	; 0x2d
 a24:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 a28:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a2c:	e3a02001 	mov	r2, #1
 a30:	e24b102d 	sub	r1, fp, #45	; 0x2d
 a34:	e1a00004 	mov	r0, r4
 a38:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 a3c:	ebfffefc 	bl	634 <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 a40:	e1560005 	cmp	r6, r5
 a44:	1afffff7 	bne	a28 <printint+0xb4>
    putc(fd, buf[i]);
}
 a48:	e24bd01c 	sub	sp, fp, #28
 a4c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000a50 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 a50:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 a54:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 a58:	e28db008 	add	fp, sp, #8
 a5c:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 a60:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 a64:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 a68:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 a6c:	e1a0c33e 	lsr	ip, lr, r3
 a70:	e20cc001 	and	ip, ip, #1
 a74:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 a78:	e1520001 	cmp	r2, r1
            r = r - d;
 a7c:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 a80:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 a84:	e2533001 	subs	r3, r3, #1
 a88:	2afffff7 	bcs	a6c <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 a8c:	e8bd8810 	pop	{r4, fp, pc}

00000a90 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 a90:	e92d000e 	push	{r1, r2, r3}
 a94:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 a98:	e28db01c 	add	fp, sp, #28
 a9c:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 aa0:	e59b6004 	ldr	r6, [fp, #4]
 aa4:	e5d64000 	ldrb	r4, [r6]
 aa8:	e3540000 	cmp	r4, #0
 aac:	0a00002d 	beq	b68 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 ab0:	e3008e10 	movw	r8, #3600	; 0xe10
 ab4:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 ab8:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 abc:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 ac0:	e3a05000 	mov	r5, #0
 ac4:	ea00000a 	b	af4 <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 ac8:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 acc:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 ad0:	0a000004 	beq	ae8 <printf+0x58>
 ad4:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 ad8:	e3a02001 	mov	r2, #1
 adc:	e1a00007 	mov	r0, r7
 ae0:	e5614006 	strb	r4, [r1, #-6]!
 ae4:	ebfffed2 	bl	634 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 ae8:	e5f64001 	ldrb	r4, [r6, #1]!
 aec:	e3540000 	cmp	r4, #0
 af0:	0a00001c 	beq	b68 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 af4:	e3550000 	cmp	r5, #0
 af8:	0afffff2 	beq	ac8 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 afc:	e3550025 	cmp	r5, #37	; 0x25
 b00:	1afffff8 	bne	ae8 <printf+0x58>
      if(c == 'd'){
 b04:	e3540064 	cmp	r4, #100	; 0x64
 b08:	0a000037 	beq	bec <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 b0c:	e20430f7 	and	r3, r4, #247	; 0xf7
 b10:	e3530070 	cmp	r3, #112	; 0x70
 b14:	0a000017 	beq	b78 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 b18:	e3540073 	cmp	r4, #115	; 0x73
 b1c:	0a00001c 	beq	b94 <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 b20:	e3540063 	cmp	r4, #99	; 0x63
 b24:	0a000037 	beq	c08 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 b28:	e3540025 	cmp	r4, #37	; 0x25
 b2c:	0a000027 	beq	bd0 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 b30:	e3a02001 	mov	r2, #1
 b34:	e24b1021 	sub	r1, fp, #33	; 0x21
 b38:	e1a00007 	mov	r0, r7
 b3c:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 b40:	ebfffebb 	bl	634 <write>
 b44:	e24b1020 	sub	r1, fp, #32
 b48:	e3a02001 	mov	r2, #1
 b4c:	e1a00007 	mov	r0, r7
 b50:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 b54:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 b58:	ebfffeb5 	bl	634 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b5c:	e5f64001 	ldrb	r4, [r6, #1]!
 b60:	e3540000 	cmp	r4, #0
 b64:	1affffe2 	bne	af4 <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 b68:	e24bd01c 	sub	sp, fp, #28
 b6c:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 b70:	e28dd00c 	add	sp, sp, #12
 b74:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 b78:	e3a03000 	mov	r3, #0
 b7c:	e3a02010 	mov	r2, #16
 b80:	e4991004 	ldr	r1, [r9], #4
 b84:	e1a00007 	mov	r0, r7
 b88:	ebffff79 	bl	974 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 b8c:	e3a05000 	mov	r5, #0
 b90:	eaffffd4 	b	ae8 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 b94:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 b98:	e3540000 	cmp	r4, #0
 b9c:	01a04008 	moveq	r4, r8
        while(*s != 0){
 ba0:	e5d45000 	ldrb	r5, [r4]
 ba4:	e3550000 	cmp	r5, #0
 ba8:	0affffce 	beq	ae8 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 bac:	e3a02001 	mov	r2, #1
 bb0:	e24b1025 	sub	r1, fp, #37	; 0x25
 bb4:	e1a00007 	mov	r0, r7
 bb8:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 bbc:	ebfffe9c 	bl	634 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 bc0:	e5f45001 	ldrb	r5, [r4, #1]!
 bc4:	e3550000 	cmp	r5, #0
 bc8:	1afffff7 	bne	bac <printf+0x11c>
 bcc:	eaffffc5 	b	ae8 <printf+0x58>
 bd0:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 bd4:	e3a02001 	mov	r2, #1
 bd8:	e1a00007 	mov	r0, r7
 bdc:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 be0:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 be4:	ebfffe92 	bl	634 <write>
 be8:	eaffffbe 	b	ae8 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 bec:	e3a03001 	mov	r3, #1
 bf0:	e3a0200a 	mov	r2, #10
 bf4:	e4991004 	ldr	r1, [r9], #4
 bf8:	e1a00007 	mov	r0, r7
 bfc:	ebffff5c 	bl	974 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 c00:	e3a05000 	mov	r5, #0
 c04:	eaffffb7 	b	ae8 <printf+0x58>
 c08:	e4993004 	ldr	r3, [r9], #4
 c0c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 c10:	e3a02001 	mov	r2, #1
 c14:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 c18:	e3a05000 	mov	r5, #0
 c1c:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 c20:	ebfffe83 	bl	634 <write>
 c24:	eaffffaf 	b	ae8 <printf+0x58>

00000c28 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c28:	e300ce28 	movw	ip, #3624	; 0xe28
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 c2c:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c30:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 c34:	e92d4810 	push	{r4, fp, lr}
 c38:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c3c:	e59c3000 	ldr	r3, [ip]
 c40:	ea000004 	b	c58 <free+0x30>
 c44:	e1510002 	cmp	r1, r2
 c48:	3a000009 	bcc	c74 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c4c:	e1530002 	cmp	r3, r2
 c50:	2a000007 	bcs	c74 <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 c54:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c58:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c5c:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 c60:	3afffff7 	bcc	c44 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 c64:	e1530002 	cmp	r3, r2
 c68:	3afffff9 	bcc	c54 <free+0x2c>
 c6c:	e1510002 	cmp	r1, r2
 c70:	2afffff7 	bcs	c54 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 c74:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 c78:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 c7c:	e081418e 	add	r4, r1, lr, lsl #3
 c80:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 c84:	05922004 	ldreq	r2, [r2, #4]
 c88:	0082e00e 	addeq	lr, r2, lr
 c8c:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 c90:	05932000 	ldreq	r2, [r3]
 c94:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 c98:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 c9c:	e5932004 	ldr	r2, [r3, #4]
 ca0:	e083e182 	add	lr, r3, r2, lsl #3
 ca4:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 ca8:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 cac:	05101004 	ldreq	r1, [r0, #-4]
 cb0:	00812002 	addeq	r2, r1, r2
 cb4:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 cb8:	05102008 	ldreq	r2, [r0, #-8]
 cbc:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 cc0:	e8bd8810 	pop	{r4, fp, pc}

00000cc4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 cc4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 cc8:	e3008e28 	movw	r8, #3624	; 0xe28
 ccc:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 cd0:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 cd4:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 cd8:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 cdc:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 ce0:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ce4:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 ce8:	0a00002a 	beq	d98 <malloc+0xd4>
 cec:	e5930000 	ldr	r0, [r3]
 cf0:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 cf4:	e1540002 	cmp	r4, r2
 cf8:	9a00001c 	bls	d70 <malloc+0xac>
 cfc:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d00:	e3005e28 	movw	r5, #3624	; 0xe28
 d04:	e3405000 	movt	r5, #0
 d08:	33a06902 	movcc	r6, #32768	; 0x8000
 d0c:	21a06184 	lslcs	r6, r4, #3
 d10:	21a07004 	movcs	r7, r4
 d14:	33a07a01 	movcc	r7, #4096	; 0x1000
 d18:	ea000003 	b	d2c <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 d1c:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 d20:	e5902004 	ldr	r2, [r0, #4]
 d24:	e1540002 	cmp	r4, r2
 d28:	9a000010 	bls	d70 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d2c:	e5982000 	ldr	r2, [r8]
 d30:	e1a03000 	mov	r3, r0
 d34:	e1520000 	cmp	r2, r0
 d38:	1afffff7 	bne	d1c <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 d3c:	e1a00006 	mov	r0, r6
 d40:	ebfffee4 	bl	8d8 <sbrk>
 d44:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 d48:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 d4c:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 d50:	0a000004 	beq	d68 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 d54:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 d58:	ebffffb2 	bl	c28 <free>
  return freep;
 d5c:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 d60:	e3530000 	cmp	r3, #0
 d64:	1affffec 	bne	d1c <malloc+0x58>
        return 0;
 d68:	e3a00000 	mov	r0, #0
  }
}
 d6c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 d70:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 d74:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 d78:	10642002 	rsbne	r2, r4, r2
 d7c:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 d80:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 d84:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 d88:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 d8c:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 d90:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 d94:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 d98:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 d9c:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 da0:	e5880000 	str	r0, [r8]
 da4:	e5880004 	str	r0, [r8, #4]
 da8:	eaffffd3 	b	cfc <malloc+0x38>
