
_grep:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
main(int argc, char *argv[])
{
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
   0:	e3500001 	cmp	r0, #1
  }
}

int
main(int argc, char *argv[])
{
   4:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
   8:	e28db01c 	add	fp, sp, #28
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
   c:	da00001f 	ble	90 <main+0x90>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  
  if(argc <= 2){
  10:	e3500002 	cmp	r0, #2
  14:	e1a08000 	mov	r8, r0
  
  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  18:	e5919004 	ldr	r9, [r1, #4]
  1c:	12814008 	addne	r4, r1, #8
  
  if(argc <= 2){
  20:	13a05002 	movne	r5, #2
  24:	0a000015 	beq	80 <main+0x80>
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  28:	e5940000 	ldr	r0, [r4]
  2c:	e3a01000 	mov	r1, #0
  30:	eb0001d7 	bl	794 <open>
  34:	e1a07004 	mov	r7, r4
  38:	e2844004 	add	r4, r4, #4
  3c:	e2506000 	subs	r6, r0, #0
  40:	ba000008 	blt	68 <main+0x68>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  44:	e1a01006 	mov	r1, r6
  48:	e1a00009 	mov	r0, r9
  4c:	eb000083 	bl	260 <grep>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  50:	e2855001 	add	r5, r5, #1
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
    close(fd);
  54:	e1a00006 	mov	r0, r6
  58:	eb0001a6 	bl	6f8 <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  5c:	e1580005 	cmp	r8, r5
  60:	cafffff0 	bgt	28 <main+0x28>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
  64:	eb000162 	bl	5f4 <exit>
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
  68:	e3001e5c 	movw	r1, #3676	; 0xe5c
  6c:	e5972000 	ldr	r2, [r7]
  70:	e3401000 	movt	r1, #0
  74:	e3a00001 	mov	r0, #1
  78:	eb0002a8 	bl	b20 <printf>
      exit();
  7c:	eb00015c 	bl	5f4 <exit>
    exit();
  }
  pattern = argv[1];
  
  if(argc <= 2){
    grep(pattern, 0);
  80:	e1a00009 	mov	r0, r9
  84:	e3a01000 	mov	r1, #0
  88:	eb000074 	bl	260 <grep>
    exit();
  8c:	eb000158 	bl	5f4 <exit>
{
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
  90:	e3001e3c 	movw	r1, #3644	; 0xe3c
  94:	e3a00002 	mov	r0, #2
  98:	e3401000 	movt	r1, #0
  9c:	eb00029f 	bl	b20 <printf>
    exit();
  a0:	eb000153 	bl	5f4 <exit>

000000a4 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  a4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  a8:	e1a05000 	mov	r5, r0
  ac:	e28db014 	add	fp, sp, #20
  b0:	e1a06001 	mov	r6, r1
  b4:	e1a04002 	mov	r4, r2
  b8:	ea000005 	b	d4 <matchstar+0x30>
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  bc:	e4d43001 	ldrb	r3, [r4], #1
  c0:	e3530000 	cmp	r3, #0
  c4:	08bd88f0 	popeq	{r4, r5, r6, r7, fp, pc}
  c8:	e1530005 	cmp	r3, r5
  cc:	1355002e 	cmpne	r5, #46	; 0x2e
  d0:	1a000006 	bne	f0 <matchstar+0x4c>

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  d4:	e1a01004 	mov	r1, r4
  d8:	e1a00006 	mov	r0, r6
  dc:	eb000004 	bl	f4 <matchhere>
  e0:	e3500000 	cmp	r0, #0
  e4:	0afffff4 	beq	bc <matchstar+0x18>
      return 1;
  e8:	e3a00001 	mov	r0, #1
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
}
  ec:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000000f4 <matchhere>:
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
  f4:	e5d02000 	ldrb	r2, [r0]
  f8:	e3520000 	cmp	r2, #0
  fc:	0a000035 	beq	1d8 <matchhere+0xe4>
    return 1;
  if(re[1] == '*')
 100:	e5d03001 	ldrb	r3, [r0, #1]
 104:	e353002a 	cmp	r3, #42	; 0x2a
 108:	0a000034 	beq	1e0 <matchhere+0xec>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
 10c:	e3520024 	cmp	r2, #36	; 0x24
 110:	03530000 	cmpeq	r3, #0
 114:	0a00002b 	beq	1c8 <matchhere+0xd4>
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 118:	e5d1c000 	ldrb	ip, [r1]
 11c:	e35c0000 	cmp	ip, #0
 120:	0a000033 	beq	1f4 <matchhere+0x100>
 124:	e352002e 	cmp	r2, #46	; 0x2e
 128:	1152000c 	cmpne	r2, ip
 12c:	03a02001 	moveq	r2, #1
 130:	13a02000 	movne	r2, #0
 134:	1a000030 	bne	1fc <matchhere+0x108>
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 138:	e92d4810 	push	{r4, fp, lr}
 13c:	e280c001 	add	ip, r0, #1
 140:	e28db008 	add	fp, sp, #8
 144:	e281e001 	add	lr, r1, #1
  if(re[0] == '\0')
 148:	e3530000 	cmp	r3, #0
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
 14c:	e1a0000c 	mov	r0, ip
 150:	e1a0100e 	mov	r1, lr
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
 154:	0a00000f 	beq	198 <matchhere+0xa4>
    return 1;
  if(re[1] == '*')
 158:	e5fc4001 	ldrb	r4, [ip, #1]!
 15c:	e354002a 	cmp	r4, #42	; 0x2a
 160:	0a00000e 	beq	1a0 <matchhere+0xac>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
 164:	e3530024 	cmp	r3, #36	; 0x24
 168:	03540000 	cmpeq	r4, #0
 16c:	0a000011 	beq	1b8 <matchhere+0xc4>
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 170:	e4de0001 	ldrb	r0, [lr], #1
 174:	e3500000 	cmp	r0, #0
 178:	08bd8810 	popeq	{r4, fp, pc}
 17c:	e1500003 	cmp	r0, r3
 180:	1353002e 	cmpne	r3, #46	; 0x2e
 184:	e1a03004 	mov	r3, r4
 188:	03a00001 	moveq	r0, #1
 18c:	13a00000 	movne	r0, #0
 190:	0affffec 	beq	148 <matchhere+0x54>
 194:	e8bd8810 	pop	{r4, fp, pc}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
 198:	e3a00001 	mov	r0, #1
 19c:	e8bd8810 	pop	{r4, fp, pc}
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
 1a0:	e1a02001 	mov	r2, r1
 1a4:	e2801002 	add	r1, r0, #2
 1a8:	e1a00003 	mov	r0, r3
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 1ac:	e24bd008 	sub	sp, fp, #8
 1b0:	e8bd4810 	pop	{r4, fp, lr}
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
 1b4:	eaffffba 	b	a4 <matchstar>
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
 1b8:	e5d10000 	ldrb	r0, [r1]
 1bc:	e16f0f10 	clz	r0, r0
 1c0:	e1a002a0 	lsr	r0, r0, #5
 1c4:	e8bd8810 	pop	{r4, fp, pc}
 1c8:	e5d10000 	ldrb	r0, [r1]
 1cc:	e16f0f10 	clz	r0, r0
 1d0:	e1a002a0 	lsr	r0, r0, #5
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 1d4:	e12fff1e 	bx	lr

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
 1d8:	e3a00001 	mov	r0, #1
 1dc:	e12fff1e 	bx	lr
  if(re[1] == '*')
 1e0:	e1a03002 	mov	r3, r2
    return matchstar(re[0], re+2, text);
 1e4:	e1a02001 	mov	r2, r1
 1e8:	e2801002 	add	r1, r0, #2
 1ec:	e1a00003 	mov	r0, r3
 1f0:	eaffffab 	b	a4 <matchstar>
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
 1f4:	e1a0000c 	mov	r0, ip
 1f8:	e12fff1e 	bx	lr
 1fc:	e1a00002 	mov	r0, r2
 200:	e12fff1e 	bx	lr

00000204 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 204:	e92d4830 	push	{r4, r5, fp, lr}
 208:	e1a05000 	mov	r5, r0
  if(re[0] == '^')
 20c:	e5d03000 	ldrb	r3, [r0]
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 210:	e28db00c 	add	fp, sp, #12
  if(re[0] == '^')
 214:	e353005e 	cmp	r3, #94	; 0x5e
 218:	11a04001 	movne	r4, r1
 21c:	1a000003 	bne	230 <match+0x2c>
 220:	ea00000a 	b	250 <match+0x4c>
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
 224:	e4d43001 	ldrb	r3, [r4], #1
 228:	e3530000 	cmp	r3, #0
 22c:	0a000006 	beq	24c <match+0x48>
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
 230:	e1a01004 	mov	r1, r4
 234:	e1a00005 	mov	r0, r5
 238:	ebffffad 	bl	f4 <matchhere>
 23c:	e3500000 	cmp	r0, #0
 240:	0afffff7 	beq	224 <match+0x20>
      return 1;
 244:	e3a00001 	mov	r0, #1
  }while(*text++ != '\0');
  return 0;
}
 248:	e8bd8830 	pop	{r4, r5, fp, pc}
 24c:	e8bd8830 	pop	{r4, r5, fp, pc}

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 250:	e2800001 	add	r0, r0, #1
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
}
 254:	e24bd00c 	sub	sp, fp, #12
 258:	e8bd4830 	pop	{r4, r5, fp, lr}

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 25c:	eaffffa4 	b	f4 <matchhere>

00000260 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 260:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 264:	e3009e9c 	movw	r9, #3740	; 0xe9c
 268:	e28db020 	add	fp, sp, #32
  int n, m;
  char *p, *q;
  
  m = 0;
 26c:	e3a07000 	mov	r7, #0
 270:	e3409000 	movt	r9, #0
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 274:	e1a05000 	mov	r5, r0
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      *q = 0;
 278:	e1a06007 	mov	r6, r7
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 27c:	e24dd00c 	sub	sp, sp, #12
 280:	e50b1028 	str	r1, [fp, #-40]	; 0xffffffd8
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
 284:	e2672b01 	rsb	r2, r7, #1024	; 0x400
 288:	e0891007 	add	r1, r9, r7
 28c:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
 290:	eb0000fe 	bl	690 <read>
 294:	e3500000 	cmp	r0, #0
 298:	da000025 	ble	334 <grep+0xd4>
    m += n;
    p = buf;
 29c:	e3004e9c 	movw	r4, #3740	; 0xe9c
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
 2a0:	e0877000 	add	r7, r7, r0
    p = buf;
 2a4:	e3404000 	movt	r4, #0
    while((q = strchr(p, '\n')) != 0){
 2a8:	e3a0800a 	mov	r8, #10
 2ac:	e3a0100a 	mov	r1, #10
 2b0:	e1a00004 	mov	r0, r4
 2b4:	eb000062 	bl	444 <strchr>
      *q = 0;
      if(match(pattern, p)){
 2b8:	e1a01004 	mov	r1, r4
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 2bc:	e250a000 	subs	sl, r0, #0
      *q = 0;
      if(match(pattern, p)){
 2c0:	e1a00005 	mov	r0, r5
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 2c4:	0a00000c 	beq	2fc <grep+0x9c>
      *q = 0;
 2c8:	e5ca6000 	strb	r6, [sl]
      if(match(pattern, p)){
 2cc:	ebffffcc 	bl	204 <match>
 2d0:	e3500000 	cmp	r0, #0
 2d4:	028a4001 	addeq	r4, sl, #1
 2d8:	0afffff3 	beq	2ac <grep+0x4c>
        *q = '\n';
 2dc:	e1a0300a 	mov	r3, sl
        write(1, p, q+1 - p);
 2e0:	e1a01004 	mov	r1, r4
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      *q = 0;
      if(match(pattern, p)){
        *q = '\n';
 2e4:	e4c38001 	strb	r8, [r3], #1
        write(1, p, q+1 - p);
 2e8:	e3a00001 	mov	r0, #1
 2ec:	e0642003 	rsb	r2, r4, r3
 2f0:	e1a04003 	mov	r4, r3
 2f4:	eb0000f2 	bl	6c4 <write>
 2f8:	eaffffeb 	b	2ac <grep+0x4c>
      }
      p = q+1;
    }
    if(p == buf)
 2fc:	e1540009 	cmp	r4, r9
      m = 0;
 300:	01a0700a 	moveq	r7, sl
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
 304:	0affffde 	beq	284 <grep+0x24>
      m = 0;
    if(m > 0){
 308:	e3570000 	cmp	r7, #0
 30c:	daffffdc 	ble	284 <grep+0x24>
      m -= p - buf;
 310:	e3003e9c 	movw	r3, #3740	; 0xe9c
      memmove(buf, p, m);
 314:	e3000e9c 	movw	r0, #3740	; 0xe9c
      p = q+1;
    }
    if(p == buf)
      m = 0;
    if(m > 0){
      m -= p - buf;
 318:	e3403000 	movt	r3, #0
 31c:	e0633004 	rsb	r3, r3, r4
 320:	e0637007 	rsb	r7, r3, r7
      memmove(buf, p, m);
 324:	e3400000 	movt	r0, #0
 328:	e1a02007 	mov	r2, r7
 32c:	eb000096 	bl	58c <memmove>
 330:	eaffffd3 	b	284 <grep+0x24>
    }
  }
}
 334:	e24bd020 	sub	sp, fp, #32
 338:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

0000033c <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
 33c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 340:	e2402001 	sub	r2, r0, #1
 344:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 348:	e4d13001 	ldrb	r3, [r1], #1
 34c:	e3530000 	cmp	r3, #0
 350:	e5e23001 	strb	r3, [r2, #1]!
 354:	1afffffb 	bne	348 <strcpy+0xc>
    ;
  return os;
}
 358:	e24bd000 	sub	sp, fp, #0
 35c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 360:	e12fff1e 	bx	lr

00000364 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 364:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 368:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
 36c:	e5d03000 	ldrb	r3, [r0]
 370:	e3530000 	cmp	r3, #0
 374:	05d10000 	ldrbeq	r0, [r1]
 378:	0a00000a 	beq	3a8 <strcmp+0x44>
 37c:	e5d12000 	ldrb	r2, [r1]
 380:	e1530002 	cmp	r3, r2
 384:	0a000003 	beq	398 <strcmp+0x34>
 388:	ea00000a 	b	3b8 <strcmp+0x54>
 38c:	e5f12001 	ldrb	r2, [r1, #1]!
 390:	e1530002 	cmp	r3, r2
 394:	1a000007 	bne	3b8 <strcmp+0x54>
 398:	e5f03001 	ldrb	r3, [r0, #1]!
 39c:	e3530000 	cmp	r3, #0
 3a0:	1afffff9 	bne	38c <strcmp+0x28>
 3a4:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 3a8:	e0600003 	rsb	r0, r0, r3
 3ac:	e24bd000 	sub	sp, fp, #0
 3b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3b4:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3b8:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 3bc:	e0600003 	rsb	r0, r0, r3
 3c0:	e24bd000 	sub	sp, fp, #0
 3c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 3c8:	e12fff1e 	bx	lr

000003cc <strlen>:

uint
strlen(char *s)
{
 3cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 3d0:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
 3d4:	e5d03000 	ldrb	r3, [r0]
 3d8:	e3530000 	cmp	r3, #0
 3dc:	0a000009 	beq	408 <strlen+0x3c>
 3e0:	e1a02000 	mov	r2, r0
 3e4:	e3a03000 	mov	r3, #0
 3e8:	e5f21001 	ldrb	r1, [r2, #1]!
 3ec:	e2833001 	add	r3, r3, #1
 3f0:	e3510000 	cmp	r1, #0
 3f4:	e1a00003 	mov	r0, r3
 3f8:	1afffffa 	bne	3e8 <strlen+0x1c>
    ;
  return n;
}
 3fc:	e24bd000 	sub	sp, fp, #0
 400:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 404:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 408:	e1a00003 	mov	r0, r3
 40c:	eafffffa 	b	3fc <strlen+0x30>

00000410 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 410:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
 414:	e1a03000 	mov	r3, r0
 418:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 41c:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
 420:	0a000004 	beq	438 <memset+0x28>
 424:	e6ef1071 	uxtb	r1, r1
 428:	e0800002 	add	r0, r0, r2
 42c:	e4c31001 	strb	r1, [r3], #1
 430:	e1500003 	cmp	r0, r3
 434:	1afffffc 	bne	42c <memset+0x1c>
  return (void *)p;
}
 438:	e24bd000 	sub	sp, fp, #0
 43c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 440:	e12fff1e 	bx	lr

00000444 <strchr>:

char*
strchr(const char *s, char c)
{
 444:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 448:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
 44c:	e5d02000 	ldrb	r2, [r0]
 450:	e3520000 	cmp	r2, #0
 454:	0a00000b 	beq	488 <strchr+0x44>
    if(*s == c)
 458:	e1510002 	cmp	r1, r2
 45c:	1a000002 	bne	46c <strchr+0x28>
 460:	ea000005 	b	47c <strchr+0x38>
 464:	e1530001 	cmp	r3, r1
 468:	0a000003 	beq	47c <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 46c:	e5f03001 	ldrb	r3, [r0, #1]!
 470:	e3530000 	cmp	r3, #0
 474:	1afffffa 	bne	464 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 478:	e1a00003 	mov	r0, r3
}
 47c:	e24bd000 	sub	sp, fp, #0
 480:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 484:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 488:	e1a00002 	mov	r0, r2
 48c:	eafffffa 	b	47c <strchr+0x38>

00000490 <gets>:
}

char*
gets(char *buf, int max)
{
 490:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
 494:	e1a08000 	mov	r8, r0
 498:	e28db018 	add	fp, sp, #24
 49c:	e1a07001 	mov	r7, r1
 4a0:	e24dd00c 	sub	sp, sp, #12
 4a4:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4a8:	e3a05000 	mov	r5, #0
 4ac:	ea000008 	b	4d4 <gets+0x44>
    cc = read(0, &c, 1);
 4b0:	eb000076 	bl	690 <read>
    if(cc < 1)
 4b4:	e3500000 	cmp	r0, #0
 4b8:	da00000b 	ble	4ec <gets+0x5c>
      break;
    buf[i++] = c;
 4bc:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
 4c0:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
 4c4:	e353000d 	cmp	r3, #13
 4c8:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 4cc:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
 4d0:	0a000005 	beq	4ec <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 4d4:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4d8:	e0854002 	add	r4, r5, r2
 4dc:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
 4e0:	e24b101d 	sub	r1, fp, #29
 4e4:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4e8:	bafffff0 	blt	4b0 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4ec:	e3a03000 	mov	r3, #0
  return buf;
}
 4f0:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4f4:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
 4f8:	e24bd018 	sub	sp, fp, #24
 4fc:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000500 <stat>:

int
stat(char *n, struct stat *st)
{
 500:	e92d4830 	push	{r4, r5, fp, lr}
 504:	e1a04001 	mov	r4, r1
 508:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 50c:	e3a01000 	mov	r1, #0
 510:	eb00009f 	bl	794 <open>
  if(fd < 0)
 514:	e2505000 	subs	r5, r0, #0
 518:	ba000006 	blt	538 <stat+0x38>
    return -1;
  r = fstat(fd, st);
 51c:	e1a01004 	mov	r1, r4
 520:	eb0000c2 	bl	830 <fstat>
 524:	e1a04000 	mov	r4, r0
  close(fd);
 528:	e1a00005 	mov	r0, r5
 52c:	eb000071 	bl	6f8 <close>
  return r;
 530:	e1a00004 	mov	r0, r4
 534:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 538:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
 53c:	e8bd8830 	pop	{r4, r5, fp, pc}

00000540 <atoi>:

int
atoi(const char *s)
{
 540:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 544:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 548:	e5d01000 	ldrb	r1, [r0]
 54c:	e2413030 	sub	r3, r1, #48	; 0x30
 550:	e3530009 	cmp	r3, #9
 554:	e3a03000 	mov	r3, #0
 558:	8a000007 	bhi	57c <atoi+0x3c>
    n = n*10 + *s++ - '0';
 55c:	e1a02183 	lsl	r2, r3, #3
 560:	e0823083 	add	r3, r2, r3, lsl #1
 564:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 568:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
 56c:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 570:	e2412030 	sub	r2, r1, #48	; 0x30
 574:	e3520009 	cmp	r2, #9
 578:	9afffff7 	bls	55c <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
 57c:	e1a00003 	mov	r0, r3
 580:	e24bd000 	sub	sp, fp, #0
 584:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 588:	e12fff1e 	bx	lr

0000058c <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 58c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
 590:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
 594:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 598:	da000005 	ble	5b4 <memmove+0x28>
 59c:	e0812002 	add	r2, r1, r2
 5a0:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
 5a4:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5a8:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
 5ac:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5b0:	1afffffb 	bne	5a4 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 5b4:	e24bd000 	sub	sp, fp, #0
 5b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
 5bc:	e12fff1e 	bx	lr

000005c0 <fork>:
 5c0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5c4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5c8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 5cc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 5d0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 5d4:	e3a00001 	mov	r0, #1
 5d8:	ef000040 	svc	0x00000040
 5dc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 5e4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 5e8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 5ec:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 5f0:	e12fff1e 	bx	lr

000005f4 <exit>:
 5f4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 5f8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 5fc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 600:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 604:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 608:	e3a00002 	mov	r0, #2
 60c:	ef000040 	svc	0x00000040
 610:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 614:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 618:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 61c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 620:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 624:	e12fff1e 	bx	lr

00000628 <wait>:
 628:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 62c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 630:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 634:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 638:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 63c:	e3a00003 	mov	r0, #3
 640:	ef000040 	svc	0x00000040
 644:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 648:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 64c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 650:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 654:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 658:	e12fff1e 	bx	lr

0000065c <pipe>:
 65c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 660:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 664:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 668:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 66c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 670:	e3a00004 	mov	r0, #4
 674:	ef000040 	svc	0x00000040
 678:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 67c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 680:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 684:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 688:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 68c:	e12fff1e 	bx	lr

00000690 <read>:
 690:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 694:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 698:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 69c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6a0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6a4:	e3a00005 	mov	r0, #5
 6a8:	ef000040 	svc	0x00000040
 6ac:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6b4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6b8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6bc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6c0:	e12fff1e 	bx	lr

000006c4 <write>:
 6c4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6c8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 6cc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 6d0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 6d4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 6d8:	e3a00010 	mov	r0, #16
 6dc:	ef000040 	svc	0x00000040
 6e0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 6e8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 6ec:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 6f0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 6f4:	e12fff1e 	bx	lr

000006f8 <close>:
 6f8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 6fc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 700:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 704:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 708:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 70c:	e3a00015 	mov	r0, #21
 710:	ef000040 	svc	0x00000040
 714:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 718:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 71c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 720:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 724:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 728:	e12fff1e 	bx	lr

0000072c <kill>:
 72c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 730:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 734:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 738:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 73c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 740:	e3a00006 	mov	r0, #6
 744:	ef000040 	svc	0x00000040
 748:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 74c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 750:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 754:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 758:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 75c:	e12fff1e 	bx	lr

00000760 <exec>:
 760:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 764:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 768:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 76c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 770:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 774:	e3a00007 	mov	r0, #7
 778:	ef000040 	svc	0x00000040
 77c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 780:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 784:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 788:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 78c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 790:	e12fff1e 	bx	lr

00000794 <open>:
 794:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 798:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 79c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7a0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7a4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7a8:	e3a0000f 	mov	r0, #15
 7ac:	ef000040 	svc	0x00000040
 7b0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7b8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7bc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7c0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7c4:	e12fff1e 	bx	lr

000007c8 <mknod>:
 7c8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 7cc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 7d0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 7d4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 7d8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 7dc:	e3a00011 	mov	r0, #17
 7e0:	ef000040 	svc	0x00000040
 7e4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 7ec:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 7f0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 7f4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 7f8:	e12fff1e 	bx	lr

000007fc <unlink>:
 7fc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 800:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 804:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 808:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 80c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 810:	e3a00012 	mov	r0, #18
 814:	ef000040 	svc	0x00000040
 818:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 81c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 820:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 824:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 828:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 82c:	e12fff1e 	bx	lr

00000830 <fstat>:
 830:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 834:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 838:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 83c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 840:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 844:	e3a00008 	mov	r0, #8
 848:	ef000040 	svc	0x00000040
 84c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 850:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 854:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 858:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 85c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 860:	e12fff1e 	bx	lr

00000864 <link>:
 864:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 868:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 86c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 870:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 874:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 878:	e3a00013 	mov	r0, #19
 87c:	ef000040 	svc	0x00000040
 880:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 884:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 888:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 88c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 890:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 894:	e12fff1e 	bx	lr

00000898 <mkdir>:
 898:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 89c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8a0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8a4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8a8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8ac:	e3a00014 	mov	r0, #20
 8b0:	ef000040 	svc	0x00000040
 8b4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8bc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8c0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8c4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8c8:	e12fff1e 	bx	lr

000008cc <chdir>:
 8cc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 8d0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 8d4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 8d8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 8dc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 8e0:	e3a00009 	mov	r0, #9
 8e4:	ef000040 	svc	0x00000040
 8e8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 8f0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 8f4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 8f8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 8fc:	e12fff1e 	bx	lr

00000900 <dup>:
 900:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 904:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 908:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 90c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 910:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 914:	e3a0000a 	mov	r0, #10
 918:	ef000040 	svc	0x00000040
 91c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 920:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 924:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 928:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 92c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 930:	e12fff1e 	bx	lr

00000934 <getpid>:
 934:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 938:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 93c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 940:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 944:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 948:	e3a0000b 	mov	r0, #11
 94c:	ef000040 	svc	0x00000040
 950:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 954:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 958:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 95c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 960:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 964:	e12fff1e 	bx	lr

00000968 <sbrk>:
 968:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 96c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 970:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 974:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 978:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 97c:	e3a0000c 	mov	r0, #12
 980:	ef000040 	svc	0x00000040
 984:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 988:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 98c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 990:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 994:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 998:	e12fff1e 	bx	lr

0000099c <sleep>:
 99c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 9a0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 9a4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 9a8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 9ac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 9b0:	e3a0000d 	mov	r0, #13
 9b4:	ef000040 	svc	0x00000040
 9b8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9c0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9c4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9c8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 9cc:	e12fff1e 	bx	lr

000009d0 <uptime>:
 9d0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
 9d4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
 9d8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
 9dc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
 9e0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
 9e4:	e3a0000e 	mov	r0, #14
 9e8:	ef000040 	svc	0x00000040
 9ec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
 9f4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
 9f8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
 9fc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
 a00:	e12fff1e 	bx	lr

00000a04 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 a04:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 a08:	e1a09fa1 	lsr	r9, r1, #31
 a0c:	e3530000 	cmp	r3, #0
 a10:	03a03000 	moveq	r3, #0
 a14:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 a18:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
 a1c:	e3530000 	cmp	r3, #0
 a20:	e3008e74 	movw	r8, #3700	; 0xe74
    neg = 1;
    x = -xx;
 a24:	1261e000 	rsbne	lr, r1, #0
 a28:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 a2c:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 a30:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
 a34:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
 a38:	01a09003 	moveq	r9, r3
 a3c:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
 a40:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 a44:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
 a48:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 a4c:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
 a50:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 a54:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 a58:	e1a0033e 	lsr	r0, lr, r3
 a5c:	e2000001 	and	r0, r0, #1
 a60:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
 a64:	e1520001 	cmp	r2, r1
            r = r - d;
 a68:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
 a6c:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 a70:	e2533001 	subs	r3, r3, #1
 a74:	2afffff7 	bcs	a58 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a78:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
 a7c:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a80:	e2873001 	add	r3, r7, #1
 a84:	e7d8100e 	ldrb	r1, [r8, lr]
 a88:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
 a8c:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
 a90:	11a07003 	movne	r7, r3
 a94:	1affffec 	bne	a4c <printint+0x48>
  }while((x = y) != 0);
  if(neg)
 a98:	e3590000 	cmp	r9, #0
 a9c:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
 aa0:	124b201c 	subne	r2, fp, #28
 aa4:	10822003 	addne	r2, r2, r3
 aa8:	12873002 	addne	r3, r7, #2
 aac:	e0865003 	add	r5, r6, r3
 ab0:	13a0102d 	movne	r1, #45	; 0x2d
 ab4:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
 ab8:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 abc:	e3a02001 	mov	r2, #1
 ac0:	e24b102d 	sub	r1, fp, #45	; 0x2d
 ac4:	e1a00004 	mov	r0, r4
 ac8:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
 acc:	ebfffefc 	bl	6c4 <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 ad0:	e1560005 	cmp	r6, r5
 ad4:	1afffff7 	bne	ab8 <printint+0xb4>
    putc(fd, buf[i]);
}
 ad8:	e24bd01c 	sub	sp, fp, #28
 adc:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000ae0 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 ae0:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
 ae4:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
 ae8:	e28db008 	add	fp, sp, #8
 aec:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 af0:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
 af4:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
 af8:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
 afc:	e1a0c33e 	lsr	ip, lr, r3
 b00:	e20cc001 	and	ip, ip, #1
 b04:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
 b08:	e1520001 	cmp	r2, r1
            r = r - d;
 b0c:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
 b10:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
 b14:	e2533001 	subs	r3, r3, #1
 b18:	2afffff7 	bcs	afc <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
 b1c:	e8bd8810 	pop	{r4, fp, pc}

00000b20 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 b20:	e92d000e 	push	{r1, r2, r3}
 b24:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
 b28:	e28db01c 	add	fp, sp, #28
 b2c:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b30:	e59b6004 	ldr	r6, [fp, #4]
 b34:	e5d64000 	ldrb	r4, [r6]
 b38:	e3540000 	cmp	r4, #0
 b3c:	0a00002d 	beq	bf8 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 b40:	e3008e88 	movw	r8, #3720	; 0xe88
 b44:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b48:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
 b4c:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b50:	e3a05000 	mov	r5, #0
 b54:	ea00000a 	b	b84 <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 b58:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
 b5c:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 b60:	0a000004 	beq	b78 <printf+0x58>
 b64:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 b68:	e3a02001 	mov	r2, #1
 b6c:	e1a00007 	mov	r0, r7
 b70:	e5614006 	strb	r4, [r1, #-6]!
 b74:	ebfffed2 	bl	6c4 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 b78:	e5f64001 	ldrb	r4, [r6, #1]!
 b7c:	e3540000 	cmp	r4, #0
 b80:	0a00001c 	beq	bf8 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
 b84:	e3550000 	cmp	r5, #0
 b88:	0afffff2 	beq	b58 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 b8c:	e3550025 	cmp	r5, #37	; 0x25
 b90:	1afffff8 	bne	b78 <printf+0x58>
      if(c == 'd'){
 b94:	e3540064 	cmp	r4, #100	; 0x64
 b98:	0a000037 	beq	c7c <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 b9c:	e20430f7 	and	r3, r4, #247	; 0xf7
 ba0:	e3530070 	cmp	r3, #112	; 0x70
 ba4:	0a000017 	beq	c08 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 ba8:	e3540073 	cmp	r4, #115	; 0x73
 bac:	0a00001c 	beq	c24 <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 bb0:	e3540063 	cmp	r4, #99	; 0x63
 bb4:	0a000037 	beq	c98 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 bb8:	e3540025 	cmp	r4, #37	; 0x25
 bbc:	0a000027 	beq	c60 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 bc0:	e3a02001 	mov	r2, #1
 bc4:	e24b1021 	sub	r1, fp, #33	; 0x21
 bc8:	e1a00007 	mov	r0, r7
 bcc:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
 bd0:	ebfffebb 	bl	6c4 <write>
 bd4:	e24b1020 	sub	r1, fp, #32
 bd8:	e3a02001 	mov	r2, #1
 bdc:	e1a00007 	mov	r0, r7
 be0:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 be4:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 be8:	ebfffeb5 	bl	6c4 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 bec:	e5f64001 	ldrb	r4, [r6, #1]!
 bf0:	e3540000 	cmp	r4, #0
 bf4:	1affffe2 	bne	b84 <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 bf8:	e24bd01c 	sub	sp, fp, #28
 bfc:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
 c00:	e28dd00c 	add	sp, sp, #12
 c04:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 c08:	e3a03000 	mov	r3, #0
 c0c:	e3a02010 	mov	r2, #16
 c10:	e4991004 	ldr	r1, [r9], #4
 c14:	e1a00007 	mov	r0, r7
 c18:	ebffff79 	bl	a04 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 c1c:	e3a05000 	mov	r5, #0
 c20:	eaffffd4 	b	b78 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 c24:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
 c28:	e3540000 	cmp	r4, #0
 c2c:	01a04008 	moveq	r4, r8
        while(*s != 0){
 c30:	e5d45000 	ldrb	r5, [r4]
 c34:	e3550000 	cmp	r5, #0
 c38:	0affffce 	beq	b78 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 c3c:	e3a02001 	mov	r2, #1
 c40:	e24b1025 	sub	r1, fp, #37	; 0x25
 c44:	e1a00007 	mov	r0, r7
 c48:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
 c4c:	ebfffe9c 	bl	6c4 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 c50:	e5f45001 	ldrb	r5, [r4, #1]!
 c54:	e3550000 	cmp	r5, #0
 c58:	1afffff7 	bne	c3c <printf+0x11c>
 c5c:	eaffffc5 	b	b78 <printf+0x58>
 c60:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 c64:	e3a02001 	mov	r2, #1
 c68:	e1a00007 	mov	r0, r7
 c6c:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 c70:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 c74:	ebfffe92 	bl	6c4 <write>
 c78:	eaffffbe 	b	b78 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 c7c:	e3a03001 	mov	r3, #1
 c80:	e3a0200a 	mov	r2, #10
 c84:	e4991004 	ldr	r1, [r9], #4
 c88:	e1a00007 	mov	r0, r7
 c8c:	ebffff5c 	bl	a04 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 c90:	e3a05000 	mov	r5, #0
 c94:	eaffffb7 	b	b78 <printf+0x58>
 c98:	e4993004 	ldr	r3, [r9], #4
 c9c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 ca0:	e3a02001 	mov	r2, #1
 ca4:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 ca8:	e3a05000 	mov	r5, #0
 cac:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 cb0:	ebfffe83 	bl	6c4 <write>
 cb4:	eaffffaf 	b	b78 <printf+0x58>

00000cb8 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cb8:	e300ce90 	movw	ip, #3728	; 0xe90
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 cbc:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cc0:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
 cc4:	e92d4810 	push	{r4, fp, lr}
 cc8:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ccc:	e59c3000 	ldr	r3, [ip]
 cd0:	ea000004 	b	ce8 <free+0x30>
 cd4:	e1510002 	cmp	r1, r2
 cd8:	3a000009 	bcc	d04 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cdc:	e1530002 	cmp	r3, r2
 ce0:	2a000007 	bcs	d04 <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
 ce4:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 ce8:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cec:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 cf0:	3afffff7 	bcc	cd4 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 cf4:	e1530002 	cmp	r3, r2
 cf8:	3afffff9 	bcc	ce4 <free+0x2c>
 cfc:	e1510002 	cmp	r1, r2
 d00:	2afffff7 	bcs	ce4 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
 d04:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 d08:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 d0c:	e081418e 	add	r4, r1, lr, lsl #3
 d10:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
 d14:	05922004 	ldreq	r2, [r2, #4]
 d18:	0082e00e 	addeq	lr, r2, lr
 d1c:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
 d20:	05932000 	ldreq	r2, [r3]
 d24:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
 d28:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
 d2c:	e5932004 	ldr	r2, [r3, #4]
 d30:	e083e182 	add	lr, r3, r2, lsl #3
 d34:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 d38:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 d3c:	05101004 	ldreq	r1, [r0, #-4]
 d40:	00812002 	addeq	r2, r1, r2
 d44:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
 d48:	05102008 	ldreq	r2, [r0, #-8]
 d4c:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
 d50:	e8bd8810 	pop	{r4, fp, pc}

00000d54 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 d54:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
 d58:	e3008e90 	movw	r8, #3728	; 0xe90
 d5c:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d60:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
 d64:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
 d68:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d6c:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
 d70:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 d74:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
 d78:	0a00002a 	beq	e28 <malloc+0xd4>
 d7c:	e5930000 	ldr	r0, [r3]
 d80:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 d84:	e1540002 	cmp	r4, r2
 d88:	9a00001c 	bls	e00 <malloc+0xac>
 d8c:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 d90:	e3005e90 	movw	r5, #3728	; 0xe90
 d94:	e3405000 	movt	r5, #0
 d98:	33a06902 	movcc	r6, #32768	; 0x8000
 d9c:	21a06184 	lslcs	r6, r4, #3
 da0:	21a07004 	movcs	r7, r4
 da4:	33a07a01 	movcc	r7, #4096	; 0x1000
 da8:	ea000003 	b	dbc <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 dac:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
 db0:	e5902004 	ldr	r2, [r0, #4]
 db4:	e1540002 	cmp	r4, r2
 db8:	9a000010 	bls	e00 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 dbc:	e5982000 	ldr	r2, [r8]
 dc0:	e1a03000 	mov	r3, r0
 dc4:	e1520000 	cmp	r2, r0
 dc8:	1afffff7 	bne	dac <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 dcc:	e1a00006 	mov	r0, r6
 dd0:	ebfffee4 	bl	968 <sbrk>
 dd4:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
 dd8:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
 ddc:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
 de0:	0a000004 	beq	df8 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 de4:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
 de8:	ebffffb2 	bl	cb8 <free>
  return freep;
 dec:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 df0:	e3530000 	cmp	r3, #0
 df4:	1affffec 	bne	dac <malloc+0x58>
        return 0;
 df8:	e3a00000 	mov	r0, #0
  }
}
 dfc:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 e00:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
 e04:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 e08:	10642002 	rsbne	r2, r4, r2
 e0c:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 e10:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
 e14:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 e18:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
 e1c:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 e20:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 e24:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 e28:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
 e2c:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 e30:	e5880000 	str	r0, [r8]
 e34:	e5880004 	str	r0, [r8, #4]
 e38:	eaffffd3 	b	d8c <malloc+0x38>
