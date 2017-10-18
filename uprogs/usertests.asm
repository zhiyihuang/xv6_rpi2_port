
_usertests:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
}

int
main(int argc, char *argv[])
{
  printf(1, "usertests starting\n");
       0:	e3051790 	movw	r1, #22416	; 0x5790
       4:	e3a00001 	mov	r0, #1
  return randstate;
}

int
main(int argc, char *argv[])
{
       8:	e92d4800 	push	{fp, lr}
  printf(1, "usertests starting\n");
       c:	e3401000 	movt	r1, #0
  return randstate;
}

int
main(int argc, char *argv[])
{
      10:	e28db004 	add	fp, sp, #4
  printf(1, "usertests starting\n");
      14:	eb000e9f 	bl	3a98 <printf>

  if(open("usertests.ran", 0) >= 0){
      18:	e30507a4 	movw	r0, #22436	; 0x57a4
      1c:	e3400000 	movt	r0, #0
      20:	e3a01000 	mov	r1, #0
      24:	eb000db8 	bl	370c <open>
      28:	e3500000 	cmp	r0, #0
      2c:	ba000004 	blt	44 <main+0x44>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      30:	e30517b4 	movw	r1, #22452	; 0x57b4
      34:	e3a00001 	mov	r0, #1
      38:	e3401000 	movt	r1, #0
      3c:	eb000e95 	bl	3a98 <printf>
    exit();
      40:	eb000d49 	bl	356c <exit>
  }
  close(open("usertests.ran", O_CREATE));
      44:	e30507a4 	movw	r0, #22436	; 0x57a4
      48:	e3a01c02 	mov	r1, #512	; 0x200
      4c:	e3400000 	movt	r0, #0
      50:	eb000dad 	bl	370c <open>
      54:	eb000d85 	bl	3670 <close>

  bigargtest();
      58:	eb000bb6 	bl	2f38 <bigargtest>
  bigwrite();
      5c:	eb0007cf 	bl	1fa0 <bigwrite>
  bigargtest();
      60:	eb000bb4 	bl	2f38 <bigargtest>
  bsstest();
      64:	eb000b94 	bl	2ebc <bsstest>
  sbrktest();
      68:	eb000a03 	bl	287c <sbrktest>
  validatetest();
      6c:	eb000b68 	bl	2e14 <validatetest>

  opentest();
      70:	eb000017 	bl	d4 <opentest>
  writetest();
      74:	eb00003b 	bl	168 <writetest>
  writetest1();
      78:	eb0000a8 	bl	320 <writetest1>
  createtest();
      7c:	eb000112 	bl	4cc <createtest>

  mem();
      80:	eb000257 	bl	9e4 <mem>
  pipe1();
      84:	eb000186 	bl	6a4 <pipe1>
  preempt();
      88:	eb0001e9 	bl	834 <preempt>
  exitwait();
      8c:	eb000234 	bl	964 <exitwait>

  rmdot();
      90:	eb0008b6 	bl	2370 <rmdot>
  fourteen();
      94:	eb000869 	bl	2240 <fourteen>
  bigfile();
      98:	eb0007f9 	bl	2084 <bigfile>
  subdir();
      9c:	eb00061f 	bl	1920 <subdir>
  concreate();
      a0:	eb0004cd 	bl	13dc <concreate>
  linkunlink();
      a4:	eb00058f 	bl	16e8 <linkunlink>
  linktest();
      a8:	eb000449 	bl	11d4 <linktest>
  unlinkread();
      ac:	eb0003e6 	bl	104c <unlinkread>
  createdelete();
      b0:	eb00035c 	bl	e28 <createdelete>
  twofiles();
      b4:	eb0002dd 	bl	c30 <twofiles>
  sharedfd();
      b8:	eb000276 	bl	a98 <sharedfd>
  dirfile();
      bc:	eb000907 	bl	24e0 <dirfile>
  iref();
      c0:	eb000980 	bl	26c8 <iref>
  forktest();
      c4:	eb0009be 	bl	27c4 <forktest>
  bigdir(); // slow
      c8:	eb0005c5 	bl	17e4 <bigdir>

  exectest();
      cc:	eb000161 	bl	658 <exectest>

  exit();
      d0:	eb000d25 	bl	356c <exit>

000000d4 <opentest>:

// simple file system tests

void
opentest(void)
{
      d4:	e92d4830 	push	{r4, r5, fp, lr}
  int fd;

  printf(stdout, "open test\n");
      d8:	e3054810 	movw	r4, #22544	; 0x5810
      dc:	e3031db4 	movw	r1, #15796	; 0x3db4
      e0:	e3404000 	movt	r4, #0

// simple file system tests

void
opentest(void)
{
      e4:	e28db00c 	add	fp, sp, #12
  int fd;

  printf(stdout, "open test\n");
      e8:	e3401000 	movt	r1, #0
      ec:	e5940000 	ldr	r0, [r4]
      f0:	eb000e68 	bl	3a98 <printf>
  fd = open("echo", 0);
      f4:	e3030dc0 	movw	r0, #15808	; 0x3dc0
      f8:	e3400000 	movt	r0, #0
      fc:	e3a01000 	mov	r1, #0
     100:	eb000d81 	bl	370c <open>
  if(fd < 0){
     104:	e3500000 	cmp	r0, #0
     108:	ba00000c 	blt	140 <opentest+0x6c>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     10c:	eb000d57 	bl	3670 <close>
  fd = open("doesnotexist", 0);
     110:	e3030ddc 	movw	r0, #15836	; 0x3ddc
     114:	e3400000 	movt	r0, #0
     118:	e3a01000 	mov	r1, #0
     11c:	eb000d7a 	bl	370c <open>
  if(fd >= 0){
     120:	e3500000 	cmp	r0, #0
     124:	aa00000a 	bge	154 <opentest+0x80>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     128:	e3031e0c 	movw	r1, #15884	; 0x3e0c
     12c:	e5940000 	ldr	r0, [r4]
     130:	e3401000 	movt	r1, #0
}
     134:	e24bd00c 	sub	sp, fp, #12
     138:	e8bd4830 	pop	{r4, r5, fp, lr}
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     13c:	ea000e55 	b	3a98 <printf>
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     140:	e3031dc8 	movw	r1, #15816	; 0x3dc8
     144:	e5940000 	ldr	r0, [r4]
     148:	e3401000 	movt	r1, #0
     14c:	eb000e51 	bl	3a98 <printf>
    exit();
     150:	eb000d05 	bl	356c <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     154:	e3031dec 	movw	r1, #15852	; 0x3dec
     158:	e5940000 	ldr	r0, [r4]
     15c:	e3401000 	movt	r1, #0
     160:	eb000e4c 	bl	3a98 <printf>
    exit();
     164:	eb000d00 	bl	356c <exit>

00000168 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     168:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int fd;
  int i;

  printf(stdout, "small file test\n");
     16c:	e3056810 	movw	r6, #22544	; 0x5810
     170:	e3031e1c 	movw	r1, #15900	; 0x3e1c
     174:	e3406000 	movt	r6, #0
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     178:	e28db014 	add	fp, sp, #20
  int fd;
  int i;

  printf(stdout, "small file test\n");
     17c:	e3401000 	movt	r1, #0
     180:	e5960000 	ldr	r0, [r6]
     184:	eb000e43 	bl	3a98 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     188:	e3030e30 	movw	r0, #15920	; 0x3e30
     18c:	e3400000 	movt	r0, #0
     190:	e3001202 	movw	r1, #514	; 0x202
     194:	eb000d5c 	bl	370c <open>
  if(fd >= 0){
     198:	e2505000 	subs	r5, r0, #0
     19c:	ba00005a 	blt	30c <writetest+0x1a4>
    printf(stdout, "creat small succeeded; ok\n");
     1a0:	e3031e38 	movw	r1, #15928	; 0x3e38
     1a4:	e5960000 	ldr	r0, [r6]
     1a8:	e3401000 	movt	r1, #0
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     1ac:	e3a04000 	mov	r4, #0
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     1b0:	eb000e38 	bl	3a98 <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     1b4:	e3031e70 	movw	r1, #15984	; 0x3e70
     1b8:	e3a0200a 	mov	r2, #10
     1bc:	e3401000 	movt	r1, #0
     1c0:	e1a00005 	mov	r0, r5
     1c4:	eb000d1c 	bl	363c <write>
     1c8:	e350000a 	cmp	r0, #10
     1cc:	1a000033 	bne	2a0 <writetest+0x138>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     1d0:	e3031ea0 	movw	r1, #16032	; 0x3ea0
     1d4:	e1a02000 	mov	r2, r0
     1d8:	e3401000 	movt	r1, #0
     1dc:	e1a00005 	mov	r0, r5
     1e0:	eb000d15 	bl	363c <write>
     1e4:	e350000a 	cmp	r0, #10
     1e8:	1a000032 	bne	2b8 <writetest+0x150>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     1ec:	e2844001 	add	r4, r4, #1
     1f0:	e3540064 	cmp	r4, #100	; 0x64
     1f4:	1affffee 	bne	1b4 <writetest+0x4c>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     1f8:	e3031ed0 	movw	r1, #16080	; 0x3ed0
     1fc:	e5960000 	ldr	r0, [r6]
     200:	e3401000 	movt	r1, #0
     204:	e3054810 	movw	r4, #22544	; 0x5810
     208:	eb000e22 	bl	3a98 <printf>
  close(fd);
     20c:	e1a00005 	mov	r0, r5
     210:	eb000d16 	bl	3670 <close>
  fd = open("small", O_RDONLY);
     214:	e3030e30 	movw	r0, #15920	; 0x3e30
     218:	e3400000 	movt	r0, #0
     21c:	e3a01000 	mov	r1, #0
     220:	eb000d39 	bl	370c <open>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     224:	e3404000 	movt	r4, #0
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
     228:	e2505000 	subs	r5, r0, #0
     22c:	ba000027 	blt	2d0 <writetest+0x168>
    printf(stdout, "open small succeeded ok\n");
     230:	e3031edc 	movw	r1, #16092	; 0x3edc
     234:	e5940000 	ldr	r0, [r4]
     238:	e3401000 	movt	r1, #0
     23c:	eb000e15 	bl	3a98 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     240:	e3071fc8 	movw	r1, #32712	; 0x7fc8
     244:	e3401000 	movt	r1, #0
     248:	e3a02e7d 	mov	r2, #2000	; 0x7d0
     24c:	e1a00005 	mov	r0, r5
     250:	eb000cec 	bl	3608 <read>
  if(i == 2000){
     254:	e3500e7d 	cmp	r0, #2000	; 0x7d0
     258:	1a000021 	bne	2e4 <writetest+0x17c>
    printf(stdout, "read succeeded ok\n");
     25c:	e3031f14 	movw	r1, #16148	; 0x3f14
     260:	e5940000 	ldr	r0, [r4]
     264:	e3401000 	movt	r1, #0
     268:	eb000e0a 	bl	3a98 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     26c:	e1a00005 	mov	r0, r5
     270:	eb000cfe 	bl	3670 <close>

  if(unlink("small") < 0){
     274:	e3030e30 	movw	r0, #15920	; 0x3e30
     278:	e3400000 	movt	r0, #0
     27c:	eb000d3c 	bl	3774 <unlink>
     280:	e3500000 	cmp	r0, #0
     284:	ba00001b 	blt	2f8 <writetest+0x190>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     288:	e3031f50 	movw	r1, #16208	; 0x3f50
     28c:	e5940000 	ldr	r0, [r4]
     290:	e3401000 	movt	r1, #0
}
     294:	e24bd014 	sub	sp, fp, #20
     298:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     29c:	ea000dfd 	b	3a98 <printf>
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     2a0:	e3031e7c 	movw	r1, #15996	; 0x3e7c
     2a4:	e1a02004 	mov	r2, r4
     2a8:	e5960000 	ldr	r0, [r6]
     2ac:	e3401000 	movt	r1, #0
     2b0:	eb000df8 	bl	3a98 <printf>
      exit();
     2b4:	eb000cac 	bl	356c <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     2b8:	e3031eac 	movw	r1, #16044	; 0x3eac
     2bc:	e1a02004 	mov	r2, r4
     2c0:	e5960000 	ldr	r0, [r6]
     2c4:	e3401000 	movt	r1, #0
     2c8:	eb000df2 	bl	3a98 <printf>
      exit();
     2cc:	eb000ca6 	bl	356c <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     2d0:	e3031ef8 	movw	r1, #16120	; 0x3ef8
     2d4:	e5940000 	ldr	r0, [r4]
     2d8:	e3401000 	movt	r1, #0
     2dc:	eb000ded 	bl	3a98 <printf>
    exit();
     2e0:	eb000ca1 	bl	356c <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     2e4:	e3031f28 	movw	r1, #16168	; 0x3f28
     2e8:	e5940000 	ldr	r0, [r4]
     2ec:	e3401000 	movt	r1, #0
     2f0:	eb000de8 	bl	3a98 <printf>
    exit();
     2f4:	eb000c9c 	bl	356c <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     2f8:	e3031f38 	movw	r1, #16184	; 0x3f38
     2fc:	e5940000 	ldr	r0, [r4]
     300:	e3401000 	movt	r1, #0
     304:	eb000de3 	bl	3a98 <printf>
    exit();
     308:	eb000c97 	bl	356c <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     30c:	e3031e54 	movw	r1, #15956	; 0x3e54
     310:	e5960000 	ldr	r0, [r6]
     314:	e3401000 	movt	r1, #0
     318:	eb000dde 	bl	3a98 <printf>
    exit();
     31c:	eb000c92 	bl	356c <exit>

00000320 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     320:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int i, fd, n;

  printf(stdout, "big files test\n");
     324:	e3057810 	movw	r7, #22544	; 0x5810
     328:	e3031f64 	movw	r1, #16228	; 0x3f64
     32c:	e3407000 	movt	r7, #0
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     330:	e28db014 	add	fp, sp, #20
  int i, fd, n;

  printf(stdout, "big files test\n");
     334:	e3401000 	movt	r1, #0
     338:	e5970000 	ldr	r0, [r7]
     33c:	eb000dd5 	bl	3a98 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     340:	e3030f74 	movw	r0, #16244	; 0x3f74
     344:	e3400000 	movt	r0, #0
     348:	e3001202 	movw	r1, #514	; 0x202
     34c:	eb000cee 	bl	370c <open>
  if(fd < 0){
     350:	e2506000 	subs	r6, r0, #0
     354:	a3075fc8 	movwge	r5, #32712	; 0x7fc8
     358:	a3a04000 	movge	r4, #0
     35c:	a3405000 	movtge	r5, #0
     360:	ba00004f 	blt	4a4 <writetest1+0x184>
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     364:	e3071fc8 	movw	r1, #32712	; 0x7fc8
     368:	e3a02c02 	mov	r2, #512	; 0x200
     36c:	e3401000 	movt	r1, #0
     370:	e1a00006 	mov	r0, r6
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     374:	e5854000 	str	r4, [r5]
    if(write(fd, buf, 512) != 512){
     378:	eb000caf 	bl	363c <write>
     37c:	e3500c02 	cmp	r0, #512	; 0x200
     380:	1a00002a 	bne	430 <writetest1+0x110>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     384:	e2844001 	add	r4, r4, #1
     388:	e354008c 	cmp	r4, #140	; 0x8c
     38c:	1afffff4 	bne	364 <writetest1+0x44>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     390:	e1a00006 	mov	r0, r6
     394:	eb000cb5 	bl	3670 <close>

  fd = open("big", O_RDONLY);
     398:	e3030f74 	movw	r0, #16244	; 0x3f74
     39c:	e3400000 	movt	r0, #0
     3a0:	e3a01000 	mov	r1, #0
     3a4:	eb000cd8 	bl	370c <open>
  if(fd < 0){
     3a8:	e2506000 	subs	r6, r0, #0
     3ac:	ba000037 	blt	490 <writetest1+0x170>
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     3b0:	e3075fc8 	movw	r5, #32712	; 0x7fc8
     3b4:	e3a04000 	mov	r4, #0
     3b8:	e3405000 	movt	r5, #0
     3bc:	ea000005 	b	3d8 <writetest1+0xb8>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     3c0:	e3500c02 	cmp	r0, #512	; 0x200
     3c4:	1a000025 	bne	460 <writetest1+0x140>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     3c8:	e5953000 	ldr	r3, [r5]
     3cc:	e1540003 	cmp	r4, r3
     3d0:	1a00001c 	bne	448 <writetest1+0x128>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     3d4:	e2844001 	add	r4, r4, #1
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     3d8:	e3071fc8 	movw	r1, #32712	; 0x7fc8
     3dc:	e3a02c02 	mov	r2, #512	; 0x200
     3e0:	e3401000 	movt	r1, #0
     3e4:	e1a00006 	mov	r0, r6
     3e8:	eb000c86 	bl	3608 <read>
    if(i == 0){
     3ec:	e3500000 	cmp	r0, #0
     3f0:	1afffff2 	bne	3c0 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     3f4:	e354008b 	cmp	r4, #139	; 0x8b
     3f8:	0a00001e 	beq	478 <writetest1+0x158>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     3fc:	e1a00006 	mov	r0, r6
     400:	eb000c9a 	bl	3670 <close>
  if(unlink("big") < 0){
     404:	e3030f74 	movw	r0, #16244	; 0x3f74
     408:	e3400000 	movt	r0, #0
     40c:	eb000cd8 	bl	3774 <unlink>
     410:	e3500000 	cmp	r0, #0
     414:	ba000027 	blt	4b8 <writetest1+0x198>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     418:	e3041034 	movw	r1, #16436	; 0x4034
     41c:	e5970000 	ldr	r0, [r7]
     420:	e3401000 	movt	r1, #0
}
     424:	e24bd014 	sub	sp, fp, #20
     428:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     42c:	ea000d99 	b	3a98 <printf>
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     430:	e3031f94 	movw	r1, #16276	; 0x3f94
     434:	e1a02004 	mov	r2, r4
     438:	e5970000 	ldr	r0, [r7]
     43c:	e3401000 	movt	r1, #0
     440:	eb000d94 	bl	3a98 <printf>
      exit();
     444:	eb000c48 	bl	356c <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     448:	e3041000 	movw	r1, #16384	; 0x4000
     44c:	e1a02004 	mov	r2, r4
     450:	e5970000 	ldr	r0, [r7]
     454:	e3401000 	movt	r1, #0
     458:	eb000d8e 	bl	3a98 <printf>
             n, ((int*)buf)[0]);
      exit();
     45c:	eb000c42 	bl	356c <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     460:	e3031ff0 	movw	r1, #16368	; 0x3ff0
     464:	e1a02000 	mov	r2, r0
     468:	e3401000 	movt	r1, #0
     46c:	e5970000 	ldr	r0, [r7]
     470:	eb000d88 	bl	3a98 <printf>
      exit();
     474:	eb000c3c 	bl	356c <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     478:	e3031fd0 	movw	r1, #16336	; 0x3fd0
     47c:	e1a02004 	mov	r2, r4
     480:	e5970000 	ldr	r0, [r7]
     484:	e3401000 	movt	r1, #0
     488:	eb000d82 	bl	3a98 <printf>
        exit();
     48c:	eb000c36 	bl	356c <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     490:	e3031fb4 	movw	r1, #16308	; 0x3fb4
     494:	e5970000 	ldr	r0, [r7]
     498:	e3401000 	movt	r1, #0
     49c:	eb000d7d 	bl	3a98 <printf>
    exit();
     4a0:	eb000c31 	bl	356c <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     4a4:	e3031f78 	movw	r1, #16248	; 0x3f78
     4a8:	e5970000 	ldr	r0, [r7]
     4ac:	e3401000 	movt	r1, #0
     4b0:	eb000d78 	bl	3a98 <printf>
    exit();
     4b4:	eb000c2c 	bl	356c <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     4b8:	e3041020 	movw	r1, #16416	; 0x4020
     4bc:	e5970000 	ldr	r0, [r7]
     4c0:	e3401000 	movt	r1, #0
     4c4:	eb000d73 	bl	3a98 <printf>
    exit();
     4c8:	eb000c27 	bl	356c <exit>

000004cc <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     4cc:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     4d0:	e3057810 	movw	r7, #22544	; 0x5810
     4d4:	e3041044 	movw	r1, #16452	; 0x4044
     4d8:	e3407000 	movt	r7, #0

  name[0] = 'a';
     4dc:	e3096fc8 	movw	r6, #40904	; 0x9fc8
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     4e0:	e28db014 	add	fp, sp, #20
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
     4e4:	e3406000 	movt	r6, #0
void
createtest(void)
{
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     4e8:	e5970000 	ldr	r0, [r7]
     4ec:	e3401000 	movt	r1, #0

  name[0] = 'a';
  name[2] = '\0';
     4f0:	e3a04030 	mov	r4, #48	; 0x30
void
createtest(void)
{
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     4f4:	eb000d67 	bl	3a98 <printf>

  name[0] = 'a';
     4f8:	e3a02061 	mov	r2, #97	; 0x61
  name[2] = '\0';
     4fc:	e3a03000 	mov	r3, #0
{
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
     500:	e5c62000 	strb	r2, [r6]
  name[2] = '\0';
     504:	e5c63002 	strb	r3, [r6, #2]
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     508:	e3095fc8 	movw	r5, #40904	; 0x9fc8
     50c:	e5c64001 	strb	r4, [r6, #1]
     510:	e3405000 	movt	r5, #0
     514:	e2844001 	add	r4, r4, #1
    fd = open(name, O_CREATE|O_RDWR);
     518:	e3001202 	movw	r1, #514	; 0x202
     51c:	e1a00005 	mov	r0, r5
     520:	eb000c79 	bl	370c <open>
     524:	e6ef4074 	uxtb	r4, r4
    close(fd);
     528:	eb000c50 	bl	3670 <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     52c:	e3540064 	cmp	r4, #100	; 0x64
     530:	1afffff4 	bne	508 <createtest+0x3c>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
     534:	e3a04030 	mov	r4, #48	; 0x30
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     538:	e3a02061 	mov	r2, #97	; 0x61
  name[2] = '\0';
     53c:	e3a03000 	mov	r3, #0
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     540:	e5c52000 	strb	r2, [r5]
  name[2] = '\0';
     544:	e5c53002 	strb	r3, [r5, #2]
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     548:	e5c64001 	strb	r4, [r6, #1]
     54c:	e2844001 	add	r4, r4, #1
    unlink(name);
     550:	e3090fc8 	movw	r0, #40904	; 0x9fc8
     554:	e3400000 	movt	r0, #0
     558:	e6ef4074 	uxtb	r4, r4
     55c:	eb000c84 	bl	3774 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     560:	e3540064 	cmp	r4, #100	; 0x64
     564:	1afffff7 	bne	548 <createtest+0x7c>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     568:	e304106c 	movw	r1, #16492	; 0x406c
     56c:	e5970000 	ldr	r0, [r7]
     570:	e3401000 	movt	r1, #0
}
     574:	e24bd014 	sub	sp, fp, #20
     578:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     57c:	ea000d45 	b	3a98 <printf>

00000580 <dirtest>:
}

void dirtest(void)
{
     580:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "mkdir test\n");
     584:	e3054810 	movw	r4, #22544	; 0x5810
     588:	e3041094 	movw	r1, #16532	; 0x4094
     58c:	e3404000 	movt	r4, #0
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
}

void dirtest(void)
{
     590:	e28db00c 	add	fp, sp, #12
  printf(stdout, "mkdir test\n");
     594:	e3401000 	movt	r1, #0
     598:	e5940000 	ldr	r0, [r4]
     59c:	eb000d3d 	bl	3a98 <printf>

  if(mkdir("dir0") < 0){
     5a0:	e30400a0 	movw	r0, #16544	; 0x40a0
     5a4:	e3400000 	movt	r0, #0
     5a8:	eb000c98 	bl	3810 <mkdir>
     5ac:	e3500000 	cmp	r0, #0
     5b0:	ba000014 	blt	608 <dirtest+0x88>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     5b4:	e30400a0 	movw	r0, #16544	; 0x40a0
     5b8:	e3400000 	movt	r0, #0
     5bc:	eb000ca0 	bl	3844 <chdir>
     5c0:	e3500000 	cmp	r0, #0
     5c4:	ba00001e 	blt	644 <dirtest+0xc4>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     5c8:	e30400cc 	movw	r0, #16588	; 0x40cc
     5cc:	e3400000 	movt	r0, #0
     5d0:	eb000c9b 	bl	3844 <chdir>
     5d4:	e3500000 	cmp	r0, #0
     5d8:	ba000014 	blt	630 <dirtest+0xb0>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     5dc:	e30400a0 	movw	r0, #16544	; 0x40a0
     5e0:	e3400000 	movt	r0, #0
     5e4:	eb000c62 	bl	3774 <unlink>
     5e8:	e3500000 	cmp	r0, #0
     5ec:	ba00000a 	blt	61c <dirtest+0x9c>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test\n");
     5f0:	e3041094 	movw	r1, #16532	; 0x4094
     5f4:	e5940000 	ldr	r0, [r4]
     5f8:	e3401000 	movt	r1, #0
}
     5fc:	e24bd00c 	sub	sp, fp, #12
     600:	e8bd4830 	pop	{r4, r5, fp, lr}

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test\n");
     604:	ea000d23 	b	3a98 <printf>
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     608:	e30410a8 	movw	r1, #16552	; 0x40a8
     60c:	e5940000 	ldr	r0, [r4]
     610:	e3401000 	movt	r1, #0
     614:	eb000d1f 	bl	3a98 <printf>
    exit();
     618:	eb000bd3 	bl	356c <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     61c:	e30410e4 	movw	r1, #16612	; 0x40e4
     620:	e5940000 	ldr	r0, [r4]
     624:	e3401000 	movt	r1, #0
     628:	eb000d1a 	bl	3a98 <printf>
    exit();
     62c:	eb000bce 	bl	356c <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     630:	e30410d0 	movw	r1, #16592	; 0x40d0
     634:	e5940000 	ldr	r0, [r4]
     638:	e3401000 	movt	r1, #0
     63c:	eb000d15 	bl	3a98 <printf>
    exit();
     640:	eb000bc9 	bl	356c <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     644:	e30410b8 	movw	r1, #16568	; 0x40b8
     648:	e5940000 	ldr	r0, [r4]
     64c:	e3401000 	movt	r1, #0
     650:	eb000d10 	bl	3a98 <printf>
    exit();
     654:	eb000bc4 	bl	356c <exit>

00000658 <exectest>:
  printf(stdout, "mkdir test\n");
}

void
exectest(void)
{
     658:	e92d4830 	push	{r4, r5, fp, lr}
  printf(stdout, "exec test\n");
     65c:	e3054810 	movw	r4, #22544	; 0x5810
     660:	e3404000 	movt	r4, #0
     664:	e30410f8 	movw	r1, #16632	; 0x40f8
  printf(stdout, "mkdir test\n");
}

void
exectest(void)
{
     668:	e28db00c 	add	fp, sp, #12
  printf(stdout, "exec test\n");
     66c:	e3401000 	movt	r1, #0
     670:	e5940000 	ldr	r0, [r4]
     674:	eb000d07 	bl	3a98 <printf>
  if(exec("echo", echoargv) < 0){
     678:	e3030dc0 	movw	r0, #15808	; 0x3dc0
     67c:	e2841004 	add	r1, r4, #4
     680:	e3400000 	movt	r0, #0
     684:	eb000c13 	bl	36d8 <exec>
     688:	e3500000 	cmp	r0, #0
     68c:	a8bd8830 	popge	{r4, r5, fp, pc}
    printf(stdout, "exec echo failed\n");
     690:	e3041104 	movw	r1, #16644	; 0x4104
     694:	e5940000 	ldr	r0, [r4]
     698:	e3401000 	movt	r1, #0
     69c:	eb000cfd 	bl	3a98 <printf>
    exit();
     6a0:	eb000bb1 	bl	356c <exit>

000006a4 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     6a4:	e92d4870 	push	{r4, r5, r6, fp, lr}
     6a8:	e28db010 	add	fp, sp, #16
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     6ac:	e24b001c 	sub	r0, fp, #28

// simple fork and pipe read/write

void
pipe1(void)
{
     6b0:	e24dd00c 	sub	sp, sp, #12
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     6b4:	eb000bc6 	bl	35d4 <pipe>
     6b8:	e2504000 	subs	r4, r0, #0
     6bc:	1a00004d 	bne	7f8 <pipe1+0x154>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     6c0:	eb000b9c 	bl	3538 <fork>
  seq = 0;
  if(pid == 0){
     6c4:	e2505000 	subs	r5, r0, #0
     6c8:	0a000020 	beq	750 <pipe1+0xac>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     6cc:	da00004e 	ble	80c <pipe1+0x168>
    close(fds[1]);
     6d0:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
    total = 0;
     6d4:	e1a05004 	mov	r5, r4
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
     6d8:	eb000be4 	bl	3670 <close>
    total = 0;
    cc = 1;
     6dc:	e3a06001 	mov	r6, #1
    while((n = read(fds[0], buf, cc)) > 0){
     6e0:	e3071fc8 	movw	r1, #32712	; 0x7fc8
     6e4:	e1a02006 	mov	r2, r6
     6e8:	e3401000 	movt	r1, #0
     6ec:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     6f0:	eb000bc4 	bl	3608 <read>
     6f4:	e3500000 	cmp	r0, #0
     6f8:	da00002d 	ble	7b4 <pipe1+0x110>
     6fc:	e3073fc7 	movw	r3, #32711	; 0x7fc7
     700:	e080c004 	add	ip, r0, r4
     704:	e3403000 	movt	r3, #0
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     708:	e5f31001 	ldrb	r1, [r3, #1]!
     70c:	e6ef2074 	uxtb	r2, r4
     710:	e2844001 	add	r4, r4, #1
     714:	e1510002 	cmp	r1, r2
     718:	1a000006 	bne	738 <pipe1+0x94>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     71c:	e15c0004 	cmp	ip, r4
     720:	1afffff8 	bne	708 <pipe1+0x64>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     724:	e1a06086 	lsl	r6, r6, #1
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     728:	e0855000 	add	r5, r5, r0
     72c:	e3560a02 	cmp	r6, #8192	; 0x2000
     730:	a3a06a02 	movge	r6, #8192	; 0x2000
     734:	eaffffe9 	b	6e0 <pipe1+0x3c>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     738:	e3041138 	movw	r1, #16696	; 0x4138
     73c:	e3a00001 	mov	r0, #1
     740:	e3401000 	movt	r1, #0
     744:	eb000cd3 	bl	3a98 <printf>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     748:	e24bd010 	sub	sp, fp, #16
     74c:	e8bd8870 	pop	{r4, r5, r6, fp, pc}
     750:	e30843d0 	movw	r4, #33744	; 0x83d0
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     754:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     758:	e3404000 	movt	r4, #0
     75c:	e3006409 	movw	r6, #1033	; 0x409
     760:	eb000bc2 	bl	3670 <close>
     764:	e3073fc7 	movw	r3, #32711	; 0x7fc7
     768:	e1a02005 	mov	r2, r5
     76c:	e3403000 	movt	r3, #0
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     770:	e5e32001 	strb	r2, [r3, #1]!
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     774:	e1540003 	cmp	r4, r3
     778:	e2822001 	add	r2, r2, #1
     77c:	1afffffb 	bne	770 <pipe1+0xcc>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     780:	e3071fc8 	movw	r1, #32712	; 0x7fc8
     784:	e3002409 	movw	r2, #1033	; 0x409
     788:	e3401000 	movt	r1, #0
     78c:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     790:	eb000ba9 	bl	363c <write>
     794:	e2855b01 	add	r5, r5, #1024	; 0x400
     798:	e2855009 	add	r5, r5, #9
     79c:	e1500006 	cmp	r0, r6
     7a0:	1a00001e 	bne	820 <pipe1+0x17c>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     7a4:	e301342d 	movw	r3, #5165	; 0x142d
     7a8:	e1550003 	cmp	r5, r3
     7ac:	1affffec 	bne	764 <pipe1+0xc0>
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
     7b0:	eb000b6d 	bl	356c <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     7b4:	e301342d 	movw	r3, #5165	; 0x142d
     7b8:	e1550003 	cmp	r5, r3
     7bc:	1a000007 	bne	7e0 <pipe1+0x13c>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     7c0:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     7c4:	eb000ba9 	bl	3670 <close>
    wait();
     7c8:	eb000b74 	bl	35a0 <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     7cc:	e3041160 	movw	r1, #16736	; 0x4160
     7d0:	e3401000 	movt	r1, #0
     7d4:	e3a00001 	mov	r0, #1
     7d8:	eb000cae 	bl	3a98 <printf>
     7dc:	eaffffd9 	b	748 <pipe1+0xa4>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     7e0:	e3041148 	movw	r1, #16712	; 0x4148
     7e4:	e1a02005 	mov	r2, r5
     7e8:	e3401000 	movt	r1, #0
     7ec:	e3a00001 	mov	r0, #1
     7f0:	eb000ca8 	bl	3a98 <printf>
     7f4:	eaffffed 	b	7b0 <pipe1+0x10c>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     7f8:	e3041118 	movw	r1, #16664	; 0x4118
     7fc:	e3a00001 	mov	r0, #1
     800:	e3401000 	movt	r1, #0
     804:	eb000ca3 	bl	3a98 <printf>
    exit();
     808:	eb000b57 	bl	356c <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     80c:	e304116c 	movw	r1, #16748	; 0x416c
     810:	e3a00001 	mov	r0, #1
     814:	e3401000 	movt	r1, #0
     818:	eb000c9e 	bl	3a98 <printf>
    exit();
     81c:	eb000b52 	bl	356c <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     820:	e3041128 	movw	r1, #16680	; 0x4128
     824:	e3a00001 	mov	r0, #1
     828:	e3401000 	movt	r1, #0
     82c:	eb000c99 	bl	3a98 <printf>
        exit();
     830:	eb000b4d 	bl	356c <exit>

00000834 <preempt>:
preempt(void)
{
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     834:	e304117c 	movw	r1, #16764	; 0x417c
     838:	e3a00001 	mov	r0, #1
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     83c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     840:	e3401000 	movt	r1, #0
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     844:	e28db014 	add	fp, sp, #20
     848:	e24dd008 	sub	sp, sp, #8
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     84c:	eb000c91 	bl	3a98 <printf>
  pid1 = fork();
     850:	eb000b38 	bl	3538 <fork>
  if(pid1 == 0)
     854:	e2507000 	subs	r7, r0, #0
     858:	1a000000 	bne	860 <preempt+0x2c>
     85c:	eafffffe 	b	85c <preempt+0x28>
    for(;;)
      ;

  pid2 = fork();
     860:	eb000b34 	bl	3538 <fork>
  if(pid2 == 0)
     864:	e2506000 	subs	r6, r0, #0
     868:	1a000000 	bne	870 <preempt+0x3c>
     86c:	eafffffe 	b	86c <preempt+0x38>
    for(;;)
      ;

  pipe(pfds);
     870:	e24b001c 	sub	r0, fp, #28
     874:	eb000b56 	bl	35d4 <pipe>
  pid3 = fork();
     878:	eb000b2e 	bl	3538 <fork>
  if(pid3 == 0){
     87c:	e2505000 	subs	r5, r0, #0
     880:	1a00000f 	bne	8c4 <preempt+0x90>
    close(pfds[0]);
     884:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     888:	eb000b78 	bl	3670 <close>
    if(write(pfds[1], "x", 1) != 1)
     88c:	e3041ae8 	movw	r1, #19176	; 0x4ae8
     890:	e3401000 	movt	r1, #0
     894:	e3a02001 	mov	r2, #1
     898:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     89c:	eb000b66 	bl	363c <write>
     8a0:	e3500001 	cmp	r0, #1
     8a4:	0a000003 	beq	8b8 <preempt+0x84>
      printf(1, "preempt write error");
     8a8:	e3041188 	movw	r1, #16776	; 0x4188
     8ac:	e3a00001 	mov	r0, #1
     8b0:	e3401000 	movt	r1, #0
     8b4:	eb000c77 	bl	3a98 <printf>
    close(pfds[1]);
     8b8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8bc:	eb000b6b 	bl	3670 <close>
     8c0:	eafffffe 	b	8c0 <preempt+0x8c>
    for(;;)
      ;
  }

  close(pfds[1]);
     8c4:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
     8c8:	eb000b68 	bl	3670 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     8cc:	e3071fc8 	movw	r1, #32712	; 0x7fc8
     8d0:	e3401000 	movt	r1, #0
     8d4:	e3a02a02 	mov	r2, #8192	; 0x2000
     8d8:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     8dc:	eb000b49 	bl	3608 <read>
     8e0:	e3500001 	cmp	r0, #1
     8e4:	e1a04000 	mov	r4, r0
     8e8:	0a000005 	beq	904 <preempt+0xd0>
    printf(1, "preempt read error");
     8ec:	e304119c 	movw	r1, #16796	; 0x419c
     8f0:	e3a00001 	mov	r0, #1
     8f4:	e3401000 	movt	r1, #0
     8f8:	eb000c66 	bl	3a98 <printf>
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     8fc:	e24bd014 	sub	sp, fp, #20
     900:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     904:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
     908:	eb000b58 	bl	3670 <close>
  printf(1, "kill... ");
     90c:	e30411b0 	movw	r1, #16816	; 0x41b0
     910:	e3401000 	movt	r1, #0
     914:	e1a00004 	mov	r0, r4
     918:	eb000c5e 	bl	3a98 <printf>
  kill(pid1);
     91c:	e1a00007 	mov	r0, r7
     920:	eb000b5f 	bl	36a4 <kill>
  kill(pid2);
     924:	e1a00006 	mov	r0, r6
     928:	eb000b5d 	bl	36a4 <kill>
  kill(pid3);
     92c:	e1a00005 	mov	r0, r5
     930:	eb000b5b 	bl	36a4 <kill>
  printf(1, "wait... ");
     934:	e30411bc 	movw	r1, #16828	; 0x41bc
     938:	e3401000 	movt	r1, #0
     93c:	e1a00004 	mov	r0, r4
     940:	eb000c54 	bl	3a98 <printf>
  wait();
     944:	eb000b15 	bl	35a0 <wait>
  wait();
     948:	eb000b14 	bl	35a0 <wait>
  wait();
     94c:	eb000b13 	bl	35a0 <wait>
  printf(1, "preempt ok\n");
     950:	e30411c8 	movw	r1, #16840	; 0x41c8
     954:	e1a00004 	mov	r0, r4
     958:	e3401000 	movt	r1, #0
     95c:	eb000c4d 	bl	3a98 <printf>
     960:	eaffffe5 	b	8fc <preempt+0xc8>

00000964 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     964:	e92d4830 	push	{r4, r5, fp, lr}
     968:	e3a04064 	mov	r4, #100	; 0x64
     96c:	e28db00c 	add	fp, sp, #12
     970:	ea000005 	b	98c <exitwait+0x28>
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     974:	0a000019 	beq	9e0 <exitwait+0x7c>
      if(wait() != pid){
     978:	eb000b08 	bl	35a0 <wait>
     97c:	e1550000 	cmp	r5, r0
     980:	1a00000a 	bne	9b0 <exitwait+0x4c>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     984:	e2544001 	subs	r4, r4, #1
     988:	0a00000e 	beq	9c8 <exitwait+0x64>
    pid = fork();
     98c:	eb000ae9 	bl	3538 <fork>
    if(pid < 0){
     990:	e2505000 	subs	r5, r0, #0
     994:	aafffff6 	bge	974 <exitwait+0x10>
      printf(1, "fork failed\n");
     998:	e3051714 	movw	r1, #22292	; 0x5714
     99c:	e3a00001 	mov	r0, #1
     9a0:	e3401000 	movt	r1, #0
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     9a4:	e24bd00c 	sub	sp, fp, #12
     9a8:	e8bd4830 	pop	{r4, r5, fp, lr}
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     9ac:	ea000c39 	b	3a98 <printf>
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     9b0:	e30411d4 	movw	r1, #16852	; 0x41d4
     9b4:	e3a00001 	mov	r0, #1
     9b8:	e3401000 	movt	r1, #0
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     9bc:	e24bd00c 	sub	sp, fp, #12
     9c0:	e8bd4830 	pop	{r4, r5, fp, lr}
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     9c4:	ea000c33 	b	3a98 <printf>
     9c8:	e30411e4 	movw	r1, #16868	; 0x41e4
     9cc:	e3a00001 	mov	r0, #1
     9d0:	e3401000 	movt	r1, #0
}
     9d4:	e24bd00c 	sub	sp, fp, #12
     9d8:	e8bd4830 	pop	{r4, r5, fp, lr}
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     9dc:	ea000c2d 	b	3a98 <printf>
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     9e0:	eb000ae1 	bl	356c <exit>

000009e4 <mem>:
mem(void)
{
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     9e4:	e30411f4 	movw	r1, #16884	; 0x41f4
     9e8:	e3a00001 	mov	r0, #1
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     9ec:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     9f0:	e3401000 	movt	r1, #0
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     9f4:	e28db014 	add	fp, sp, #20
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     9f8:	eb000c26 	bl	3a98 <printf>
  ppid = getpid();
     9fc:	eb000baa 	bl	38ac <getpid>
     a00:	e1a06000 	mov	r6, r0
  if((pid = fork()) == 0){
     a04:	eb000acb 	bl	3538 <fork>
     a08:	e3500000 	cmp	r0, #0
     a0c:	0a000001 	beq	a18 <mem+0x34>
     a10:	ea000016 	b	a70 <mem+0x8c>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     a14:	e5804000 	str	r4, [r0]
     a18:	e1a04000 	mov	r4, r0

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     a1c:	e3020711 	movw	r0, #10001	; 0x2711
     a20:	eb000ca9 	bl	3ccc <malloc>
     a24:	e3500000 	cmp	r0, #0
     a28:	1afffff9 	bne	a14 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     a2c:	e3540000 	cmp	r4, #0
     a30:	0a000004 	beq	a48 <mem+0x64>
      m2 = *(char**)m1;
     a34:	e5945000 	ldr	r5, [r4]
      free(m1);
     a38:	e1a00004 	mov	r0, r4
     a3c:	eb000c7b 	bl	3c30 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     a40:	e2554000 	subs	r4, r5, #0
     a44:	1afffffa 	bne	a34 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     a48:	e3a00a05 	mov	r0, #20480	; 0x5000
     a4c:	eb000c9e 	bl	3ccc <malloc>
    if(m1 == 0){
     a50:	e3500000 	cmp	r0, #0
     a54:	0a000008 	beq	a7c <mem+0x98>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     a58:	eb000c74 	bl	3c30 <free>
    printf(1, "mem ok\n");
     a5c:	e304121c 	movw	r1, #16924	; 0x421c
     a60:	e3401000 	movt	r1, #0
     a64:	e3a00001 	mov	r0, #1
     a68:	eb000c0a 	bl	3a98 <printf>
    exit();
     a6c:	eb000abe 	bl	356c <exit>
  } else {
    wait();
  }
}
     a70:	e24bd014 	sub	sp, fp, #20
     a74:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     a78:	ea000ac8 	b	35a0 <wait>
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     a7c:	e3041200 	movw	r1, #16896	; 0x4200
     a80:	e3a00001 	mov	r0, #1
     a84:	e3401000 	movt	r1, #0
     a88:	eb000c02 	bl	3a98 <printf>
      kill(ppid);
     a8c:	e1a00006 	mov	r0, r6
     a90:	eb000b03 	bl	36a4 <kill>
      exit();
     a94:	eb000ab4 	bl	356c <exit>

00000a98 <sharedfd>:
sharedfd(void)
{
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     a98:	e3041224 	movw	r1, #16932	; 0x4224
     a9c:	e3a00001 	mov	r0, #1

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     aa0:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     aa4:	e3401000 	movt	r1, #0

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     aa8:	e28db014 	add	fp, sp, #20
     aac:	e24dd010 	sub	sp, sp, #16
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     ab0:	eb000bf8 	bl	3a98 <printf>

  unlink("sharedfd");
     ab4:	e3040234 	movw	r0, #16948	; 0x4234
     ab8:	e3400000 	movt	r0, #0
     abc:	eb000b2c 	bl	3774 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ac0:	e3040234 	movw	r0, #16948	; 0x4234
     ac4:	e3400000 	movt	r0, #0
     ac8:	e3001202 	movw	r1, #514	; 0x202
     acc:	eb000b0e 	bl	370c <open>
  if(fd < 0){
     ad0:	e2505000 	subs	r5, r0, #0
     ad4:	ba000042 	blt	be4 <sharedfd+0x14c>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     ad8:	eb000a96 	bl	3538 <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     adc:	e3a0200a 	mov	r2, #10
     ae0:	e3a04ffa 	mov	r4, #1000	; 0x3e8
     ae4:	e3500000 	cmp	r0, #0
     ae8:	e1a06000 	mov	r6, r0
     aec:	e24b0020 	sub	r0, fp, #32
     af0:	03a01063 	moveq	r1, #99	; 0x63
     af4:	13a01070 	movne	r1, #112	; 0x70
     af8:	eb000a22 	bl	3388 <memset>
     afc:	ea000001 	b	b08 <sharedfd+0x70>
  for(i = 0; i < 1000; i++){
     b00:	e2544001 	subs	r4, r4, #1
     b04:	0a000009 	beq	b30 <sharedfd+0x98>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     b08:	e3a0200a 	mov	r2, #10
     b0c:	e24b1020 	sub	r1, fp, #32
     b10:	e1a00005 	mov	r0, r5
     b14:	eb000ac8 	bl	363c <write>
     b18:	e350000a 	cmp	r0, #10
     b1c:	0afffff7 	beq	b00 <sharedfd+0x68>
      printf(1, "fstests: write sharedfd failed\n");
     b20:	e304126c 	movw	r1, #17004	; 0x426c
     b24:	e3a00001 	mov	r0, #1
     b28:	e3401000 	movt	r1, #0
     b2c:	eb000bd9 	bl	3a98 <printf>
      break;
    }
  }
  if(pid == 0)
     b30:	e3560000 	cmp	r6, #0
     b34:	0a00003c 	beq	c2c <sharedfd+0x194>
    exit();
  else
    wait();
     b38:	eb000a98 	bl	35a0 <wait>
  close(fd);
     b3c:	e1a00005 	mov	r0, r5
     b40:	eb000aca 	bl	3670 <close>
  fd = open("sharedfd", 0);
     b44:	e3040234 	movw	r0, #16948	; 0x4234
     b48:	e3400000 	movt	r0, #0
     b4c:	e3a01000 	mov	r1, #0
     b50:	eb000aed 	bl	370c <open>
  if(fd < 0){
     b54:	e2507000 	subs	r7, r0, #0
     b58:	a24b4016 	subge	r4, fp, #22
     b5c:	a3a05000 	movge	r5, #0
     b60:	a1a06005 	movge	r6, r5
     b64:	ba000024 	blt	bfc <sharedfd+0x164>
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     b68:	e3a0200a 	mov	r2, #10
     b6c:	e24b1020 	sub	r1, fp, #32
     b70:	e1a00007 	mov	r0, r7
     b74:	eb000aa3 	bl	3608 <read>
     b78:	e3500000 	cmp	r0, #0
     b7c:	da000009 	ble	ba8 <sharedfd+0x110>
     b80:	e24b2020 	sub	r2, fp, #32
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
     b84:	e4d21001 	ldrb	r1, [r2], #1
     b88:	e3510063 	cmp	r1, #99	; 0x63
        nc++;
     b8c:	02866001 	addeq	r6, r6, #1
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
     b90:	0a000001 	beq	b9c <sharedfd+0x104>
        nc++;
      if(buf[i] == 'p')
     b94:	e3510070 	cmp	r1, #112	; 0x70
        np++;
     b98:	02855001 	addeq	r5, r5, #1
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     b9c:	e1540002 	cmp	r4, r2
     ba0:	1afffff7 	bne	b84 <sharedfd+0xec>
     ba4:	eaffffef 	b	b68 <sharedfd+0xd0>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     ba8:	e1a00007 	mov	r0, r7
     bac:	eb000aaf 	bl	3670 <close>
  unlink("sharedfd");
     bb0:	e3040234 	movw	r0, #16948	; 0x4234
     bb4:	e3400000 	movt	r0, #0
     bb8:	eb000aed 	bl	3774 <unlink>
  if(nc == 10000 && np == 10000){
     bbc:	e3023710 	movw	r3, #10000	; 0x2710
     bc0:	e1560003 	cmp	r6, r3
     bc4:	01550003 	cmpeq	r5, r3
     bc8:	1a000011 	bne	c14 <sharedfd+0x17c>
    printf(1, "sharedfd ok\n");
     bcc:	e30412b8 	movw	r1, #17080	; 0x42b8
     bd0:	e3a00001 	mov	r0, #1
     bd4:	e3401000 	movt	r1, #0
     bd8:	eb000bae 	bl	3a98 <printf>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     bdc:	e24bd014 	sub	sp, fp, #20
     be0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
     be4:	e3041240 	movw	r1, #16960	; 0x4240
     be8:	e3a00001 	mov	r0, #1
     bec:	e3401000 	movt	r1, #0
     bf0:	eb000ba8 	bl	3a98 <printf>
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     bf4:	e24bd014 	sub	sp, fp, #20
     bf8:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
     bfc:	e304128c 	movw	r1, #17036	; 0x428c
     c00:	e3a00001 	mov	r0, #1
     c04:	e3401000 	movt	r1, #0
     c08:	eb000ba2 	bl	3a98 <printf>
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     c0c:	e24bd014 	sub	sp, fp, #20
     c10:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     c14:	e30412c8 	movw	r1, #17096	; 0x42c8
     c18:	e1a03005 	mov	r3, r5
     c1c:	e1a02006 	mov	r2, r6
     c20:	e3401000 	movt	r1, #0
     c24:	e3a00001 	mov	r0, #1
     c28:	eb000b9a 	bl	3a98 <printf>
    exit();
     c2c:	eb000a4e 	bl	356c <exit>

00000c30 <twofiles>:
twofiles(void)
{
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     c30:	e30412e4 	movw	r1, #17124	; 0x42e4
     c34:	e3a00001 	mov	r0, #1

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     c38:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     c3c:	e3401000 	movt	r1, #0

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     c40:	e28db01c 	add	fp, sp, #28
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     c44:	eb000b93 	bl	3a98 <printf>

  unlink("f1");
     c48:	e30402f4 	movw	r0, #17140	; 0x42f4
     c4c:	e3400000 	movt	r0, #0
     c50:	eb000ac7 	bl	3774 <unlink>
  unlink("f2");
     c54:	e30402e0 	movw	r0, #17120	; 0x42e0
     c58:	e3400000 	movt	r0, #0
     c5c:	eb000ac4 	bl	3774 <unlink>

  pid = fork();
     c60:	eb000a34 	bl	3538 <fork>
  if(pid < 0){
     c64:	e2506000 	subs	r6, r0, #0
     c68:	ba00005e 	blt	de8 <twofiles+0x1b8>
    printf(1, "fork failed\n");
    exit();
  }

  fname = pid ? "f1" : "f2";
     c6c:	0a00004a 	beq	d9c <twofiles+0x16c>
  fd = open(fname, O_CREATE | O_RDWR);
     c70:	e30402f4 	movw	r0, #17140	; 0x42f4
     c74:	e3001202 	movw	r1, #514	; 0x202
     c78:	e3400000 	movt	r0, #0
     c7c:	eb000aa2 	bl	370c <open>
  if(fd < 0){
     c80:	e2504000 	subs	r4, r0, #0
     c84:	ba00005c 	blt	dfc <twofiles+0x1cc>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
     c88:	e3a01070 	mov	r1, #112	; 0x70
     c8c:	e3070fc8 	movw	r0, #32712	; 0x7fc8
     c90:	e3a02c02 	mov	r2, #512	; 0x200
     c94:	e3400000 	movt	r0, #0
     c98:	e3a0500c 	mov	r5, #12
     c9c:	eb0009b9 	bl	3388 <memset>
  for(i = 0; i < 12; i++){
    if((n = write(fd, buf, 500)) != 500){
     ca0:	e3071fc8 	movw	r1, #32712	; 0x7fc8
     ca4:	e3a02f7d 	mov	r2, #500	; 0x1f4
     ca8:	e3401000 	movt	r1, #0
     cac:	e1a00004 	mov	r0, r4
     cb0:	eb000a61 	bl	363c <write>
     cb4:	e3500f7d 	cmp	r0, #500	; 0x1f4
     cb8:	1a000044 	bne	dd0 <twofiles+0x1a0>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
     cbc:	e2555001 	subs	r5, r5, #1
     cc0:	1afffff6 	bne	ca0 <twofiles+0x70>
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
      exit();
    }
  }
  close(fd);
     cc4:	e1a00004 	mov	r0, r4
     cc8:	eb000a68 	bl	3670 <close>
  if(pid)
     ccc:	e3560000 	cmp	r6, #0
     cd0:	0a00003d 	beq	dcc <twofiles+0x19c>
    wait();
     cd4:	eb000a31 	bl	35a0 <wait>
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     cd8:	e3077fc8 	movw	r7, #32712	; 0x7fc8
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     cdc:	e30402e0 	movw	r0, #17120	; 0x42e0
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     ce0:	e3407000 	movt	r7, #0
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     ce4:	e3400000 	movt	r0, #0
     ce8:	e3a01000 	mov	r1, #0
    total = 0;
     cec:	e3a04000 	mov	r4, #0
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     cf0:	eb000a85 	bl	370c <open>
     cf4:	e3550000 	cmp	r5, #0
     cf8:	13a08070 	movne	r8, #112	; 0x70
     cfc:	03a08063 	moveq	r8, #99	; 0x63
     d00:	e1a06000 	mov	r6, r0
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     d04:	e3071fc8 	movw	r1, #32712	; 0x7fc8
     d08:	e3a02a02 	mov	r2, #8192	; 0x2000
     d0c:	e3401000 	movt	r1, #0
     d10:	e1a00006 	mov	r0, r6
     d14:	eb000a3b 	bl	3608 <read>
     d18:	e3500000 	cmp	r0, #0
     d1c:	da00000a 	ble	d4c <twofiles+0x11c>
     d20:	e2401001 	sub	r1, r0, #1
     d24:	e3073fc7 	movw	r3, #32711	; 0x7fc7
     d28:	e0811007 	add	r1, r1, r7
     d2c:	e3403000 	movt	r3, #0
      for(j = 0; j < n; j++){
        if(buf[j] != (i?'p':'c')){
     d30:	e5f32001 	ldrb	r2, [r3, #1]!
     d34:	e1580002 	cmp	r8, r2
     d38:	1a00001f 	bne	dbc <twofiles+0x18c>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
     d3c:	e1530001 	cmp	r3, r1
     d40:	1afffffa 	bne	d30 <twofiles+0x100>
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
     d44:	e0844000 	add	r4, r4, r0
     d48:	eaffffed 	b	d04 <twofiles+0xd4>
    }
    close(fd);
     d4c:	e1a00006 	mov	r0, r6
     d50:	eb000a46 	bl	3670 <close>
    if(total != 12*500){
     d54:	e3013770 	movw	r3, #6000	; 0x1770
     d58:	e1540003 	cmp	r4, r3
     d5c:	1a00002b 	bne	e10 <twofiles+0x1e0>
  if(pid)
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
     d60:	e2855001 	add	r5, r5, #1
     d64:	e30402f4 	movw	r0, #17140	; 0x42f4
     d68:	e3550002 	cmp	r5, #2
     d6c:	e3400000 	movt	r0, #0
     d70:	1affffdc 	bne	ce8 <twofiles+0xb8>
      printf(1, "wrong length %d\n", total);
      exit();
    }
  }

  unlink("f1");
     d74:	eb000a7e 	bl	3774 <unlink>
  unlink("f2");
     d78:	e30402e0 	movw	r0, #17120	; 0x42e0
     d7c:	e3400000 	movt	r0, #0
     d80:	eb000a7b 	bl	3774 <unlink>

  printf(1, "twofiles ok\n");
     d84:	e304133c 	movw	r1, #17212	; 0x433c
     d88:	e3401000 	movt	r1, #0
     d8c:	e3a00001 	mov	r0, #1
}
     d90:	e24bd01c 	sub	sp, fp, #28
     d94:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  }

  unlink("f1");
  unlink("f2");

  printf(1, "twofiles ok\n");
     d98:	ea000b3e 	b	3a98 <printf>
    printf(1, "fork failed\n");
    exit();
  }

  fname = pid ? "f1" : "f2";
  fd = open(fname, O_CREATE | O_RDWR);
     d9c:	e30402e0 	movw	r0, #17120	; 0x42e0
     da0:	e3001202 	movw	r1, #514	; 0x202
     da4:	e3400000 	movt	r0, #0
     da8:	eb000a57 	bl	370c <open>
  if(fd < 0){
     dac:	e2504000 	subs	r4, r0, #0
     db0:	ba000011 	blt	dfc <twofiles+0x1cc>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
     db4:	e3a01063 	mov	r1, #99	; 0x63
     db8:	eaffffb3 	b	c8c <twofiles+0x5c>
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
     dbc:	e304131c 	movw	r1, #17180	; 0x431c
     dc0:	e3a00001 	mov	r0, #1
     dc4:	e3401000 	movt	r1, #0
     dc8:	eb000b32 	bl	3a98 <printf>
          exit();
     dcc:	eb0009e6 	bl	356c <exit>
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
     dd0:	e3041308 	movw	r1, #17160	; 0x4308
     dd4:	e1a02000 	mov	r2, r0
     dd8:	e3401000 	movt	r1, #0
     ddc:	e3a00001 	mov	r0, #1
     de0:	eb000b2c 	bl	3a98 <printf>
      exit();
     de4:	eb0009e0 	bl	356c <exit>
  unlink("f1");
  unlink("f2");

  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
     de8:	e3051714 	movw	r1, #22292	; 0x5714
     dec:	e3a00001 	mov	r0, #1
     df0:	e3401000 	movt	r1, #0
     df4:	eb000b27 	bl	3a98 <printf>
    exit();
     df8:	eb0009db 	bl	356c <exit>
  }

  fname = pid ? "f1" : "f2";
  fd = open(fname, O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create failed\n");
     dfc:	e30412f8 	movw	r1, #17144	; 0x42f8
     e00:	e3a00001 	mov	r0, #1
     e04:	e3401000 	movt	r1, #0
     e08:	eb000b22 	bl	3a98 <printf>
    exit();
     e0c:	eb0009d6 	bl	356c <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
     e10:	e3041328 	movw	r1, #17192	; 0x4328
     e14:	e1a02004 	mov	r2, r4
     e18:	e3401000 	movt	r1, #0
     e1c:	e3a00001 	mov	r0, #1
     e20:	eb000b1c 	bl	3a98 <printf>
      exit();
     e24:	eb0009d0 	bl	356c <exit>

00000e28 <createdelete>:
{
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
     e28:	e304134c 	movw	r1, #17228	; 0x434c
     e2c:	e3a00001 	mov	r0, #1
}

// two processes create and delete different files in same directory
void
createdelete(void)
{
     e30:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
     e34:	e3401000 	movt	r1, #0
}

// two processes create and delete different files in same directory
void
createdelete(void)
{
     e38:	e28db018 	add	fp, sp, #24
     e3c:	e24dd024 	sub	sp, sp, #36	; 0x24
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
     e40:	eb000b14 	bl	3a98 <printf>
  pid = fork();
     e44:	eb0009bb 	bl	3538 <fork>
  if(pid < 0){
     e48:	e2506000 	subs	r6, r0, #0
     e4c:	ba000069 	blt	ff8 <createdelete+0x1d0>
    printf(1, "fork failed\n");
    exit();
  }

  name[0] = pid ? 'p' : 'c';
     e50:	03a03063 	moveq	r3, #99	; 0x63
     e54:	13a03070 	movne	r3, #112	; 0x70
  name[2] = '\0';
     e58:	e3a04000 	mov	r4, #0
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  name[0] = pid ? 'p' : 'c';
     e5c:	e54b303c 	strb	r3, [fp, #-60]	; 0xffffffc4
  name[2] = '\0';
     e60:	e54b403a 	strb	r4, [fp, #-58]	; 0xffffffc6
     e64:	e3a05001 	mov	r5, #1
     e68:	ea000003 	b	e7c <createdelete+0x54>
  for(i = 0; i < N; i++){
     e6c:	e3550014 	cmp	r5, #20
     e70:	0a000019 	beq	edc <createdelete+0xb4>
     e74:	e2844001 	add	r4, r4, #1
     e78:	e2855001 	add	r5, r5, #1
    name[1] = '0' + i;
    fd = open(name, O_CREATE | O_RDWR);
     e7c:	e3001202 	movw	r1, #514	; 0x202
     e80:	e24b003c 	sub	r0, fp, #60	; 0x3c
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
  for(i = 0; i < N; i++){
    name[1] = '0' + i;
     e84:	e2843030 	add	r3, r4, #48	; 0x30
     e88:	e54b303b 	strb	r3, [fp, #-59]	; 0xffffffc5
    fd = open(name, O_CREATE | O_RDWR);
     e8c:	eb000a1e 	bl	370c <open>
    if(fd < 0){
     e90:	e3500000 	cmp	r0, #0
     e94:	ba00004c 	blt	fcc <createdelete+0x1a4>
      printf(1, "create failed\n");
      exit();
    }
    close(fd);
     e98:	eb0009f4 	bl	3670 <close>
    if(i > 0 && (i % 2 ) == 0){
     e9c:	e3540000 	cmp	r4, #0
     ea0:	0afffff3 	beq	e74 <createdelete+0x4c>
     ea4:	e3140001 	tst	r4, #1
     ea8:	1affffef 	bne	e6c <createdelete+0x44>
      name[1] = '0' + (i / 2);
     eac:	e1a030c4 	asr	r3, r4, #1
      if(unlink(name) < 0){
     eb0:	e24b003c 	sub	r0, fp, #60	; 0x3c
      printf(1, "create failed\n");
      exit();
    }
    close(fd);
    if(i > 0 && (i % 2 ) == 0){
      name[1] = '0' + (i / 2);
     eb4:	e2833030 	add	r3, r3, #48	; 0x30
     eb8:	e54b303b 	strb	r3, [fp, #-59]	; 0xffffffc5
      if(unlink(name) < 0){
     ebc:	eb000a2c 	bl	3774 <unlink>
     ec0:	e3500000 	cmp	r0, #0
     ec4:	aaffffe8 	bge	e6c <createdelete+0x44>
        printf(1, "unlink failed\n");
     ec8:	e3041360 	movw	r1, #17248	; 0x4360
     ecc:	e3a00001 	mov	r0, #1
     ed0:	e3401000 	movt	r1, #0
     ed4:	eb000aef 	bl	3a98 <printf>
        exit();
     ed8:	eb0009a3 	bl	356c <exit>
      }
    }
  }

  if(pid==0)
     edc:	e3560000 	cmp	r6, #0
     ee0:	0a000043 	beq	ff4 <createdelete+0x1cc>
    exit();
  else
    wait();
     ee4:	eb0009ad 	bl	35a0 <wait>

  for(i = 0; i < N; i++){
     ee8:	e3a04000 	mov	r4, #0
    name[0] = 'p';
     eec:	e3a07070 	mov	r7, #112	; 0x70
      exit();
    }
    if(fd >= 0)
      close(fd);

    name[0] = 'c';
     ef0:	e3a06063 	mov	r6, #99	; 0x63
     ef4:	e2845030 	add	r5, r4, #48	; 0x30
    wait();

  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
    fd = open(name, 0);
     ef8:	e3a01000 	mov	r1, #0
     efc:	e24b003c 	sub	r0, fp, #60	; 0x3c
    exit();
  else
    wait();

  for(i = 0; i < N; i++){
    name[0] = 'p';
     f00:	e54b703c 	strb	r7, [fp, #-60]	; 0xffffffc4
     f04:	e6ef5075 	uxtb	r5, r5
    name[1] = '0' + i;
     f08:	e54b503b 	strb	r5, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
     f0c:	eb0009fe 	bl	370c <open>
    if((i == 0 || i >= N/2) && fd < 0){
     f10:	e3540009 	cmp	r4, #9
     f14:	d3a08000 	movle	r8, #0
     f18:	c3a08001 	movgt	r8, #1
     f1c:	e3540000 	cmp	r4, #0
     f20:	03888001 	orreq	r8, r8, #1
     f24:	e0181fa0 	ands	r1, r8, r0, lsr #31
     f28:	1a00002c 	bne	fe0 <createdelete+0x1b8>
      printf(1, "oops createdelete %s didn't exist\n", name);
      exit();
    } else if((i >= 1 && i < N/2) && fd >= 0){
     f2c:	e2442001 	sub	r2, r4, #1
     f30:	e3520008 	cmp	r2, #8
     f34:	9a000034 	bls	100c <createdelete+0x1e4>
      printf(1, "oops createdelete %s did exist\n", name);
      exit();
    }
    if(fd >= 0)
     f38:	e3500000 	cmp	r0, #0
     f3c:	ba000000 	blt	f44 <createdelete+0x11c>
      close(fd);
     f40:	eb0009ca 	bl	3670 <close>

    name[0] = 'c';
    name[1] = '0' + i;
    fd = open(name, 0);
     f44:	e3a01000 	mov	r1, #0
     f48:	e24b003c 	sub	r0, fp, #60	; 0x3c
      exit();
    }
    if(fd >= 0)
      close(fd);

    name[0] = 'c';
     f4c:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
    name[1] = '0' + i;
     f50:	e54b503b 	strb	r5, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
     f54:	eb0009ec 	bl	370c <open>
    if((i == 0 || i >= N/2) && fd < 0){
     f58:	e0182fa0 	ands	r2, r8, r0, lsr #31
    if(fd >= 0)
      close(fd);

    name[0] = 'c';
    name[1] = '0' + i;
    fd = open(name, 0);
     f5c:	e1a03000 	mov	r3, r0
    if((i == 0 || i >= N/2) && fd < 0){
     f60:	1a00001e 	bne	fe0 <createdelete+0x1b8>
      exit();
    } else if((i >= 1 && i < N/2) && fd >= 0){
      printf(1, "oops createdelete %s did exist\n", name);
      exit();
    }
    if(fd >= 0)
     f64:	e3530000 	cmp	r3, #0
     f68:	ba000000 	blt	f70 <createdelete+0x148>
      close(fd);
     f6c:	eb0009bf 	bl	3670 <close>
  if(pid==0)
    exit();
  else
    wait();

  for(i = 0; i < N; i++){
     f70:	e2844001 	add	r4, r4, #1
     f74:	e3540014 	cmp	r4, #20
     f78:	1affffdd 	bne	ef4 <createdelete+0xcc>
     f7c:	e3a04030 	mov	r4, #48	; 0x30
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    name[0] = 'p';
     f80:	e3a06070 	mov	r6, #112	; 0x70
    name[1] = '0' + i;
    unlink(name);
    name[0] = 'c';
     f84:	e3a05063 	mov	r5, #99	; 0x63
      close(fd);
  }

  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
     f88:	e54b403b 	strb	r4, [fp, #-59]	; 0xffffffc5
     f8c:	e2844001 	add	r4, r4, #1
    unlink(name);
     f90:	e24b003c 	sub	r0, fp, #60	; 0x3c
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    name[0] = 'p';
     f94:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
     f98:	e6ef4074 	uxtb	r4, r4
    name[1] = '0' + i;
    unlink(name);
     f9c:	eb0009f4 	bl	3774 <unlink>
    name[0] = 'c';
    unlink(name);
     fa0:	e24b003c 	sub	r0, fp, #60	; 0x3c

  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
    unlink(name);
    name[0] = 'c';
     fa4:	e54b503c 	strb	r5, [fp, #-60]	; 0xffffffc4
    unlink(name);
     fa8:	eb0009f1 	bl	3774 <unlink>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
     fac:	e3540044 	cmp	r4, #68	; 0x44
     fb0:	1afffff4 	bne	f88 <createdelete+0x160>
    unlink(name);
    name[0] = 'c';
    unlink(name);
  }

  printf(1, "createdelete ok\n");
     fb4:	e30413b4 	movw	r1, #17332	; 0x43b4
     fb8:	e3a00001 	mov	r0, #1
     fbc:	e3401000 	movt	r1, #0
     fc0:	eb000ab4 	bl	3a98 <printf>
}
     fc4:	e24bd018 	sub	sp, fp, #24
     fc8:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}
  name[2] = '\0';
  for(i = 0; i < N; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "create failed\n");
     fcc:	e30412f8 	movw	r1, #17144	; 0x42f8
     fd0:	e3a00001 	mov	r0, #1
     fd4:	e3401000 	movt	r1, #0
     fd8:	eb000aae 	bl	3a98 <printf>
      exit();
     fdc:	eb000962 	bl	356c <exit>
  for(i = 0; i < N; i++){
    name[0] = 'p';
    name[1] = '0' + i;
    fd = open(name, 0);
    if((i == 0 || i >= N/2) && fd < 0){
      printf(1, "oops createdelete %s didn't exist\n", name);
     fe0:	e3041370 	movw	r1, #17264	; 0x4370
     fe4:	e24b203c 	sub	r2, fp, #60	; 0x3c
     fe8:	e3401000 	movt	r1, #0
     fec:	e3a00001 	mov	r0, #1
     ff0:	eb000aa8 	bl	3a98 <printf>
      exit();
     ff4:	eb00095c 	bl	356c <exit>
  char name[32];

  printf(1, "createdelete test\n");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
     ff8:	e3051714 	movw	r1, #22292	; 0x5714
     ffc:	e3a00001 	mov	r0, #1
    1000:	e3401000 	movt	r1, #0
    1004:	eb000aa3 	bl	3a98 <printf>
    exit();
    1008:	eb000957 	bl	356c <exit>
    name[1] = '0' + i;
    fd = open(name, 0);
    if((i == 0 || i >= N/2) && fd < 0){
      printf(1, "oops createdelete %s didn't exist\n", name);
      exit();
    } else if((i >= 1 && i < N/2) && fd >= 0){
    100c:	e3500000 	cmp	r0, #0
    1010:	aa000007 	bge	1034 <createdelete+0x20c>
    if(fd >= 0)
      close(fd);

    name[0] = 'c';
    name[1] = '0' + i;
    fd = open(name, 0);
    1014:	e24b003c 	sub	r0, fp, #60	; 0x3c
      exit();
    }
    if(fd >= 0)
      close(fd);

    name[0] = 'c';
    1018:	e54b603c 	strb	r6, [fp, #-60]	; 0xffffffc4
    name[1] = '0' + i;
    101c:	e54b503b 	strb	r5, [fp, #-59]	; 0xffffffc5
    fd = open(name, 0);
    1020:	eb0009b9 	bl	370c <open>
    if((i == 0 || i >= N/2) && fd < 0){
    1024:	e0183fa0 	ands	r3, r8, r0, lsr #31
    1028:	1affffec 	bne	fe0 <createdelete+0x1b8>
      printf(1, "oops createdelete %s didn't exist\n", name);
      exit();
    } else if((i >= 1 && i < N/2) && fd >= 0){
    102c:	e3500000 	cmp	r0, #0
    1030:	baffffce 	blt	f70 <createdelete+0x148>
    fd = open(name, 0);
    if((i == 0 || i >= N/2) && fd < 0){
      printf(1, "oops createdelete %s didn't exist\n", name);
      exit();
    } else if((i >= 1 && i < N/2) && fd >= 0){
      printf(1, "oops createdelete %s did exist\n", name);
    1034:	e3041394 	movw	r1, #17300	; 0x4394
    1038:	e24b203c 	sub	r2, fp, #60	; 0x3c
    103c:	e3401000 	movt	r1, #0
    1040:	e3a00001 	mov	r0, #1
    1044:	eb000a93 	bl	3a98 <printf>
      exit();
    1048:	eb000947 	bl	356c <exit>

0000104c <unlinkread>:
void
unlinkread(void)
{
  int fd, fd1;

  printf(1, "unlinkread test\n");
    104c:	e30413c8 	movw	r1, #17352	; 0x43c8
    1050:	e3a00001 	mov	r0, #1
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1054:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1058:	e3401000 	movt	r1, #0
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    105c:	e28db014 	add	fp, sp, #20
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1060:	eb000a8c 	bl	3a98 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1064:	e30403dc 	movw	r0, #17372	; 0x43dc
    1068:	e3400000 	movt	r0, #0
    106c:	e3001202 	movw	r1, #514	; 0x202
    1070:	eb0009a5 	bl	370c <open>
  if(fd < 0){
    1074:	e2504000 	subs	r4, r0, #0
    1078:	ba000037 	blt	115c <unlinkread+0x110>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    107c:	e3041404 	movw	r1, #17412	; 0x4404
    1080:	e3a02005 	mov	r2, #5
    1084:	e3401000 	movt	r1, #0
    1088:	eb00096b 	bl	363c <write>
  close(fd);
    108c:	e1a00004 	mov	r0, r4
    1090:	eb000976 	bl	3670 <close>

  fd = open("unlinkread", O_RDWR);
    1094:	e30403dc 	movw	r0, #17372	; 0x43dc
    1098:	e3400000 	movt	r0, #0
    109c:	e3a01002 	mov	r1, #2
    10a0:	eb000999 	bl	370c <open>
  if(fd < 0){
    10a4:	e2505000 	subs	r5, r0, #0
    10a8:	ba000044 	blt	11c0 <unlinkread+0x174>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    10ac:	e30403dc 	movw	r0, #17372	; 0x43dc
    10b0:	e3400000 	movt	r0, #0
    10b4:	eb0009ae 	bl	3774 <unlink>
    10b8:	e3500000 	cmp	r0, #0
    10bc:	1a00003a 	bne	11ac <unlinkread+0x160>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    10c0:	e30403dc 	movw	r0, #17372	; 0x43dc
    10c4:	e3001202 	movw	r1, #514	; 0x202
    10c8:	e3400000 	movt	r0, #0
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    10cc:	e3074fc8 	movw	r4, #32712	; 0x7fc8
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    10d0:	eb00098d 	bl	370c <open>
  write(fd1, "yyy", 3);
    10d4:	e3041440 	movw	r1, #17472	; 0x4440
    10d8:	e3a02003 	mov	r2, #3
    10dc:	e3401000 	movt	r1, #0
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    10e0:	e3404000 	movt	r4, #0
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    10e4:	e1a06000 	mov	r6, r0
  write(fd1, "yyy", 3);
    10e8:	eb000953 	bl	363c <write>
  close(fd1);
    10ec:	e1a00006 	mov	r0, r6
    10f0:	eb00095e 	bl	3670 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    10f4:	e1a01004 	mov	r1, r4
    10f8:	e3a02a02 	mov	r2, #8192	; 0x2000
    10fc:	e1a00005 	mov	r0, r5
    1100:	eb000940 	bl	3608 <read>
    1104:	e3500005 	cmp	r0, #5
    1108:	1a000022 	bne	1198 <unlinkread+0x14c>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    110c:	e5d43000 	ldrb	r3, [r4]
    1110:	e3530068 	cmp	r3, #104	; 0x68
    1114:	1a00001a 	bne	1184 <unlinkread+0x138>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    1118:	e1a01004 	mov	r1, r4
    111c:	e3a0200a 	mov	r2, #10
    1120:	e1a00005 	mov	r0, r5
    1124:	eb000944 	bl	363c <write>
    1128:	e350000a 	cmp	r0, #10
    112c:	1a00000f 	bne	1170 <unlinkread+0x124>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    1130:	e1a00005 	mov	r0, r5
    1134:	eb00094d 	bl	3670 <close>
  unlink("unlinkread");
    1138:	e30403dc 	movw	r0, #17372	; 0x43dc
    113c:	e3400000 	movt	r0, #0
    1140:	eb00098b 	bl	3774 <unlink>
  printf(1, "unlinkread ok\n");
    1144:	e3041490 	movw	r1, #17552	; 0x4490
    1148:	e3401000 	movt	r1, #0
    114c:	e3a00001 	mov	r0, #1
}
    1150:	e24bd014 	sub	sp, fp, #20
    1154:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
  unlink("unlinkread");
  printf(1, "unlinkread ok\n");
    1158:	ea000a4e 	b	3a98 <printf>
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    115c:	e30413e8 	movw	r1, #17384	; 0x43e8
    1160:	e3a00001 	mov	r0, #1
    1164:	e3401000 	movt	r1, #0
    1168:	eb000a4a 	bl	3a98 <printf>
    exit();
    116c:	eb0008fe 	bl	356c <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1170:	e3041474 	movw	r1, #17524	; 0x4474
    1174:	e3a00001 	mov	r0, #1
    1178:	e3401000 	movt	r1, #0
    117c:	eb000a45 	bl	3a98 <printf>
    exit();
    1180:	eb0008f9 	bl	356c <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    1184:	e304145c 	movw	r1, #17500	; 0x445c
    1188:	e3a00001 	mov	r0, #1
    118c:	e3401000 	movt	r1, #0
    1190:	eb000a40 	bl	3a98 <printf>
    exit();
    1194:	eb0008f4 	bl	356c <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    1198:	e3041444 	movw	r1, #17476	; 0x4444
    119c:	e3a00001 	mov	r0, #1
    11a0:	e3401000 	movt	r1, #0
    11a4:	eb000a3b 	bl	3a98 <printf>
    exit();
    11a8:	eb0008ef 	bl	356c <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    11ac:	e3041424 	movw	r1, #17444	; 0x4424
    11b0:	e3a00001 	mov	r0, #1
    11b4:	e3401000 	movt	r1, #0
    11b8:	eb000a36 	bl	3a98 <printf>
    exit();
    11bc:	eb0008ea 	bl	356c <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    11c0:	e304140c 	movw	r1, #17420	; 0x440c
    11c4:	e3a00001 	mov	r0, #1
    11c8:	e3401000 	movt	r1, #0
    11cc:	eb000a31 	bl	3a98 <printf>
    exit();
    11d0:	eb0008e5 	bl	356c <exit>

000011d4 <linktest>:
void
linktest(void)
{
  int fd;

  printf(1, "linktest\n");
    11d4:	e30414a0 	movw	r1, #17568	; 0x44a0
    11d8:	e3a00001 	mov	r0, #1
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    11dc:	e92d4830 	push	{r4, r5, fp, lr}
  int fd;

  printf(1, "linktest\n");
    11e0:	e3401000 	movt	r1, #0
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    11e4:	e28db00c 	add	fp, sp, #12
  int fd;

  printf(1, "linktest\n");
    11e8:	eb000a2a 	bl	3a98 <printf>

  unlink("lf1");
    11ec:	e30404ac 	movw	r0, #17580	; 0x44ac
    11f0:	e3400000 	movt	r0, #0
    11f4:	eb00095e 	bl	3774 <unlink>
  unlink("lf2");
    11f8:	e30404b0 	movw	r0, #17584	; 0x44b0
    11fc:	e3400000 	movt	r0, #0
    1200:	eb00095b 	bl	3774 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    1204:	e30404ac 	movw	r0, #17580	; 0x44ac
    1208:	e3400000 	movt	r0, #0
    120c:	e3001202 	movw	r1, #514	; 0x202
    1210:	eb00093d 	bl	370c <open>
  if(fd < 0){
    1214:	e2504000 	subs	r4, r0, #0
    1218:	ba000042 	blt	1328 <linktest+0x154>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    121c:	e3041404 	movw	r1, #17412	; 0x4404
    1220:	e3a02005 	mov	r2, #5
    1224:	e3401000 	movt	r1, #0
    1228:	eb000903 	bl	363c <write>
    122c:	e3500005 	cmp	r0, #5
    1230:	1a000064 	bne	13c8 <linktest+0x1f4>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    1234:	e1a00004 	mov	r0, r4
    1238:	eb00090c 	bl	3670 <close>

  if(link("lf1", "lf2") < 0){
    123c:	e30414b0 	movw	r1, #17584	; 0x44b0
    1240:	e30404ac 	movw	r0, #17580	; 0x44ac
    1244:	e3401000 	movt	r1, #0
    1248:	e3400000 	movt	r0, #0
    124c:	eb000962 	bl	37dc <link>
    1250:	e3500000 	cmp	r0, #0
    1254:	ba000056 	blt	13b4 <linktest+0x1e0>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    1258:	e30404ac 	movw	r0, #17580	; 0x44ac
    125c:	e3400000 	movt	r0, #0
    1260:	eb000943 	bl	3774 <unlink>

  if(open("lf1", 0) >= 0){
    1264:	e30404ac 	movw	r0, #17580	; 0x44ac
    1268:	e3400000 	movt	r0, #0
    126c:	e3a01000 	mov	r1, #0
    1270:	eb000925 	bl	370c <open>
    1274:	e3500000 	cmp	r0, #0
    1278:	aa000048 	bge	13a0 <linktest+0x1cc>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    127c:	e30404b0 	movw	r0, #17584	; 0x44b0
    1280:	e3a01000 	mov	r1, #0
    1284:	e3400000 	movt	r0, #0
    1288:	eb00091f 	bl	370c <open>
  if(fd < 0){
    128c:	e2504000 	subs	r4, r0, #0
    1290:	ba00003d 	blt	138c <linktest+0x1b8>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    1294:	e3071fc8 	movw	r1, #32712	; 0x7fc8
    1298:	e3a02a02 	mov	r2, #8192	; 0x2000
    129c:	e3401000 	movt	r1, #0
    12a0:	eb0008d8 	bl	3608 <read>
    12a4:	e3500005 	cmp	r0, #5
    12a8:	1a000032 	bne	1378 <linktest+0x1a4>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    12ac:	e1a00004 	mov	r0, r4
    12b0:	eb0008ee 	bl	3670 <close>

  if(link("lf2", "lf2") >= 0){
    12b4:	e30414b0 	movw	r1, #17584	; 0x44b0
    12b8:	e3401000 	movt	r1, #0
    12bc:	e1a00001 	mov	r0, r1
    12c0:	eb000945 	bl	37dc <link>
    12c4:	e3500000 	cmp	r0, #0
    12c8:	aa000025 	bge	1364 <linktest+0x190>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    12cc:	e30404b0 	movw	r0, #17584	; 0x44b0
    12d0:	e3400000 	movt	r0, #0
    12d4:	eb000926 	bl	3774 <unlink>
  if(link("lf2", "lf1") >= 0){
    12d8:	e30414ac 	movw	r1, #17580	; 0x44ac
    12dc:	e30404b0 	movw	r0, #17584	; 0x44b0
    12e0:	e3401000 	movt	r1, #0
    12e4:	e3400000 	movt	r0, #0
    12e8:	eb00093b 	bl	37dc <link>
    12ec:	e3500000 	cmp	r0, #0
    12f0:	aa000016 	bge	1350 <linktest+0x17c>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    12f4:	e30414ac 	movw	r1, #17580	; 0x44ac
    12f8:	e3040588 	movw	r0, #17800	; 0x4588
    12fc:	e3401000 	movt	r1, #0
    1300:	e3400000 	movt	r0, #0
    1304:	eb000934 	bl	37dc <link>
    1308:	e3500000 	cmp	r0, #0
    130c:	aa00000a 	bge	133c <linktest+0x168>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    1310:	e30415a8 	movw	r1, #17832	; 0x45a8
    1314:	e3a00001 	mov	r0, #1
    1318:	e3401000 	movt	r1, #0
}
    131c:	e24bd00c 	sub	sp, fp, #12
    1320:	e8bd4830 	pop	{r4, r5, fp, lr}
  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    1324:	ea0009db 	b	3a98 <printf>
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    1328:	e30414b4 	movw	r1, #17588	; 0x44b4
    132c:	e3a00001 	mov	r0, #1
    1330:	e3401000 	movt	r1, #0
    1334:	eb0009d7 	bl	3a98 <printf>
    exit();
    1338:	eb00088b 	bl	356c <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    133c:	e304158c 	movw	r1, #17804	; 0x458c
    1340:	e3a00001 	mov	r0, #1
    1344:	e3401000 	movt	r1, #0
    1348:	eb0009d2 	bl	3a98 <printf>
    exit();
    134c:	eb000886 	bl	356c <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    1350:	e3041564 	movw	r1, #17764	; 0x4564
    1354:	e3a00001 	mov	r0, #1
    1358:	e3401000 	movt	r1, #0
    135c:	eb0009cd 	bl	3a98 <printf>
    exit();
    1360:	eb000881 	bl	356c <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1364:	e3041544 	movw	r1, #17732	; 0x4544
    1368:	e3a00001 	mov	r0, #1
    136c:	e3401000 	movt	r1, #0
    1370:	eb0009c8 	bl	3a98 <printf>
    exit();
    1374:	eb00087c 	bl	356c <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    1378:	e3041530 	movw	r1, #17712	; 0x4530
    137c:	e3a00001 	mov	r0, #1
    1380:	e3401000 	movt	r1, #0
    1384:	eb0009c3 	bl	3a98 <printf>
    exit();
    1388:	eb000877 	bl	356c <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    138c:	e304151c 	movw	r1, #17692	; 0x451c
    1390:	e3a00001 	mov	r0, #1
    1394:	e3401000 	movt	r1, #0
    1398:	eb0009be 	bl	3a98 <printf>
    exit();
    139c:	eb000872 	bl	356c <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    13a0:	e30414f4 	movw	r1, #17652	; 0x44f4
    13a4:	e3a00001 	mov	r0, #1
    13a8:	e3401000 	movt	r1, #0
    13ac:	eb0009b9 	bl	3a98 <printf>
    exit();
    13b0:	eb00086d 	bl	356c <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    13b4:	e30414dc 	movw	r1, #17628	; 0x44dc
    13b8:	e3a00001 	mov	r0, #1
    13bc:	e3401000 	movt	r1, #0
    13c0:	eb0009b4 	bl	3a98 <printf>
    exit();
    13c4:	eb000868 	bl	356c <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    13c8:	e30414c8 	movw	r1, #17608	; 0x44c8
    13cc:	e3a00001 	mov	r0, #1
    13d0:	e3401000 	movt	r1, #0
    13d4:	eb0009af 	bl	3a98 <printf>
    exit();
    13d8:	eb000863 	bl	356c <exit>

000013dc <concreate>:
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    13dc:	e30415b8 	movw	r1, #17848	; 0x45b8
    13e0:	e3a00001 	mov	r0, #1
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    13e4:	e92d4870 	push	{r4, r5, r6, fp, lr}
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    13e8:	e3401000 	movt	r1, #0
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    13ec:	e28db010 	add	fp, sp, #16
    13f0:	e24dd044 	sub	sp, sp, #68	; 0x44
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    13f4:	e3055556 	movw	r5, #21846	; 0x5556
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    13f8:	eb0009a6 	bl	3a98 <printf>
  file[0] = 'C';
  file[2] = '\0';
    13fc:	e3a03000 	mov	r3, #0
  for(i = 0; i < 40; i++){
    1400:	e1a04003 	mov	r4, r3
    char name[14];
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
    1404:	e54b304e 	strb	r3, [fp, #-78]	; 0xffffffb2
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    1408:	e3455555 	movt	r5, #21845	; 0x5555
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
    140c:	e3a03043 	mov	r3, #67	; 0x43
    1410:	e54b3050 	strb	r3, [fp, #-80]	; 0xffffffb0
    1414:	ea00000f 	b	1458 <concreate+0x7c>
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    1418:	e0c32594 	smull	r2, r3, r4, r5
    141c:	e0433fc4 	sub	r3, r3, r4, asr #31
    1420:	e0833083 	add	r3, r3, r3, lsl #1
    1424:	e0633004 	rsb	r3, r3, r4
    1428:	e3530001 	cmp	r3, #1
    142c:	0a000029 	beq	14d8 <concreate+0xfc>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1430:	e3001202 	movw	r1, #514	; 0x202
    1434:	e24b0050 	sub	r0, fp, #80	; 0x50
    1438:	eb0008b3 	bl	370c <open>
      if(fd < 0){
    143c:	e3500000 	cmp	r0, #0
    1440:	ba000019 	blt	14ac <concreate+0xd0>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1444:	e2844001 	add	r4, r4, #1
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1448:	eb000888 	bl	3670 <close>
    }
    if(pid == 0)
      exit();
    else
      wait();
    144c:	eb000853 	bl	35a0 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1450:	e3540028 	cmp	r4, #40	; 0x28
    1454:	0a000027 	beq	14f8 <concreate+0x11c>
    file[1] = '0' + i;
    unlink(file);
    1458:	e24b0050 	sub	r0, fp, #80	; 0x50

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    145c:	e2843030 	add	r3, r4, #48	; 0x30
    1460:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    unlink(file);
    1464:	eb0008c2 	bl	3774 <unlink>
    pid = fork();
    1468:	eb000832 	bl	3538 <fork>
    if(pid && (i % 3) == 1){
    146c:	e3500000 	cmp	r0, #0
    1470:	1affffe8 	bne	1418 <concreate+0x3c>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1474:	e3060667 	movw	r0, #26215	; 0x6667
    1478:	e1a02fc4 	asr	r2, r4, #31
    147c:	e3460666 	movt	r0, #26214	; 0x6666
    1480:	e0c10094 	smull	r0, r1, r4, r0
    1484:	e06220c1 	rsb	r2, r2, r1, asr #1
    1488:	e0822102 	add	r2, r2, r2, lsl #2
    148c:	e0624004 	rsb	r4, r2, r4
    1490:	e3540001 	cmp	r4, #1
    1494:	0a00000a 	beq	14c4 <concreate+0xe8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1498:	e3001202 	movw	r1, #514	; 0x202
    149c:	e24b0050 	sub	r0, fp, #80	; 0x50
    14a0:	eb000899 	bl	370c <open>
      if(fd < 0){
    14a4:	e3500000 	cmp	r0, #0
    14a8:	aa00008c 	bge	16e0 <concreate+0x304>
        printf(1, "concreate create %s failed\n", file);
    14ac:	e30415cc 	movw	r1, #17868	; 0x45cc
    14b0:	e24b2050 	sub	r2, fp, #80	; 0x50
    14b4:	e3401000 	movt	r1, #0
    14b8:	e3a00001 	mov	r0, #1
    14bc:	eb000975 	bl	3a98 <printf>
        exit();
    14c0:	eb000829 	bl	356c <exit>
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    14c4:	e30405c8 	movw	r0, #17864	; 0x45c8
    14c8:	e24b1050 	sub	r1, fp, #80	; 0x50
    14cc:	e3400000 	movt	r0, #0
    14d0:	eb0008c1 	bl	37dc <link>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
    14d4:	eb000824 	bl	356c <exit>
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    14d8:	e30405c8 	movw	r0, #17864	; 0x45c8
    14dc:	e24b1050 	sub	r1, fp, #80	; 0x50
    14e0:	e3400000 	movt	r0, #0
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    14e4:	e2844001 	add	r4, r4, #1
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    14e8:	eb0008bb 	bl	37dc <link>
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    14ec:	eb00082b 	bl	35a0 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    14f0:	e3540028 	cmp	r4, #40	; 0x28
    14f4:	1affffd7 	bne	1458 <concreate+0x7c>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    14f8:	e1a02004 	mov	r2, r4
    14fc:	e3a01000 	mov	r1, #0
    1500:	e24b003c 	sub	r0, fp, #60	; 0x3c
  fd = open(".", 0);
  n = 0;
    1504:	e1a05001 	mov	r5, r1
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1508:	eb00079e 	bl	3388 <memset>
  fd = open(".", 0);
    150c:	e3040588 	movw	r0, #17800	; 0x4588
    1510:	e3400000 	movt	r0, #0
    1514:	e1a01005 	mov	r1, r5
    1518:	eb00087b 	bl	370c <open>
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    151c:	e3a06001 	mov	r6, #1
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    1520:	e1a04000 	mov	r4, r0
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1524:	e3a02010 	mov	r2, #16
    1528:	e24b104c 	sub	r1, fp, #76	; 0x4c
    152c:	e1a00004 	mov	r0, r4
    1530:	eb000834 	bl	3608 <read>
    1534:	e3500000 	cmp	r0, #0
    1538:	da000014 	ble	1590 <concreate+0x1b4>
    if(de.inum == 0)
    153c:	e15b34bc 	ldrh	r3, [fp, #-76]	; 0xffffffb4
    1540:	e3530000 	cmp	r3, #0
    1544:	0afffff6 	beq	1524 <concreate+0x148>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1548:	e55b304a 	ldrb	r3, [fp, #-74]	; 0xffffffb6
    154c:	e3530043 	cmp	r3, #67	; 0x43
    1550:	1afffff3 	bne	1524 <concreate+0x148>
    1554:	e55b3048 	ldrb	r3, [fp, #-72]	; 0xffffffb8
    1558:	e3530000 	cmp	r3, #0
    155c:	1afffff0 	bne	1524 <concreate+0x148>
      i = de.name[1] - '0';
    1560:	e55b3049 	ldrb	r3, [fp, #-73]	; 0xffffffb7
    1564:	e2433030 	sub	r3, r3, #48	; 0x30
      if(i < 0 || i >= sizeof(fa)){
    1568:	e3530027 	cmp	r3, #39	; 0x27
    156c:	8a000055 	bhi	16c8 <concreate+0x2ec>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    1570:	e24b2014 	sub	r2, fp, #20
    1574:	e0823003 	add	r3, r2, r3
    1578:	e5532028 	ldrb	r2, [r3, #-40]	; 0xffffffd8
    157c:	e3520000 	cmp	r2, #0
    1580:	1a00004a 	bne	16b0 <concreate+0x2d4>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
      n++;
    1584:	e2855001 	add	r5, r5, #1
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1588:	e5436028 	strb	r6, [r3, #-40]	; 0xffffffd8
    158c:	eaffffe4 	b	1524 <concreate+0x148>
      n++;
    }
  }
  close(fd);
    1590:	e1a00004 	mov	r0, r4
    1594:	eb000835 	bl	3670 <close>

  if(n != 40){
    1598:	e3550028 	cmp	r5, #40	; 0x28
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    159c:	03056556 	movweq	r6, #21846	; 0x5556
    15a0:	03a04000 	moveq	r4, #0
    15a4:	03456555 	movteq	r6, #21845	; 0x5555
      n++;
    }
  }
  close(fd);

  if(n != 40){
    15a8:	0a000016 	beq	1608 <concreate+0x22c>
    15ac:	ea00003a 	b	169c <concreate+0x2c0>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
      close(open(file, 0));
    15b0:	e3a01000 	mov	r1, #0
    15b4:	e24b0050 	sub	r0, fp, #80	; 0x50
    15b8:	eb000853 	bl	370c <open>
    15bc:	eb00082b 	bl	3670 <close>
      close(open(file, 0));
    15c0:	e3a01000 	mov	r1, #0
    15c4:	e24b0050 	sub	r0, fp, #80	; 0x50
    15c8:	eb00084f 	bl	370c <open>
    15cc:	eb000827 	bl	3670 <close>
      close(open(file, 0));
    15d0:	e3a01000 	mov	r1, #0
    15d4:	e24b0050 	sub	r0, fp, #80	; 0x50
    15d8:	eb00084b 	bl	370c <open>
    15dc:	eb000823 	bl	3670 <close>
      close(open(file, 0));
    15e0:	e3a01000 	mov	r1, #0
    15e4:	e24b0050 	sub	r0, fp, #80	; 0x50
    15e8:	eb000847 	bl	370c <open>
    15ec:	eb00081f 	bl	3670 <close>
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    15f0:	e3550000 	cmp	r5, #0
    15f4:	0affffb6 	beq	14d4 <concreate+0xf8>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    15f8:	e2844001 	add	r4, r4, #1
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    15fc:	eb0007e7 	bl	35a0 <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1600:	e3540028 	cmp	r4, #40	; 0x28
    1604:	0a000019 	beq	1670 <concreate+0x294>
    file[1] = '0' + i;
    1608:	e2843030 	add	r3, r4, #48	; 0x30
    160c:	e54b304f 	strb	r3, [fp, #-79]	; 0xffffffb1
    pid = fork();
    1610:	eb0007c8 	bl	3538 <fork>
    if(pid < 0){
    1614:	e2505000 	subs	r5, r0, #0
    1618:	ba00001a 	blt	1688 <concreate+0x2ac>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    161c:	e0c32694 	smull	r2, r3, r4, r6
    1620:	e0433fc4 	sub	r3, r3, r4, asr #31
    1624:	e0833083 	add	r3, r3, r3, lsl #1
    1628:	e0633004 	rsb	r3, r3, r4
    162c:	e1952003 	orrs	r2, r5, r3
    1630:	0affffde 	beq	15b0 <concreate+0x1d4>
       ((i % 3) == 1 && pid != 0)){
    1634:	e2952000 	adds	r2, r5, #0
    1638:	13a02001 	movne	r2, #1
    163c:	e3530001 	cmp	r3, #1
    1640:	13a02000 	movne	r2, #0
    1644:	e3520000 	cmp	r2, #0
    1648:	1affffd8 	bne	15b0 <concreate+0x1d4>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    164c:	e24b0050 	sub	r0, fp, #80	; 0x50
    1650:	eb000847 	bl	3774 <unlink>
      unlink(file);
    1654:	e24b0050 	sub	r0, fp, #80	; 0x50
    1658:	eb000845 	bl	3774 <unlink>
      unlink(file);
    165c:	e24b0050 	sub	r0, fp, #80	; 0x50
    1660:	eb000843 	bl	3774 <unlink>
      unlink(file);
    1664:	e24b0050 	sub	r0, fp, #80	; 0x50
    1668:	eb000841 	bl	3774 <unlink>
    166c:	eaffffdf 	b	15f0 <concreate+0x214>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1670:	e3041658 	movw	r1, #18008	; 0x4658
    1674:	e3a00001 	mov	r0, #1
    1678:	e3401000 	movt	r1, #0
    167c:	eb000905 	bl	3a98 <printf>
}
    1680:	e24bd010 	sub	sp, fp, #16
    1684:	e8bd8870 	pop	{r4, r5, r6, fp, pc}

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1688:	e3051714 	movw	r1, #22292	; 0x5714
    168c:	e3a00001 	mov	r0, #1
    1690:	e3401000 	movt	r1, #0
    1694:	eb0008ff 	bl	3a98 <printf>
      exit();
    1698:	eb0007b3 	bl	356c <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    169c:	e3041624 	movw	r1, #17956	; 0x4624
    16a0:	e3a00001 	mov	r0, #1
    16a4:	e3401000 	movt	r1, #0
    16a8:	eb0008fa 	bl	3a98 <printf>
    exit();
    16ac:	eb0007ae 	bl	356c <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    16b0:	e3041604 	movw	r1, #17924	; 0x4604
    16b4:	e24b204a 	sub	r2, fp, #74	; 0x4a
    16b8:	e3401000 	movt	r1, #0
    16bc:	e3a00001 	mov	r0, #1
    16c0:	eb0008f4 	bl	3a98 <printf>
        exit();
    16c4:	eb0007a8 	bl	356c <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    16c8:	e30415e8 	movw	r1, #17896	; 0x45e8
    16cc:	e24b204a 	sub	r2, fp, #74	; 0x4a
    16d0:	e3401000 	movt	r1, #0
    16d4:	e3a00001 	mov	r0, #1
    16d8:	eb0008ee 	bl	3a98 <printf>
    16dc:	eaffff7c 	b	14d4 <concreate+0xf8>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    16e0:	eb0007e2 	bl	3670 <close>
    16e4:	eaffff7a 	b	14d4 <concreate+0xf8>

000016e8 <linkunlink>:
void
linkunlink()
{
  int pid, i;

  printf(1, "linkunlink test\n");
    16e8:	e3041668 	movw	r1, #18024	; 0x4668
    16ec:	e3a00001 	mov	r0, #1

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    16f0:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  int pid, i;

  printf(1, "linkunlink test\n");
    16f4:	e3401000 	movt	r1, #0

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    16f8:	e28db01c 	add	fp, sp, #28
  int pid, i;

  printf(1, "linkunlink test\n");
    16fc:	eb0008e5 	bl	3a98 <printf>

  unlink("x");
    1700:	e3040ae8 	movw	r0, #19176	; 0x4ae8
    1704:	e3400000 	movt	r0, #0
    1708:	eb000819 	bl	3774 <unlink>
  pid = fork();
    170c:	eb000789 	bl	3538 <fork>
  if(pid < 0){
    1710:	e2507000 	subs	r7, r0, #0
    1714:	ba00002c 	blt	17cc <linkunlink+0xe4>
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    1718:	e3046e6d 	movw	r6, #20077	; 0x4e6d
    if((x % 3) == 0){
    171c:	e30a5aab 	movw	r5, #43691	; 0xaaab
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1720:	13a04001 	movne	r4, #1
    1724:	03a04061 	moveq	r4, #97	; 0x61
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    1728:	e34461c6 	movt	r6, #16838	; 0x41c6
    if((x % 3) == 0){
    172c:	e34a5aaa 	movt	r5, #43690	; 0xaaaa
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1730:	e3a08064 	mov	r8, #100	; 0x64
    1734:	ea000006 	b	1754 <linkunlink+0x6c>
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1738:	e3530001 	cmp	r3, #1
    173c:	0a00001c 	beq	17b4 <linkunlink+0xcc>
      link("cat", "x");
    } else {
      unlink("x");
    1740:	e3040ae8 	movw	r0, #19176	; 0x4ae8
    1744:	e3400000 	movt	r0, #0
    1748:	eb000809 	bl	3774 <unlink>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    174c:	e2588001 	subs	r8, r8, #1
    1750:	0a00000e 	beq	1790 <linkunlink+0xa8>
    x = x * 1103515245 + 12345;
    1754:	e0040496 	mul	r4, r6, r4
    1758:	e2844a03 	add	r4, r4, #12288	; 0x3000
    175c:	e2844039 	add	r4, r4, #57	; 0x39
    if((x % 3) == 0){
    1760:	e0832594 	umull	r2, r3, r4, r5
    1764:	e1a030a3 	lsr	r3, r3, #1
    1768:	e0833083 	add	r3, r3, r3, lsl #1
    176c:	e0543003 	subs	r3, r4, r3
    1770:	1afffff0 	bne	1738 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1774:	e3040ae8 	movw	r0, #19176	; 0x4ae8
    1778:	e3001202 	movw	r1, #514	; 0x202
    177c:	e3400000 	movt	r0, #0
    1780:	eb0007e1 	bl	370c <open>
    1784:	eb0007b9 	bl	3670 <close>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1788:	e2588001 	subs	r8, r8, #1
    178c:	1afffff0 	bne	1754 <linkunlink+0x6c>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1790:	e3570000 	cmp	r7, #0
    1794:	0a000011 	beq	17e0 <linkunlink+0xf8>
    wait();
    1798:	eb000780 	bl	35a0 <wait>
  else 
    exit();

  printf(1, "linkunlink ok\n");
    179c:	e3041680 	movw	r1, #18048	; 0x4680
    17a0:	e3401000 	movt	r1, #0
    17a4:	e3a00001 	mov	r0, #1
}
    17a8:	e24bd01c 	sub	sp, fp, #28
    17ac:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
  if(pid)
    wait();
  else 
    exit();

  printf(1, "linkunlink ok\n");
    17b0:	ea0008b8 	b	3a98 <printf>
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    17b4:	e3041ae8 	movw	r1, #19176	; 0x4ae8
    17b8:	e304067c 	movw	r0, #18044	; 0x467c
    17bc:	e3401000 	movt	r1, #0
    17c0:	e3400000 	movt	r0, #0
    17c4:	eb000804 	bl	37dc <link>
    17c8:	eaffffdf 	b	174c <linkunlink+0x64>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    17cc:	e3051714 	movw	r1, #22292	; 0x5714
    17d0:	e3a00001 	mov	r0, #1
    17d4:	e3401000 	movt	r1, #0
    17d8:	eb0008ae 	bl	3a98 <printf>
    exit();
    17dc:	eb000762 	bl	356c <exit>
  }

  if(pid)
    wait();
  else 
    exit();
    17e0:	eb000761 	bl	356c <exit>

000017e4 <bigdir>:
bigdir(void)
{
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    17e4:	e3041690 	movw	r1, #18064	; 0x4690
    17e8:	e3a00001 	mov	r0, #1
}

// directory that uses indirect blocks
void
bigdir(void)
{
    17ec:	e92d4870 	push	{r4, r5, r6, fp, lr}
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    17f0:	e3401000 	movt	r1, #0
}

// directory that uses indirect blocks
void
bigdir(void)
{
    17f4:	e28db010 	add	fp, sp, #16
    17f8:	e24dd014 	sub	sp, sp, #20
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    17fc:	eb0008a5 	bl	3a98 <printf>
  unlink("bd");
    1800:	e30406a0 	movw	r0, #18080	; 0x46a0
    1804:	e3400000 	movt	r0, #0
    1808:	eb0007d9 	bl	3774 <unlink>

  fd = open("bd", O_CREATE);
    180c:	e30406a0 	movw	r0, #18080	; 0x46a0
    1810:	e3400000 	movt	r0, #0
    1814:	e3a01c02 	mov	r1, #512	; 0x200
    1818:	eb0007bb 	bl	370c <open>
  if(fd < 0){
    181c:	e3500000 	cmp	r0, #0
    1820:	ba000039 	blt	190c <bigdir+0x128>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1824:	eb000791 	bl	3670 <close>

  for(i = 0; i < 500; i++){
    1828:	e3a06000 	mov	r6, #0
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    182c:	e1a05006 	mov	r5, r6
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1830:	e3a04078 	mov	r4, #120	; 0x78
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1834:	e30406a0 	movw	r0, #18080	; 0x46a0
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1838:	e1a02346 	asr	r2, r6, #6
    name[2] = '0' + (i % 64);
    183c:	e206303f 	and	r3, r6, #63	; 0x3f
    name[3] = '\0';
    if(link("bd", name) != 0){
    1840:	e3400000 	movt	r0, #0
    1844:	e24b1020 	sub	r1, fp, #32
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    1848:	e2833030 	add	r3, r3, #48	; 0x30
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    184c:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    1850:	e54b301e 	strb	r3, [fp, #-30]	; 0xffffffe2
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1854:	e54b4020 	strb	r4, [fp, #-32]	; 0xffffffe0
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1858:	e54b501d 	strb	r5, [fp, #-29]	; 0xffffffe3
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    185c:	e54b201f 	strb	r2, [fp, #-31]	; 0xffffffe1
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1860:	eb0007dd 	bl	37dc <link>
    1864:	e2503000 	subs	r3, r0, #0
    1868:	1a00001d 	bne	18e4 <bigdir+0x100>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    186c:	e2866001 	add	r6, r6, #1
    1870:	e3560f7d 	cmp	r6, #500	; 0x1f4
    1874:	1affffee 	bne	1834 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1878:	e30406a0 	movw	r0, #18080	; 0x46a0
  for(i = 0; i < 500; i++){
    187c:	e1a04003 	mov	r4, r3
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1880:	e3400000 	movt	r0, #0
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1884:	e1a06003 	mov	r6, r3
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1888:	eb0007b9 	bl	3774 <unlink>
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    188c:	e3a05078 	mov	r5, #120	; 0x78
    name[1] = '0' + (i / 64);
    1890:	e1a02344 	asr	r2, r4, #6
    name[2] = '0' + (i % 64);
    1894:	e204303f 	and	r3, r4, #63	; 0x3f
    name[3] = '\0';
    if(unlink(name) != 0){
    1898:	e24b0020 	sub	r0, fp, #32
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    189c:	e2822030 	add	r2, r2, #48	; 0x30
    name[2] = '0' + (i % 64);
    18a0:	e2833030 	add	r3, r3, #48	; 0x30
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    18a4:	e54b5020 	strb	r5, [fp, #-32]	; 0xffffffe0
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    18a8:	e54b601d 	strb	r6, [fp, #-29]	; 0xffffffe3
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    18ac:	e54b201f 	strb	r2, [fp, #-31]	; 0xffffffe1
    name[2] = '0' + (i % 64);
    18b0:	e54b301e 	strb	r3, [fp, #-30]	; 0xffffffe2
    name[3] = '\0';
    if(unlink(name) != 0){
    18b4:	eb0007ae 	bl	3774 <unlink>
    18b8:	e3500000 	cmp	r0, #0
    18bc:	1a00000d 	bne	18f8 <bigdir+0x114>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    18c0:	e2844001 	add	r4, r4, #1
    18c4:	e3540f7d 	cmp	r4, #500	; 0x1f4
    18c8:	1afffff0 	bne	1890 <bigdir+0xac>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    18cc:	e30416e8 	movw	r1, #18152	; 0x46e8
    18d0:	e3a00001 	mov	r0, #1
    18d4:	e3401000 	movt	r1, #0
    18d8:	eb00086e 	bl	3a98 <printf>
}
    18dc:	e24bd010 	sub	sp, fp, #16
    18e0:	e8bd8870 	pop	{r4, r5, r6, fp, pc}
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    18e4:	e30416bc 	movw	r1, #18108	; 0x46bc
    18e8:	e3a00001 	mov	r0, #1
    18ec:	e3401000 	movt	r1, #0
    18f0:	eb000868 	bl	3a98 <printf>
      exit();
    18f4:	eb00071c 	bl	356c <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    18f8:	e30416d0 	movw	r1, #18128	; 0x46d0
    18fc:	e3a00001 	mov	r0, #1
    1900:	e3401000 	movt	r1, #0
    1904:	eb000863 	bl	3a98 <printf>
      exit();
    1908:	eb000717 	bl	356c <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    190c:	e30416a4 	movw	r1, #18084	; 0x46a4
    1910:	e3a00001 	mov	r0, #1
    1914:	e3401000 	movt	r1, #0
    1918:	eb00085e 	bl	3a98 <printf>
    exit();
    191c:	eb000712 	bl	356c <exit>

00001920 <subdir>:
void
subdir(void)
{
  int fd, cc;

  printf(1, "subdir test\n");
    1920:	e30416f4 	movw	r1, #18164	; 0x46f4
    1924:	e3a00001 	mov	r0, #1
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1928:	e92d4830 	push	{r4, r5, fp, lr}
  int fd, cc;

  printf(1, "subdir test\n");
    192c:	e3401000 	movt	r1, #0
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1930:	e28db00c 	add	fp, sp, #12
  int fd, cc;

  printf(1, "subdir test\n");
    1934:	eb000857 	bl	3a98 <printf>

  unlink("ff");
    1938:	e30407fc 	movw	r0, #18428	; 0x47fc
    193c:	e3400000 	movt	r0, #0
    1940:	eb00078b 	bl	3774 <unlink>
  if(mkdir("dd") != 0){
    1944:	e30408a8 	movw	r0, #18600	; 0x48a8
    1948:	e3400000 	movt	r0, #0
    194c:	eb0007af 	bl	3810 <mkdir>
    1950:	e3500000 	cmp	r0, #0
    1954:	1a000150 	bne	1e9c <subdir+0x57c>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1958:	e304071c 	movw	r0, #18204	; 0x471c
    195c:	e3001202 	movw	r1, #514	; 0x202
    1960:	e3400000 	movt	r0, #0
    1964:	eb000768 	bl	370c <open>
  if(fd < 0){
    1968:	e2504000 	subs	r4, r0, #0
    196c:	ba000145 	blt	1e88 <subdir+0x568>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1970:	e30417fc 	movw	r1, #18428	; 0x47fc
    1974:	e3a02002 	mov	r2, #2
    1978:	e3401000 	movt	r1, #0
    197c:	eb00072e 	bl	363c <write>
  close(fd);
    1980:	e1a00004 	mov	r0, r4
    1984:	eb000739 	bl	3670 <close>
  
  if(unlink("dd") >= 0){
    1988:	e30408a8 	movw	r0, #18600	; 0x48a8
    198c:	e3400000 	movt	r0, #0
    1990:	eb000777 	bl	3774 <unlink>
    1994:	e3500000 	cmp	r0, #0
    1998:	aa000135 	bge	1e74 <subdir+0x554>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    199c:	e3040764 	movw	r0, #18276	; 0x4764
    19a0:	e3400000 	movt	r0, #0
    19a4:	eb000799 	bl	3810 <mkdir>
    19a8:	e2504000 	subs	r4, r0, #0
    19ac:	1a00012b 	bne	1e60 <subdir+0x540>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    19b0:	e3040788 	movw	r0, #18312	; 0x4788
    19b4:	e3001202 	movw	r1, #514	; 0x202
    19b8:	e3400000 	movt	r0, #0
    19bc:	eb000752 	bl	370c <open>
  if(fd < 0){
    19c0:	e2505000 	subs	r5, r0, #0
    19c4:	ba0000ee 	blt	1d84 <subdir+0x464>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    19c8:	e30417ac 	movw	r1, #18348	; 0x47ac
    19cc:	e3a02002 	mov	r2, #2
    19d0:	e3401000 	movt	r1, #0
    19d4:	eb000718 	bl	363c <write>
  close(fd);
    19d8:	e1a00005 	mov	r0, r5
    19dc:	eb000723 	bl	3670 <close>

  fd = open("dd/dd/../ff", 0);
    19e0:	e30407b0 	movw	r0, #18352	; 0x47b0
    19e4:	e1a01004 	mov	r1, r4
    19e8:	e3400000 	movt	r0, #0
    19ec:	eb000746 	bl	370c <open>
  if(fd < 0){
    19f0:	e2505000 	subs	r5, r0, #0
    19f4:	ba0000dd 	blt	1d70 <subdir+0x450>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    19f8:	e3074fc8 	movw	r4, #32712	; 0x7fc8
    19fc:	e3a02a02 	mov	r2, #8192	; 0x2000
    1a00:	e3404000 	movt	r4, #0
    1a04:	e1a01004 	mov	r1, r4
    1a08:	eb0006fe 	bl	3608 <read>
  if(cc != 2 || buf[0] != 'f'){
    1a0c:	e3500002 	cmp	r0, #2
    1a10:	1a0000b3 	bne	1ce4 <subdir+0x3c4>
    1a14:	e5d43000 	ldrb	r3, [r4]
    1a18:	e3530066 	cmp	r3, #102	; 0x66
    1a1c:	1a0000b0 	bne	1ce4 <subdir+0x3c4>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1a20:	e1a00005 	mov	r0, r5
    1a24:	eb000711 	bl	3670 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1a28:	e30417f4 	movw	r1, #18420	; 0x47f4
    1a2c:	e3040788 	movw	r0, #18312	; 0x4788
    1a30:	e3401000 	movt	r1, #0
    1a34:	e3400000 	movt	r0, #0
    1a38:	eb000767 	bl	37dc <link>
    1a3c:	e3500000 	cmp	r0, #0
    1a40:	1a0000d9 	bne	1dac <subdir+0x48c>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1a44:	e3040788 	movw	r0, #18312	; 0x4788
    1a48:	e3400000 	movt	r0, #0
    1a4c:	eb000748 	bl	3774 <unlink>
    1a50:	e3500000 	cmp	r0, #0
    1a54:	1a0000ac 	bne	1d0c <subdir+0x3ec>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1a58:	e3040788 	movw	r0, #18312	; 0x4788
    1a5c:	e3a01000 	mov	r1, #0
    1a60:	e3400000 	movt	r0, #0
    1a64:	eb000728 	bl	370c <open>
    1a68:	e3500000 	cmp	r0, #0
    1a6c:	aa0000f6 	bge	1e4c <subdir+0x52c>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1a70:	e30408a8 	movw	r0, #18600	; 0x48a8
    1a74:	e3400000 	movt	r0, #0
    1a78:	eb000771 	bl	3844 <chdir>
    1a7c:	e3500000 	cmp	r0, #0
    1a80:	1a0000ec 	bne	1e38 <subdir+0x518>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1a84:	e3040874 	movw	r0, #18548	; 0x4874
    1a88:	e3400000 	movt	r0, #0
    1a8c:	eb00076c 	bl	3844 <chdir>
    1a90:	e3500000 	cmp	r0, #0
    1a94:	1a000097 	bne	1cf8 <subdir+0x3d8>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1a98:	e304089c 	movw	r0, #18588	; 0x489c
    1a9c:	e3400000 	movt	r0, #0
    1aa0:	eb000767 	bl	3844 <chdir>
    1aa4:	e3500000 	cmp	r0, #0
    1aa8:	1a000092 	bne	1cf8 <subdir+0x3d8>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1aac:	e30408ac 	movw	r0, #18604	; 0x48ac
    1ab0:	e3400000 	movt	r0, #0
    1ab4:	eb000762 	bl	3844 <chdir>
    1ab8:	e2504000 	subs	r4, r0, #0
    1abc:	1a0000b5 	bne	1d98 <subdir+0x478>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ac0:	e30407f4 	movw	r0, #18420	; 0x47f4
    1ac4:	e1a01004 	mov	r1, r4
    1ac8:	e3400000 	movt	r0, #0
    1acc:	eb00070e 	bl	370c <open>
  if(fd < 0){
    1ad0:	e2505000 	subs	r5, r0, #0
    1ad4:	ba00012c 	blt	1f8c <subdir+0x66c>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1ad8:	e3071fc8 	movw	r1, #32712	; 0x7fc8
    1adc:	e3a02a02 	mov	r2, #8192	; 0x2000
    1ae0:	e3401000 	movt	r1, #0
    1ae4:	eb0006c7 	bl	3608 <read>
    1ae8:	e3500002 	cmp	r0, #2
    1aec:	1a000121 	bne	1f78 <subdir+0x658>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1af0:	e1a00005 	mov	r0, r5
    1af4:	eb0006dd 	bl	3670 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1af8:	e3040788 	movw	r0, #18312	; 0x4788
    1afc:	e1a01004 	mov	r1, r4
    1b00:	e3400000 	movt	r0, #0
    1b04:	eb000700 	bl	370c <open>
    1b08:	e3500000 	cmp	r0, #0
    1b0c:	aa000088 	bge	1d34 <subdir+0x414>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1b10:	e3040924 	movw	r0, #18724	; 0x4924
    1b14:	e3001202 	movw	r1, #514	; 0x202
    1b18:	e3400000 	movt	r0, #0
    1b1c:	eb0006fa 	bl	370c <open>
    1b20:	e3500000 	cmp	r0, #0
    1b24:	aa00007d 	bge	1d20 <subdir+0x400>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1b28:	e304094c 	movw	r0, #18764	; 0x494c
    1b2c:	e3001202 	movw	r1, #514	; 0x202
    1b30:	e3400000 	movt	r0, #0
    1b34:	eb0006f4 	bl	370c <open>
    1b38:	e3500000 	cmp	r0, #0
    1b3c:	aa0000b8 	bge	1e24 <subdir+0x504>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1b40:	e30408a8 	movw	r0, #18600	; 0x48a8
    1b44:	e3a01c02 	mov	r1, #512	; 0x200
    1b48:	e3400000 	movt	r0, #0
    1b4c:	eb0006ee 	bl	370c <open>
    1b50:	e3500000 	cmp	r0, #0
    1b54:	aa0000ad 	bge	1e10 <subdir+0x4f0>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1b58:	e30408a8 	movw	r0, #18600	; 0x48a8
    1b5c:	e3a01002 	mov	r1, #2
    1b60:	e3400000 	movt	r0, #0
    1b64:	eb0006e8 	bl	370c <open>
    1b68:	e3500000 	cmp	r0, #0
    1b6c:	aa0000a2 	bge	1dfc <subdir+0x4dc>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1b70:	e30408a8 	movw	r0, #18600	; 0x48a8
    1b74:	e3a01001 	mov	r1, #1
    1b78:	e3400000 	movt	r0, #0
    1b7c:	eb0006e2 	bl	370c <open>
    1b80:	e3500000 	cmp	r0, #0
    1b84:	aa000097 	bge	1de8 <subdir+0x4c8>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1b88:	e30419c4 	movw	r1, #18884	; 0x49c4
    1b8c:	e3040924 	movw	r0, #18724	; 0x4924
    1b90:	e3401000 	movt	r1, #0
    1b94:	e3400000 	movt	r0, #0
    1b98:	eb00070f 	bl	37dc <link>
    1b9c:	e3500000 	cmp	r0, #0
    1ba0:	0a00008b 	beq	1dd4 <subdir+0x4b4>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1ba4:	e30419c4 	movw	r1, #18884	; 0x49c4
    1ba8:	e304094c 	movw	r0, #18764	; 0x494c
    1bac:	e3401000 	movt	r1, #0
    1bb0:	e3400000 	movt	r0, #0
    1bb4:	eb000708 	bl	37dc <link>
    1bb8:	e3500000 	cmp	r0, #0
    1bbc:	0a00007f 	beq	1dc0 <subdir+0x4a0>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1bc0:	e30417f4 	movw	r1, #18420	; 0x47f4
    1bc4:	e304071c 	movw	r0, #18204	; 0x471c
    1bc8:	e3401000 	movt	r1, #0
    1bcc:	e3400000 	movt	r0, #0
    1bd0:	eb000701 	bl	37dc <link>
    1bd4:	e3500000 	cmp	r0, #0
    1bd8:	0a00005f 	beq	1d5c <subdir+0x43c>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    1bdc:	e3040924 	movw	r0, #18724	; 0x4924
    1be0:	e3400000 	movt	r0, #0
    1be4:	eb000709 	bl	3810 <mkdir>
    1be8:	e3500000 	cmp	r0, #0
    1bec:	0a000055 	beq	1d48 <subdir+0x428>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    1bf0:	e304094c 	movw	r0, #18764	; 0x494c
    1bf4:	e3400000 	movt	r0, #0
    1bf8:	eb000704 	bl	3810 <mkdir>
    1bfc:	e3500000 	cmp	r0, #0
    1c00:	0a0000d7 	beq	1f64 <subdir+0x644>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    1c04:	e30407f4 	movw	r0, #18420	; 0x47f4
    1c08:	e3400000 	movt	r0, #0
    1c0c:	eb0006ff 	bl	3810 <mkdir>
    1c10:	e3500000 	cmp	r0, #0
    1c14:	0a0000cd 	beq	1f50 <subdir+0x630>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    1c18:	e304094c 	movw	r0, #18764	; 0x494c
    1c1c:	e3400000 	movt	r0, #0
    1c20:	eb0006d3 	bl	3774 <unlink>
    1c24:	e3500000 	cmp	r0, #0
    1c28:	0a0000c3 	beq	1f3c <subdir+0x61c>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    1c2c:	e3040924 	movw	r0, #18724	; 0x4924
    1c30:	e3400000 	movt	r0, #0
    1c34:	eb0006ce 	bl	3774 <unlink>
    1c38:	e3500000 	cmp	r0, #0
    1c3c:	0a0000b9 	beq	1f28 <subdir+0x608>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    1c40:	e304071c 	movw	r0, #18204	; 0x471c
    1c44:	e3400000 	movt	r0, #0
    1c48:	eb0006fd 	bl	3844 <chdir>
    1c4c:	e3500000 	cmp	r0, #0
    1c50:	0a0000af 	beq	1f14 <subdir+0x5f4>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    1c54:	e3040ae4 	movw	r0, #19172	; 0x4ae4
    1c58:	e3400000 	movt	r0, #0
    1c5c:	eb0006f8 	bl	3844 <chdir>
    1c60:	e3500000 	cmp	r0, #0
    1c64:	0a0000a5 	beq	1f00 <subdir+0x5e0>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    1c68:	e30407f4 	movw	r0, #18420	; 0x47f4
    1c6c:	e3400000 	movt	r0, #0
    1c70:	eb0006bf 	bl	3774 <unlink>
    1c74:	e3500000 	cmp	r0, #0
    1c78:	1a000023 	bne	1d0c <subdir+0x3ec>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    1c7c:	e304071c 	movw	r0, #18204	; 0x471c
    1c80:	e3400000 	movt	r0, #0
    1c84:	eb0006ba 	bl	3774 <unlink>
    1c88:	e3500000 	cmp	r0, #0
    1c8c:	1a000096 	bne	1eec <subdir+0x5cc>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    1c90:	e30408a8 	movw	r0, #18600	; 0x48a8
    1c94:	e3400000 	movt	r0, #0
    1c98:	eb0006b5 	bl	3774 <unlink>
    1c9c:	e3500000 	cmp	r0, #0
    1ca0:	0a00008c 	beq	1ed8 <subdir+0x5b8>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    1ca4:	e3040b3c 	movw	r0, #19260	; 0x4b3c
    1ca8:	e3400000 	movt	r0, #0
    1cac:	eb0006b0 	bl	3774 <unlink>
    1cb0:	e3500000 	cmp	r0, #0
    1cb4:	ba000082 	blt	1ec4 <subdir+0x5a4>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    1cb8:	e30408a8 	movw	r0, #18600	; 0x48a8
    1cbc:	e3400000 	movt	r0, #0
    1cc0:	eb0006ab 	bl	3774 <unlink>
    1cc4:	e3500000 	cmp	r0, #0
    1cc8:	ba000078 	blt	1eb0 <subdir+0x590>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    1ccc:	e3041b70 	movw	r1, #19312	; 0x4b70
    1cd0:	e3a00001 	mov	r0, #1
    1cd4:	e3401000 	movt	r1, #0
}
    1cd8:	e24bd00c 	sub	sp, fp, #12
    1cdc:	e8bd4830 	pop	{r4, r5, fp, lr}
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    1ce0:	ea00076c 	b	3a98 <printf>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    1ce4:	e30417d8 	movw	r1, #18392	; 0x47d8
    1ce8:	e3a00001 	mov	r0, #1
    1cec:	e3401000 	movt	r1, #0
    1cf0:	eb000768 	bl	3a98 <printf>
    exit();
    1cf4:	eb00061c 	bl	356c <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    1cf8:	e3041880 	movw	r1, #18560	; 0x4880
    1cfc:	e3a00001 	mov	r0, #1
    1d00:	e3401000 	movt	r1, #0
    1d04:	eb000763 	bl	3a98 <printf>
    exit();
    1d08:	eb000617 	bl	356c <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    1d0c:	e3041824 	movw	r1, #18468	; 0x4824
    1d10:	e3a00001 	mov	r0, #1
    1d14:	e3401000 	movt	r1, #0
    1d18:	eb00075e 	bl	3a98 <printf>
    exit();
    1d1c:	eb000612 	bl	356c <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    1d20:	e3041930 	movw	r1, #18736	; 0x4930
    1d24:	e3a00001 	mov	r0, #1
    1d28:	e3401000 	movt	r1, #0
    1d2c:	eb000759 	bl	3a98 <printf>
    exit();
    1d30:	eb00060d 	bl	356c <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    1d34:	e30418fc 	movw	r1, #18684	; 0x48fc
    1d38:	e3a00001 	mov	r0, #1
    1d3c:	e3401000 	movt	r1, #0
    1d40:	eb000754 	bl	3a98 <printf>
    exit();
    1d44:	eb000608 	bl	356c <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    1d48:	e3041a3c 	movw	r1, #19004	; 0x4a3c
    1d4c:	e3a00001 	mov	r0, #1
    1d50:	e3401000 	movt	r1, #0
    1d54:	eb00074f 	bl	3a98 <printf>
    exit();
    1d58:	eb000603 	bl	356c <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    1d5c:	e3041a18 	movw	r1, #18968	; 0x4a18
    1d60:	e3a00001 	mov	r0, #1
    1d64:	e3401000 	movt	r1, #0
    1d68:	eb00074a 	bl	3a98 <printf>
    exit();
    1d6c:	eb0005fe 	bl	356c <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    1d70:	e30417bc 	movw	r1, #18364	; 0x47bc
    1d74:	e3a00001 	mov	r0, #1
    1d78:	e3401000 	movt	r1, #0
    1d7c:	eb000745 	bl	3a98 <printf>
    exit();
    1d80:	eb0005f9 	bl	356c <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    1d84:	e3041794 	movw	r1, #18324	; 0x4794
    1d88:	e3a00001 	mov	r0, #1
    1d8c:	e3401000 	movt	r1, #0
    1d90:	eb000740 	bl	3a98 <printf>
    exit();
    1d94:	eb0005f4 	bl	356c <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    1d98:	e30418b4 	movw	r1, #18612	; 0x48b4
    1d9c:	e3a00001 	mov	r0, #1
    1da0:	e3401000 	movt	r1, #0
    1da4:	eb00073b 	bl	3a98 <printf>
    exit();
    1da8:	eb0005ef 	bl	356c <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1dac:	e3041800 	movw	r1, #18432	; 0x4800
    1db0:	e3a00001 	mov	r0, #1
    1db4:	e3401000 	movt	r1, #0
    1db8:	eb000736 	bl	3a98 <printf>
    exit();
    1dbc:	eb0005ea 	bl	356c <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    1dc0:	e30419f4 	movw	r1, #18932	; 0x49f4
    1dc4:	e3a00001 	mov	r0, #1
    1dc8:	e3401000 	movt	r1, #0
    1dcc:	eb000731 	bl	3a98 <printf>
    exit();
    1dd0:	eb0005e5 	bl	356c <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    1dd4:	e30419d0 	movw	r1, #18896	; 0x49d0
    1dd8:	e3a00001 	mov	r0, #1
    1ddc:	e3401000 	movt	r1, #0
    1de0:	eb00072c 	bl	3a98 <printf>
    exit();
    1de4:	eb0005e0 	bl	356c <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    1de8:	e30419a8 	movw	r1, #18856	; 0x49a8
    1dec:	e3a00001 	mov	r0, #1
    1df0:	e3401000 	movt	r1, #0
    1df4:	eb000727 	bl	3a98 <printf>
    exit();
    1df8:	eb0005db 	bl	356c <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    1dfc:	e304198c 	movw	r1, #18828	; 0x498c
    1e00:	e3a00001 	mov	r0, #1
    1e04:	e3401000 	movt	r1, #0
    1e08:	eb000722 	bl	3a98 <printf>
    exit();
    1e0c:	eb0005d6 	bl	356c <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    1e10:	e3041974 	movw	r1, #18804	; 0x4974
    1e14:	e3a00001 	mov	r0, #1
    1e18:	e3401000 	movt	r1, #0
    1e1c:	eb00071d 	bl	3a98 <printf>
    exit();
    1e20:	eb0005d1 	bl	356c <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    1e24:	e3041958 	movw	r1, #18776	; 0x4958
    1e28:	e3a00001 	mov	r0, #1
    1e2c:	e3401000 	movt	r1, #0
    1e30:	eb000718 	bl	3a98 <printf>
    exit();
    1e34:	eb0005cc 	bl	356c <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    1e38:	e3041860 	movw	r1, #18528	; 0x4860
    1e3c:	e3a00001 	mov	r0, #1
    1e40:	e3401000 	movt	r1, #0
    1e44:	eb000713 	bl	3a98 <printf>
    exit();
    1e48:	eb0005c7 	bl	356c <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1e4c:	e304183c 	movw	r1, #18492	; 0x483c
    1e50:	e3a00001 	mov	r0, #1
    1e54:	e3401000 	movt	r1, #0
    1e58:	eb00070e 	bl	3a98 <printf>
    exit();
    1e5c:	eb0005c2 	bl	356c <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    1e60:	e304176c 	movw	r1, #18284	; 0x476c
    1e64:	e3a00001 	mov	r0, #1
    1e68:	e3401000 	movt	r1, #0
    1e6c:	eb000709 	bl	3a98 <printf>
    exit();
    1e70:	eb0005bd 	bl	356c <exit>
  }
  write(fd, "ff", 2);
  close(fd);
  
  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1e74:	e304173c 	movw	r1, #18236	; 0x473c
    1e78:	e3a00001 	mov	r0, #1
    1e7c:	e3401000 	movt	r1, #0
    1e80:	eb000704 	bl	3a98 <printf>
    exit();
    1e84:	eb0005b8 	bl	356c <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    1e88:	e3041724 	movw	r1, #18212	; 0x4724
    1e8c:	e3a00001 	mov	r0, #1
    1e90:	e3401000 	movt	r1, #0
    1e94:	eb0006ff 	bl	3a98 <printf>
    exit();
    1e98:	eb0005b3 	bl	356c <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    1e9c:	e3041704 	movw	r1, #18180	; 0x4704
    1ea0:	e3a00001 	mov	r0, #1
    1ea4:	e3401000 	movt	r1, #0
    1ea8:	eb0006fa 	bl	3a98 <printf>
    exit();
    1eac:	eb0005ae 	bl	356c <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    1eb0:	e3041b5c 	movw	r1, #19292	; 0x4b5c
    1eb4:	e3a00001 	mov	r0, #1
    1eb8:	e3401000 	movt	r1, #0
    1ebc:	eb0006f5 	bl	3a98 <printf>
    exit();
    1ec0:	eb0005a9 	bl	356c <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    1ec4:	e3041b44 	movw	r1, #19268	; 0x4b44
    1ec8:	e3a00001 	mov	r0, #1
    1ecc:	e3401000 	movt	r1, #0
    1ed0:	eb0006f0 	bl	3a98 <printf>
    exit();
    1ed4:	eb0005a4 	bl	356c <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    1ed8:	e3041b1c 	movw	r1, #19228	; 0x4b1c
    1edc:	e3a00001 	mov	r0, #1
    1ee0:	e3401000 	movt	r1, #0
    1ee4:	eb0006eb 	bl	3a98 <printf>
    exit();
    1ee8:	eb00059f 	bl	356c <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    1eec:	e3041b04 	movw	r1, #19204	; 0x4b04
    1ef0:	e3a00001 	mov	r0, #1
    1ef4:	e3401000 	movt	r1, #0
    1ef8:	eb0006e6 	bl	3a98 <printf>
    exit();
    1efc:	eb00059a 	bl	356c <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    1f00:	e3041aec 	movw	r1, #19180	; 0x4aec
    1f04:	e3a00001 	mov	r0, #1
    1f08:	e3401000 	movt	r1, #0
    1f0c:	eb0006e1 	bl	3a98 <printf>
    exit();
    1f10:	eb000595 	bl	356c <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    1f14:	e3041acc 	movw	r1, #19148	; 0x4acc
    1f18:	e3a00001 	mov	r0, #1
    1f1c:	e3401000 	movt	r1, #0
    1f20:	eb0006dc 	bl	3a98 <printf>
    exit();
    1f24:	eb000590 	bl	356c <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    1f28:	e3041ab0 	movw	r1, #19120	; 0x4ab0
    1f2c:	e3a00001 	mov	r0, #1
    1f30:	e3401000 	movt	r1, #0
    1f34:	eb0006d7 	bl	3a98 <printf>
    exit();
    1f38:	eb00058b 	bl	356c <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    1f3c:	e3041a94 	movw	r1, #19092	; 0x4a94
    1f40:	e3a00001 	mov	r0, #1
    1f44:	e3401000 	movt	r1, #0
    1f48:	eb0006d2 	bl	3a98 <printf>
    exit();
    1f4c:	eb000586 	bl	356c <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    1f50:	e3041a74 	movw	r1, #19060	; 0x4a74
    1f54:	e3a00001 	mov	r0, #1
    1f58:	e3401000 	movt	r1, #0
    1f5c:	eb0006cd 	bl	3a98 <printf>
    exit();
    1f60:	eb000581 	bl	356c <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    1f64:	e3041a58 	movw	r1, #19032	; 0x4a58
    1f68:	e3a00001 	mov	r0, #1
    1f6c:	e3401000 	movt	r1, #0
    1f70:	eb0006c8 	bl	3a98 <printf>
    exit();
    1f74:	eb00057c 	bl	356c <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    1f78:	e30418e0 	movw	r1, #18656	; 0x48e0
    1f7c:	e3a00001 	mov	r0, #1
    1f80:	e3401000 	movt	r1, #0
    1f84:	eb0006c3 	bl	3a98 <printf>
    exit();
    1f88:	eb000577 	bl	356c <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    1f8c:	e30418c8 	movw	r1, #18632	; 0x48c8
    1f90:	e3a00001 	mov	r0, #1
    1f94:	e3401000 	movt	r1, #0
    1f98:	eb0006be 	bl	3a98 <printf>
    exit();
    1f9c:	eb000572 	bl	356c <exit>

00001fa0 <bigwrite>:
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    1fa0:	e3041b7c 	movw	r1, #19324	; 0x4b7c
    1fa4:	e3a00001 	mov	r0, #1
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    1fa8:	e92d4830 	push	{r4, r5, fp, lr}
  int fd, sz;

  printf(1, "bigwrite test\n");
    1fac:	e3401000 	movt	r1, #0
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    1fb0:	e28db00c 	add	fp, sp, #12
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    1fb4:	e30041f3 	movw	r4, #499	; 0x1f3
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    1fb8:	eb0006b6 	bl	3a98 <printf>

  unlink("bigwrite");
    1fbc:	e3040b8c 	movw	r0, #19340	; 0x4b8c
    1fc0:	e3400000 	movt	r0, #0
    1fc4:	eb0005ea 	bl	3774 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    1fc8:	e3040b8c 	movw	r0, #19340	; 0x4b8c
    1fcc:	e3001202 	movw	r1, #514	; 0x202
    1fd0:	e3400000 	movt	r0, #0
    1fd4:	eb0005cc 	bl	370c <open>
    if(fd < 0){
    1fd8:	e2505000 	subs	r5, r0, #0
    1fdc:	ba000023 	blt	2070 <bigwrite+0xd0>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    1fe0:	e3071fc8 	movw	r1, #32712	; 0x7fc8
    1fe4:	e1a02004 	mov	r2, r4
    1fe8:	e3401000 	movt	r1, #0
    1fec:	eb000592 	bl	363c <write>
      if(cc != sz){
    1ff0:	e1540000 	cmp	r4, r0
    1ff4:	1a000016 	bne	2054 <bigwrite+0xb4>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    1ff8:	e3071fc8 	movw	r1, #32712	; 0x7fc8
    1ffc:	e1a02004 	mov	r2, r4
    2000:	e3401000 	movt	r1, #0
    2004:	e1a00005 	mov	r0, r5
    2008:	eb00058b 	bl	363c <write>
      if(cc != sz){
    200c:	e1540000 	cmp	r4, r0
    2010:	1a00000f 	bne	2054 <bigwrite+0xb4>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2014:	e1a00005 	mov	r0, r5
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2018:	e2844f75 	add	r4, r4, #468	; 0x1d4
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    201c:	eb000593 	bl	3670 <close>
    unlink("bigwrite");
    2020:	e3040b8c 	movw	r0, #19340	; 0x4b8c
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2024:	e2844003 	add	r4, r4, #3
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    unlink("bigwrite");
    2028:	e3400000 	movt	r0, #0
    202c:	eb0005d0 	bl	3774 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2030:	e3013807 	movw	r3, #6151	; 0x1807
    2034:	e1540003 	cmp	r4, r3
    2038:	1affffe2 	bne	1fc8 <bigwrite+0x28>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    203c:	e3041bc4 	movw	r1, #19396	; 0x4bc4
    2040:	e3a00001 	mov	r0, #1
    2044:	e3401000 	movt	r1, #0
}
    2048:	e24bd00c 	sub	sp, fp, #12
    204c:	e8bd4830 	pop	{r4, r5, fp, lr}
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    2050:	ea000690 	b	3a98 <printf>
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    2054:	e3041bb0 	movw	r1, #19376	; 0x4bb0
    2058:	e1a03000 	mov	r3, r0
    205c:	e1a02004 	mov	r2, r4
    2060:	e3401000 	movt	r1, #0
    2064:	e3a00001 	mov	r0, #1
    2068:	eb00068a 	bl	3a98 <printf>
        exit();
    206c:	eb00053e 	bl	356c <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    2070:	e3041b98 	movw	r1, #19352	; 0x4b98
    2074:	e3a00001 	mov	r0, #1
    2078:	e3401000 	movt	r1, #0
    207c:	eb000685 	bl	3a98 <printf>
      exit();
    2080:	eb000539 	bl	356c <exit>

00002084 <bigfile>:
void
bigfile(void)
{
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2084:	e3041bd4 	movw	r1, #19412	; 0x4bd4
    2088:	e3a00001 	mov	r0, #1
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    208c:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2090:	e3401000 	movt	r1, #0
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    2094:	e28db014 	add	fp, sp, #20
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2098:	eb00067e 	bl	3a98 <printf>

  unlink("bigfile");
    209c:	e3040be4 	movw	r0, #19428	; 0x4be4
    20a0:	e3400000 	movt	r0, #0
    20a4:	eb0005b2 	bl	3774 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    20a8:	e3040be4 	movw	r0, #19428	; 0x4be4
    20ac:	e3400000 	movt	r0, #0
    20b0:	e3001202 	movw	r1, #514	; 0x202
    20b4:	eb000594 	bl	370c <open>
  if(fd < 0){
    20b8:	e2505000 	subs	r5, r0, #0
    20bc:	a3a04000 	movge	r4, #0
    20c0:	ba000054 	blt	2218 <bigfile+0x194>
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    20c4:	e3070fc8 	movw	r0, #32712	; 0x7fc8
    20c8:	e3a02f96 	mov	r2, #600	; 0x258
    20cc:	e1a01004 	mov	r1, r4
    20d0:	e3400000 	movt	r0, #0
    20d4:	eb0004ab 	bl	3388 <memset>
    if(write(fd, buf, 600) != 600){
    20d8:	e3071fc8 	movw	r1, #32712	; 0x7fc8
    20dc:	e3401000 	movt	r1, #0
    20e0:	e3a02f96 	mov	r2, #600	; 0x258
    20e4:	e1a00005 	mov	r0, r5
    20e8:	eb000553 	bl	363c <write>
    20ec:	e3500f96 	cmp	r0, #600	; 0x258
    20f0:	1a00003e 	bne	21f0 <bigfile+0x16c>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    20f4:	e2844001 	add	r4, r4, #1
    20f8:	e3540014 	cmp	r4, #20
    20fc:	1afffff0 	bne	20c4 <bigfile+0x40>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    2100:	e1a00005 	mov	r0, r5
    2104:	eb000559 	bl	3670 <close>

  fd = open("bigfile", 0);
    2108:	e3040be4 	movw	r0, #19428	; 0x4be4
    210c:	e3400000 	movt	r0, #0
    2110:	e3a01000 	mov	r1, #0
    2114:	eb00057c 	bl	370c <open>
  if(fd < 0){
    2118:	e2507000 	subs	r7, r0, #0
    211c:	ba000038 	blt	2204 <bigfile+0x180>
    2120:	e3a06000 	mov	r6, #0
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    2124:	e3075fc8 	movw	r5, #32712	; 0x7fc8
    2128:	e1a04006 	mov	r4, r6
    212c:	e3405000 	movt	r5, #0
    2130:	ea000009 	b	215c <bigfile+0xd8>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2134:	e3500f4b 	cmp	r0, #300	; 0x12c
    2138:	1a000022 	bne	21c8 <bigfile+0x144>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    213c:	e5d53000 	ldrb	r3, [r5]
    2140:	e15300c4 	cmp	r3, r4, asr #1
    2144:	1a00001a 	bne	21b4 <bigfile+0x130>
    2148:	e5d5212b 	ldrb	r2, [r5, #299]	; 0x12b
    214c:	e1530002 	cmp	r3, r2
    2150:	1a000017 	bne	21b4 <bigfile+0x130>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    2154:	e2866f4b 	add	r6, r6, #300	; 0x12c
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    2158:	e2844001 	add	r4, r4, #1
    cc = read(fd, buf, 300);
    215c:	e3071fc8 	movw	r1, #32712	; 0x7fc8
    2160:	e3a02f4b 	mov	r2, #300	; 0x12c
    2164:	e3401000 	movt	r1, #0
    2168:	e1a00007 	mov	r0, r7
    216c:	eb000525 	bl	3608 <read>
    if(cc < 0){
    2170:	e3500000 	cmp	r0, #0
    2174:	ba000018 	blt	21dc <bigfile+0x158>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    2178:	1affffed 	bne	2134 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    217c:	e1a00007 	mov	r0, r7
    2180:	eb00053a 	bl	3670 <close>
  if(total != 20*600){
    2184:	e3023ee0 	movw	r3, #12000	; 0x2ee0
    2188:	e1560003 	cmp	r6, r3
    218c:	1a000026 	bne	222c <bigfile+0x1a8>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    2190:	e3040be4 	movw	r0, #19428	; 0x4be4
    2194:	e3400000 	movt	r0, #0
    2198:	eb000575 	bl	3774 <unlink>

  printf(1, "bigfile test ok\n");
    219c:	e3041c98 	movw	r1, #19608	; 0x4c98
    21a0:	e3401000 	movt	r1, #0
    21a4:	e3a00001 	mov	r0, #1
}
    21a8:	e24bd014 	sub	sp, fp, #20
    21ac:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");

  printf(1, "bigfile test ok\n");
    21b0:	ea000638 	b	3a98 <printf>
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    21b4:	e3041c60 	movw	r1, #19552	; 0x4c60
    21b8:	e3a00001 	mov	r0, #1
    21bc:	e3401000 	movt	r1, #0
    21c0:	eb000634 	bl	3a98 <printf>
      exit();
    21c4:	eb0004e8 	bl	356c <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    21c8:	e3041c4c 	movw	r1, #19532	; 0x4c4c
    21cc:	e3a00001 	mov	r0, #1
    21d0:	e3401000 	movt	r1, #0
    21d4:	eb00062f 	bl	3a98 <printf>
      exit();
    21d8:	eb0004e3 	bl	356c <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    21dc:	e3041c34 	movw	r1, #19508	; 0x4c34
    21e0:	e3a00001 	mov	r0, #1
    21e4:	e3401000 	movt	r1, #0
    21e8:	eb00062a 	bl	3a98 <printf>
      exit();
    21ec:	eb0004de 	bl	356c <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    21f0:	e3041c04 	movw	r1, #19460	; 0x4c04
    21f4:	e3a00001 	mov	r0, #1
    21f8:	e3401000 	movt	r1, #0
    21fc:	eb000625 	bl	3a98 <printf>
      exit();
    2200:	eb0004d9 	bl	356c <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2204:	e3041c1c 	movw	r1, #19484	; 0x4c1c
    2208:	e3a00001 	mov	r0, #1
    220c:	e3401000 	movt	r1, #0
    2210:	eb000620 	bl	3a98 <printf>
    exit();
    2214:	eb0004d4 	bl	356c <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    2218:	e3041bec 	movw	r1, #19436	; 0x4bec
    221c:	e3a00001 	mov	r0, #1
    2220:	e3401000 	movt	r1, #0
    2224:	eb00061b 	bl	3a98 <printf>
    exit();
    2228:	eb0004cf 	bl	356c <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    222c:	e3041c7c 	movw	r1, #19580	; 0x4c7c
    2230:	e3a00001 	mov	r0, #1
    2234:	e3401000 	movt	r1, #0
    2238:	eb000616 	bl	3a98 <printf>
    exit();
    223c:	eb0004ca 	bl	356c <exit>

00002240 <fourteen>:
fourteen(void)
{
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2240:	e3041cac 	movw	r1, #19628	; 0x4cac
    2244:	e3a00001 	mov	r0, #1
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2248:	e92d4830 	push	{r4, r5, fp, lr}
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    224c:	e3401000 	movt	r1, #0
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2250:	e28db00c 	add	fp, sp, #12
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2254:	eb00060f 	bl	3a98 <printf>

  if(mkdir("12345678901234") != 0){
    2258:	e3040e68 	movw	r0, #20072	; 0x4e68
    225c:	e3400000 	movt	r0, #0
    2260:	eb00056a 	bl	3810 <mkdir>
    2264:	e3500000 	cmp	r0, #0
    2268:	1a000022 	bne	22f8 <fourteen+0xb8>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    226c:	e3040cdc 	movw	r0, #19676	; 0x4cdc
    2270:	e3400000 	movt	r0, #0
    2274:	eb000565 	bl	3810 <mkdir>
    2278:	e2504000 	subs	r4, r0, #0
    227c:	1a000036 	bne	235c <fourteen+0x11c>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2280:	e3040d2c 	movw	r0, #19756	; 0x4d2c
    2284:	e3a01c02 	mov	r1, #512	; 0x200
    2288:	e3400000 	movt	r0, #0
    228c:	eb00051e 	bl	370c <open>
  if(fd < 0){
    2290:	e3500000 	cmp	r0, #0
    2294:	ba00002b 	blt	2348 <fourteen+0x108>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    2298:	eb0004f4 	bl	3670 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    229c:	e3040d9c 	movw	r0, #19868	; 0x4d9c
    22a0:	e1a01004 	mov	r1, r4
    22a4:	e3400000 	movt	r0, #0
    22a8:	eb000517 	bl	370c <open>
  if(fd < 0){
    22ac:	e3500000 	cmp	r0, #0
    22b0:	ba00001f 	blt	2334 <fourteen+0xf4>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    22b4:	eb0004ed 	bl	3670 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    22b8:	e3040e08 	movw	r0, #19976	; 0x4e08
    22bc:	e3400000 	movt	r0, #0
    22c0:	eb000552 	bl	3810 <mkdir>
    22c4:	e3500000 	cmp	r0, #0
    22c8:	0a000014 	beq	2320 <fourteen+0xe0>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    22cc:	e3040e58 	movw	r0, #20056	; 0x4e58
    22d0:	e3400000 	movt	r0, #0
    22d4:	eb00054d 	bl	3810 <mkdir>
    22d8:	e3500000 	cmp	r0, #0
    22dc:	0a00000a 	beq	230c <fourteen+0xcc>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    22e0:	e3041eac 	movw	r1, #20140	; 0x4eac
    22e4:	e3a00001 	mov	r0, #1
    22e8:	e3401000 	movt	r1, #0
}
    22ec:	e24bd00c 	sub	sp, fp, #12
    22f0:	e8bd4830 	pop	{r4, r5, fp, lr}
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    22f4:	ea0005e7 	b	3a98 <printf>

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    22f8:	e3041cbc 	movw	r1, #19644	; 0x4cbc
    22fc:	e3a00001 	mov	r0, #1
    2300:	e3401000 	movt	r1, #0
    2304:	eb0005e3 	bl	3a98 <printf>
    exit();
    2308:	eb000497 	bl	356c <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    230c:	e3041e78 	movw	r1, #20088	; 0x4e78
    2310:	e3a00001 	mov	r0, #1
    2314:	e3401000 	movt	r1, #0
    2318:	eb0005de 	bl	3a98 <printf>
    exit();
    231c:	eb000492 	bl	356c <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2320:	e3041e28 	movw	r1, #20008	; 0x4e28
    2324:	e3a00001 	mov	r0, #1
    2328:	e3401000 	movt	r1, #0
    232c:	eb0005d9 	bl	3a98 <printf>
    exit();
    2330:	eb00048d 	bl	356c <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2334:	e3041dcc 	movw	r1, #19916	; 0x4dcc
    2338:	e3a00001 	mov	r0, #1
    233c:	e3401000 	movt	r1, #0
    2340:	eb0005d4 	bl	3a98 <printf>
    exit();
    2344:	eb000488 	bl	356c <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2348:	e3041d5c 	movw	r1, #19804	; 0x4d5c
    234c:	e3a00001 	mov	r0, #1
    2350:	e3401000 	movt	r1, #0
    2354:	eb0005cf 	bl	3a98 <printf>
    exit();
    2358:	eb000483 	bl	356c <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    235c:	e3041cfc 	movw	r1, #19708	; 0x4cfc
    2360:	e3a00001 	mov	r0, #1
    2364:	e3401000 	movt	r1, #0
    2368:	eb0005ca 	bl	3a98 <printf>
    exit();
    236c:	eb00047e 	bl	356c <exit>

00002370 <rmdot>:
}

void
rmdot(void)
{
  printf(1, "rmdot test\n");
    2370:	e3041ebc 	movw	r1, #20156	; 0x4ebc
    2374:	e3a00001 	mov	r0, #1
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2378:	e92d4800 	push	{fp, lr}
  printf(1, "rmdot test\n");
    237c:	e3401000 	movt	r1, #0
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2380:	e28db004 	add	fp, sp, #4
  printf(1, "rmdot test\n");
    2384:	eb0005c3 	bl	3a98 <printf>
  if(mkdir("dots") != 0){
    2388:	e3040ec8 	movw	r0, #20168	; 0x4ec8
    238c:	e3400000 	movt	r0, #0
    2390:	eb00051e 	bl	3810 <mkdir>
    2394:	e3500000 	cmp	r0, #0
    2398:	1a000028 	bne	2440 <rmdot+0xd0>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    239c:	e3040ec8 	movw	r0, #20168	; 0x4ec8
    23a0:	e3400000 	movt	r0, #0
    23a4:	eb000526 	bl	3844 <chdir>
    23a8:	e3500000 	cmp	r0, #0
    23ac:	1a000046 	bne	24cc <rmdot+0x15c>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    23b0:	e3040588 	movw	r0, #17800	; 0x4588
    23b4:	e3400000 	movt	r0, #0
    23b8:	eb0004ed 	bl	3774 <unlink>
    23bc:	e3500000 	cmp	r0, #0
    23c0:	0a00003c 	beq	24b8 <rmdot+0x148>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    23c4:	e30400cc 	movw	r0, #16588	; 0x40cc
    23c8:	e3400000 	movt	r0, #0
    23cc:	eb0004e8 	bl	3774 <unlink>
    23d0:	e3500000 	cmp	r0, #0
    23d4:	0a000032 	beq	24a4 <rmdot+0x134>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    23d8:	e3040f18 	movw	r0, #20248	; 0x4f18
    23dc:	e3400000 	movt	r0, #0
    23e0:	eb000517 	bl	3844 <chdir>
    23e4:	e3500000 	cmp	r0, #0
    23e8:	1a000028 	bne	2490 <rmdot+0x120>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    23ec:	e3040f2c 	movw	r0, #20268	; 0x4f2c
    23f0:	e3400000 	movt	r0, #0
    23f4:	eb0004de 	bl	3774 <unlink>
    23f8:	e3500000 	cmp	r0, #0
    23fc:	0a00001e 	beq	247c <rmdot+0x10c>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    2400:	e3040f4c 	movw	r0, #20300	; 0x4f4c
    2404:	e3400000 	movt	r0, #0
    2408:	eb0004d9 	bl	3774 <unlink>
    240c:	e3500000 	cmp	r0, #0
    2410:	0a000014 	beq	2468 <rmdot+0xf8>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    2414:	e3040ec8 	movw	r0, #20168	; 0x4ec8
    2418:	e3400000 	movt	r0, #0
    241c:	eb0004d4 	bl	3774 <unlink>
    2420:	e3500000 	cmp	r0, #0
    2424:	1a00000a 	bne	2454 <rmdot+0xe4>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    2428:	e3041f84 	movw	r1, #20356	; 0x4f84
    242c:	e3a00001 	mov	r0, #1
    2430:	e3401000 	movt	r1, #0
}
    2434:	e24bd004 	sub	sp, fp, #4
    2438:	e8bd4800 	pop	{fp, lr}
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    243c:	ea000595 	b	3a98 <printf>
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    2440:	e3041ed0 	movw	r1, #20176	; 0x4ed0
    2444:	e3a00001 	mov	r0, #1
    2448:	e3401000 	movt	r1, #0
    244c:	eb000591 	bl	3a98 <printf>
    exit();
    2450:	eb000445 	bl	356c <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    2454:	e3041f6c 	movw	r1, #20332	; 0x4f6c
    2458:	e3a00001 	mov	r0, #1
    245c:	e3401000 	movt	r1, #0
    2460:	eb00058c 	bl	3a98 <printf>
    exit();
    2464:	eb000440 	bl	356c <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    2468:	e3041f54 	movw	r1, #20308	; 0x4f54
    246c:	e3a00001 	mov	r0, #1
    2470:	e3401000 	movt	r1, #0
    2474:	eb000587 	bl	3a98 <printf>
    exit();
    2478:	eb00043b 	bl	356c <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    247c:	e3041f34 	movw	r1, #20276	; 0x4f34
    2480:	e3a00001 	mov	r0, #1
    2484:	e3401000 	movt	r1, #0
    2488:	eb000582 	bl	3a98 <printf>
    exit();
    248c:	eb000436 	bl	356c <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2490:	e3041f1c 	movw	r1, #20252	; 0x4f1c
    2494:	e3a00001 	mov	r0, #1
    2498:	e3401000 	movt	r1, #0
    249c:	eb00057d 	bl	3a98 <printf>
    exit();
    24a0:	eb000431 	bl	356c <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    24a4:	e3041f08 	movw	r1, #20232	; 0x4f08
    24a8:	e3a00001 	mov	r0, #1
    24ac:	e3401000 	movt	r1, #0
    24b0:	eb000578 	bl	3a98 <printf>
    exit();
    24b4:	eb00042c 	bl	356c <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    24b8:	e3041ef8 	movw	r1, #20216	; 0x4ef8
    24bc:	e3a00001 	mov	r0, #1
    24c0:	e3401000 	movt	r1, #0
    24c4:	eb000573 	bl	3a98 <printf>
    exit();
    24c8:	eb000427 	bl	356c <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    24cc:	e3041ee4 	movw	r1, #20196	; 0x4ee4
    24d0:	e3a00001 	mov	r0, #1
    24d4:	e3401000 	movt	r1, #0
    24d8:	eb00056e 	bl	3a98 <printf>
    exit();
    24dc:	eb000422 	bl	356c <exit>

000024e0 <dirfile>:
void
dirfile(void)
{
  int fd;

  printf(1, "dir vs file\n");
    24e0:	e3041f90 	movw	r1, #20368	; 0x4f90
    24e4:	e3a00001 	mov	r0, #1
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    24e8:	e92d4830 	push	{r4, r5, fp, lr}
  int fd;

  printf(1, "dir vs file\n");
    24ec:	e3401000 	movt	r1, #0
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    24f0:	e28db00c 	add	fp, sp, #12
  int fd;

  printf(1, "dir vs file\n");
    24f4:	eb000567 	bl	3a98 <printf>

  fd = open("dirfile", O_CREATE);
    24f8:	e3040fa0 	movw	r0, #20384	; 0x4fa0
    24fc:	e3400000 	movt	r0, #0
    2500:	e3a01c02 	mov	r1, #512	; 0x200
    2504:	eb000480 	bl	370c <open>
  if(fd < 0){
    2508:	e3500000 	cmp	r0, #0
    250c:	ba00004a 	blt	263c <dirfile+0x15c>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    2510:	eb000456 	bl	3670 <close>
  if(chdir("dirfile") == 0){
    2514:	e3040fa0 	movw	r0, #20384	; 0x4fa0
    2518:	e3400000 	movt	r0, #0
    251c:	eb0004c8 	bl	3844 <chdir>
    2520:	e3500000 	cmp	r0, #0
    2524:	0a00003f 	beq	2628 <dirfile+0x148>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    2528:	e3040fdc 	movw	r0, #20444	; 0x4fdc
    252c:	e3a01000 	mov	r1, #0
    2530:	e3400000 	movt	r0, #0
    2534:	eb000474 	bl	370c <open>
  if(fd >= 0){
    2538:	e3500000 	cmp	r0, #0
    253c:	aa000034 	bge	2614 <dirfile+0x134>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    2540:	e3040fdc 	movw	r0, #20444	; 0x4fdc
    2544:	e3a01c02 	mov	r1, #512	; 0x200
    2548:	e3400000 	movt	r0, #0
    254c:	eb00046e 	bl	370c <open>
  if(fd >= 0){
    2550:	e3500000 	cmp	r0, #0
    2554:	aa00002e 	bge	2614 <dirfile+0x134>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    2558:	e3040fdc 	movw	r0, #20444	; 0x4fdc
    255c:	e3400000 	movt	r0, #0
    2560:	eb0004aa 	bl	3810 <mkdir>
    2564:	e3500000 	cmp	r0, #0
    2568:	0a000051 	beq	26b4 <dirfile+0x1d4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    256c:	e3040fdc 	movw	r0, #20444	; 0x4fdc
    2570:	e3400000 	movt	r0, #0
    2574:	eb00047e 	bl	3774 <unlink>
    2578:	e3500000 	cmp	r0, #0
    257c:	0a000047 	beq	26a0 <dirfile+0x1c0>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    2580:	e3041fdc 	movw	r1, #20444	; 0x4fdc
    2584:	e3050048 	movw	r0, #20552	; 0x5048
    2588:	e3401000 	movt	r1, #0
    258c:	e3400000 	movt	r0, #0
    2590:	eb000491 	bl	37dc <link>
    2594:	e3500000 	cmp	r0, #0
    2598:	0a00003b 	beq	268c <dirfile+0x1ac>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    259c:	e3040fa0 	movw	r0, #20384	; 0x4fa0
    25a0:	e3400000 	movt	r0, #0
    25a4:	eb000472 	bl	3774 <unlink>
    25a8:	e2504000 	subs	r4, r0, #0
    25ac:	1a000031 	bne	2678 <dirfile+0x198>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    25b0:	e3040588 	movw	r0, #17800	; 0x4588
    25b4:	e3a01002 	mov	r1, #2
    25b8:	e3400000 	movt	r0, #0
    25bc:	eb000452 	bl	370c <open>
  if(fd >= 0){
    25c0:	e3500000 	cmp	r0, #0
    25c4:	aa000026 	bge	2664 <dirfile+0x184>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    25c8:	e3040588 	movw	r0, #17800	; 0x4588
    25cc:	e1a01004 	mov	r1, r4
    25d0:	e3400000 	movt	r0, #0
    25d4:	eb00044c 	bl	370c <open>
  if(write(fd, "x", 1) > 0){
    25d8:	e3041ae8 	movw	r1, #19176	; 0x4ae8
    25dc:	e3a02001 	mov	r2, #1
    25e0:	e3401000 	movt	r1, #0
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    25e4:	e1a04000 	mov	r4, r0
  if(write(fd, "x", 1) > 0){
    25e8:	eb000413 	bl	363c <write>
    25ec:	e3500000 	cmp	r0, #0
    25f0:	ca000016 	bgt	2650 <dirfile+0x170>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    25f4:	e1a00004 	mov	r0, r4
    25f8:	eb00041c 	bl	3670 <close>

  printf(1, "dir vs file OK\n");
    25fc:	e30510bc 	movw	r1, #20668	; 0x50bc
    2600:	e3401000 	movt	r1, #0
    2604:	e3a00001 	mov	r0, #1
}
    2608:	e24bd00c 	sub	sp, fp, #12
    260c:	e8bd4830 	pop	{r4, r5, fp, lr}
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);

  printf(1, "dir vs file OK\n");
    2610:	ea000520 	b	3a98 <printf>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2614:	e3041fe8 	movw	r1, #20456	; 0x4fe8
    2618:	e3a00001 	mov	r0, #1
    261c:	e3401000 	movt	r1, #0
    2620:	eb00051c 	bl	3a98 <printf>
    exit();
    2624:	eb0003d0 	bl	356c <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2628:	e3041fc0 	movw	r1, #20416	; 0x4fc0
    262c:	e3a00001 	mov	r0, #1
    2630:	e3401000 	movt	r1, #0
    2634:	eb000517 	bl	3a98 <printf>
    exit();
    2638:	eb0003cb 	bl	356c <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    263c:	e3041fa8 	movw	r1, #20392	; 0x4fa8
    2640:	e3a00001 	mov	r0, #1
    2644:	e3401000 	movt	r1, #0
    2648:	eb000512 	bl	3a98 <printf>
    exit();
    264c:	eb0003c6 	bl	356c <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2650:	e30510a8 	movw	r1, #20648	; 0x50a8
    2654:	e3a00001 	mov	r0, #1
    2658:	e3401000 	movt	r1, #0
    265c:	eb00050d 	bl	3a98 <printf>
    exit();
    2660:	eb0003c1 	bl	356c <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2664:	e3051088 	movw	r1, #20616	; 0x5088
    2668:	e3a00001 	mov	r0, #1
    266c:	e3401000 	movt	r1, #0
    2670:	eb000508 	bl	3a98 <printf>
    exit();
    2674:	eb0003bc 	bl	356c <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2678:	e3051070 	movw	r1, #20592	; 0x5070
    267c:	e3a00001 	mov	r0, #1
    2680:	e3401000 	movt	r1, #0
    2684:	eb000503 	bl	3a98 <printf>
    exit();
    2688:	eb0003b7 	bl	356c <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    268c:	e3051050 	movw	r1, #20560	; 0x5050
    2690:	e3a00001 	mov	r0, #1
    2694:	e3401000 	movt	r1, #0
    2698:	eb0004fe 	bl	3a98 <printf>
    exit();
    269c:	eb0003b2 	bl	356c <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    26a0:	e3051028 	movw	r1, #20520	; 0x5028
    26a4:	e3a00001 	mov	r0, #1
    26a8:	e3401000 	movt	r1, #0
    26ac:	eb0004f9 	bl	3a98 <printf>
    exit();
    26b0:	eb0003ad 	bl	356c <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    26b4:	e3051008 	movw	r1, #20488	; 0x5008
    26b8:	e3a00001 	mov	r0, #1
    26bc:	e3401000 	movt	r1, #0
    26c0:	eb0004f4 	bl	3a98 <printf>
    exit();
    26c4:	eb0003a8 	bl	356c <exit>

000026c8 <iref>:
void
iref(void)
{
  int i, fd;

  printf(1, "empty file name\n");
    26c8:	e30510cc 	movw	r1, #20684	; 0x50cc
    26cc:	e3a00001 	mov	r0, #1
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    26d0:	e92d4830 	push	{r4, r5, fp, lr}
  int i, fd;

  printf(1, "empty file name\n");
    26d4:	e3401000 	movt	r1, #0
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    26d8:	e28db00c 	add	fp, sp, #12
  int i, fd;

  printf(1, "empty file name\n");
    26dc:	e3a04033 	mov	r4, #51	; 0x33
    26e0:	eb0004ec 	bl	3a98 <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    26e4:	e30500e0 	movw	r0, #20704	; 0x50e0
    26e8:	e3400000 	movt	r0, #0
    26ec:	eb000447 	bl	3810 <mkdir>
    26f0:	e3500000 	cmp	r0, #0
    26f4:	1a000028 	bne	279c <iref+0xd4>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    26f8:	e30500e0 	movw	r0, #20704	; 0x50e0
    26fc:	e3400000 	movt	r0, #0
    2700:	eb00044f 	bl	3844 <chdir>
    2704:	e3500000 	cmp	r0, #0
    2708:	1a000028 	bne	27b0 <iref+0xe8>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    270c:	e3040ea8 	movw	r0, #20136	; 0x4ea8
    2710:	e3400000 	movt	r0, #0
    2714:	eb00043d 	bl	3810 <mkdir>
    link("README", "");
    2718:	e3041ea8 	movw	r1, #20136	; 0x4ea8
    271c:	e3050048 	movw	r0, #20552	; 0x5048
    2720:	e3401000 	movt	r1, #0
    2724:	e3400000 	movt	r0, #0
    2728:	eb00042b 	bl	37dc <link>
    fd = open("", O_CREATE);
    272c:	e3040ea8 	movw	r0, #20136	; 0x4ea8
    2730:	e3400000 	movt	r0, #0
    2734:	e3a01c02 	mov	r1, #512	; 0x200
    2738:	eb0003f3 	bl	370c <open>
    if(fd >= 0)
    273c:	e3500000 	cmp	r0, #0
    2740:	ba000000 	blt	2748 <iref+0x80>
      close(fd);
    2744:	eb0003c9 	bl	3670 <close>
    fd = open("xx", O_CREATE);
    2748:	e3040fe4 	movw	r0, #20452	; 0x4fe4
    274c:	e3a01c02 	mov	r1, #512	; 0x200
    2750:	e3400000 	movt	r0, #0
    2754:	eb0003ec 	bl	370c <open>
    if(fd >= 0)
    2758:	e3500000 	cmp	r0, #0
    275c:	ba000000 	blt	2764 <iref+0x9c>
      close(fd);
    2760:	eb0003c2 	bl	3670 <close>
    unlink("xx");
    2764:	e3040fe4 	movw	r0, #20452	; 0x4fe4
    2768:	e3400000 	movt	r0, #0
    276c:	eb000400 	bl	3774 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2770:	e2544001 	subs	r4, r4, #1
    2774:	1affffda 	bne	26e4 <iref+0x1c>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2778:	e3040f18 	movw	r0, #20248	; 0x4f18
    277c:	e3400000 	movt	r0, #0
    2780:	eb00042f 	bl	3844 <chdir>
  printf(1, "empty file name OK\n");
    2784:	e3051110 	movw	r1, #20752	; 0x5110
    2788:	e3401000 	movt	r1, #0
    278c:	e3a00001 	mov	r0, #1
}
    2790:	e24bd00c 	sub	sp, fp, #12
    2794:	e8bd4830 	pop	{r4, r5, fp, lr}
      close(fd);
    unlink("xx");
  }

  chdir("/");
  printf(1, "empty file name OK\n");
    2798:	ea0004be 	b	3a98 <printf>
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    279c:	e30510e8 	movw	r1, #20712	; 0x50e8
    27a0:	e3a00001 	mov	r0, #1
    27a4:	e3401000 	movt	r1, #0
    27a8:	eb0004ba 	bl	3a98 <printf>
      exit();
    27ac:	eb00036e 	bl	356c <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    27b0:	e30510fc 	movw	r1, #20732	; 0x50fc
    27b4:	e3a00001 	mov	r0, #1
    27b8:	e3401000 	movt	r1, #0
    27bc:	eb0004b5 	bl	3a98 <printf>
      exit();
    27c0:	eb000369 	bl	356c <exit>

000027c4 <forktest>:
void
forktest(void)
{
  int n, pid;

  printf(1, "fork test\n");
    27c4:	e3051124 	movw	r1, #20772	; 0x5124
    27c8:	e3a00001 	mov	r0, #1
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    27cc:	e92d4830 	push	{r4, r5, fp, lr}
  int n, pid;

  printf(1, "fork test\n");
    27d0:	e3401000 	movt	r1, #0
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    27d4:	e28db00c 	add	fp, sp, #12
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    27d8:	e3a04000 	mov	r4, #0
void
forktest(void)
{
  int n, pid;

  printf(1, "fork test\n");
    27dc:	eb0004ad 	bl	3a98 <printf>
    27e0:	ea000003 	b	27f4 <forktest+0x30>

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    27e4:	0a00001e 	beq	2864 <forktest+0xa0>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    27e8:	e2844001 	add	r4, r4, #1
    27ec:	e3540ffa 	cmp	r4, #1000	; 0x3e8
    27f0:	0a000012 	beq	2840 <forktest+0x7c>
    pid = fork();
    27f4:	eb00034f 	bl	3538 <fork>
    if(pid < 0)
    27f8:	e3500000 	cmp	r0, #0
    27fc:	aafffff8 	bge	27e4 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    2800:	e3540000 	cmp	r4, #0
    2804:	0a000004 	beq	281c <forktest+0x58>
    if(wait() < 0){
    2808:	eb000364 	bl	35a0 <wait>
    280c:	e3500000 	cmp	r0, #0
    2810:	ba00000f 	blt	2854 <forktest+0x90>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    2814:	e2544001 	subs	r4, r4, #1
    2818:	1afffffa 	bne	2808 <forktest+0x44>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    281c:	eb00035f 	bl	35a0 <wait>
    2820:	e3700001 	cmn	r0, #1
    2824:	1a00000f 	bne	2868 <forktest+0xa4>
    printf(1, "wait got too many\n");
    exit();
  }
  
  printf(1, "fork test OK\n");
    2828:	e3051158 	movw	r1, #20824	; 0x5158
    282c:	e3a00001 	mov	r0, #1
    2830:	e3401000 	movt	r1, #0
}
    2834:	e24bd00c 	sub	sp, fp, #12
    2838:	e8bd4830 	pop	{r4, r5, fp, lr}
  if(wait() != -1){
    printf(1, "wait got too many\n");
    exit();
  }
  
  printf(1, "fork test OK\n");
    283c:	ea000495 	b	3a98 <printf>
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    2840:	e3051168 	movw	r1, #20840	; 0x5168
    2844:	e3a00001 	mov	r0, #1
    2848:	e3401000 	movt	r1, #0
    284c:	eb000491 	bl	3a98 <printf>
    exit();
    2850:	eb000345 	bl	356c <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    2854:	e3051130 	movw	r1, #20784	; 0x5130
    2858:	e3a00001 	mov	r0, #1
    285c:	e3401000 	movt	r1, #0
    2860:	eb00048c 	bl	3a98 <printf>
      exit();
    2864:	eb000340 	bl	356c <exit>
    }
  }
  
  if(wait() != -1){
    printf(1, "wait got too many\n");
    2868:	e3051144 	movw	r1, #20804	; 0x5144
    286c:	e3a00001 	mov	r0, #1
    2870:	e3401000 	movt	r1, #0
    2874:	eb000487 	bl	3a98 <printf>
    exit();
    2878:	eb00033b 	bl	356c <exit>

0000287c <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    287c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  int fds[2], pid, pids[5], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2880:	e3056810 	movw	r6, #22544	; 0x5810
    2884:	e3406000 	movt	r6, #0
    2888:	e305118c 	movw	r1, #20876	; 0x518c
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    288c:	e28db01c 	add	fp, sp, #28
  int fds[2], pid, pids[5], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2890:	e3401000 	movt	r1, #0
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2894:	e24dd028 	sub	sp, sp, #40	; 0x28

  // can one sbrk() less than a page?
  printf(stdout, "test #1 sbrk() less than a page?\n");
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    2898:	e3a05000 	mov	r5, #0
{
  int fds[2], pid, pids[5], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    289c:	e5960000 	ldr	r0, [r6]
    28a0:	eb00047c 	bl	3a98 <printf>
  oldbrk = sbrk(0);
    28a4:	e1a00005 	mov	r0, r5
    28a8:	eb00040c 	bl	38e0 <sbrk>

  // can one sbrk() less than a page?
  printf(stdout, "test #1 sbrk() less than a page?\n");
    28ac:	e3051198 	movw	r1, #20888	; 0x5198
    28b0:	e3401000 	movt	r1, #0
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    b = sbrk(1);
    28b4:	e3a09001 	mov	r9, #1

  // can one sbrk() less than a page?
  printf(stdout, "test #1 sbrk() less than a page?\n");
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    28b8:	e3018388 	movw	r8, #5000	; 0x1388
  int fds[2], pid, pids[5], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    28bc:	e1a07000 	mov	r7, r0

  // can one sbrk() less than a page?
  printf(stdout, "test #1 sbrk() less than a page?\n");
    28c0:	e5960000 	ldr	r0, [r6]
    28c4:	eb000473 	bl	3a98 <printf>
  a = sbrk(0);
    28c8:	e1a00005 	mov	r0, r5
    28cc:	eb000403 	bl	38e0 <sbrk>
    28d0:	e1a04000 	mov	r4, r0
  int i;
  for(i = 0; i < 5000; i++){ 
    b = sbrk(1);
    28d4:	e3a00001 	mov	r0, #1
    28d8:	eb000400 	bl	38e0 <sbrk>
    if(b != a){
    28dc:	e1500004 	cmp	r0, r4
    28e0:	1a0000fd 	bne	2cdc <sbrktest+0x460>

  // can one sbrk() less than a page?
  printf(stdout, "test #1 sbrk() less than a page?\n");
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    28e4:	e2855001 	add	r5, r5, #1
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    28e8:	e4c49001 	strb	r9, [r4], #1

  // can one sbrk() less than a page?
  printf(stdout, "test #1 sbrk() less than a page?\n");
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    28ec:	e1550008 	cmp	r5, r8
    28f0:	1afffff7 	bne	28d4 <sbrktest+0x58>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  printf(stdout, "test #1 done.\n");
    28f4:	e30511d8 	movw	r1, #20952	; 0x51d8
    28f8:	e5960000 	ldr	r0, [r6]
    28fc:	e3401000 	movt	r1, #0
    2900:	e3055810 	movw	r5, #22544	; 0x5810
    2904:	eb000463 	bl	3a98 <printf>

  printf(stdout, "test #2 test fork?\n");
    2908:	e30511e8 	movw	r1, #20968	; 0x51e8
    290c:	e3401000 	movt	r1, #0
    2910:	e5960000 	ldr	r0, [r6]
    2914:	eb00045f 	bl	3a98 <printf>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  printf(stdout, "test #1 done.\n");
    2918:	e3405000 	movt	r5, #0

  printf(stdout, "test #2 test fork?\n");
  pid = fork();
    291c:	eb000305 	bl	3538 <fork>
  if(pid < 0){
    2920:	e2508000 	subs	r8, r0, #0
    2924:	ba0000f5 	blt	2d00 <sbrktest+0x484>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  printf(stdout, "test #2 done.\n");
    2928:	e3051214 	movw	r1, #21012	; 0x5214
    292c:	e5950000 	ldr	r0, [r5]
    2930:	e3401000 	movt	r1, #0

  printf(stdout, "test #3 post-fork.\n");
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    2934:	e2844001 	add	r4, r4, #1
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  printf(stdout, "test #2 done.\n");
    2938:	eb000456 	bl	3a98 <printf>

  printf(stdout, "test #3 post-fork.\n");
    293c:	e3051224 	movw	r1, #21028	; 0x5224
    2940:	e3401000 	movt	r1, #0
    2944:	e5950000 	ldr	r0, [r5]
    2948:	eb000452 	bl	3a98 <printf>
  c = sbrk(1);
    294c:	e3a00001 	mov	r0, #1
    2950:	eb0003e2 	bl	38e0 <sbrk>
  c = sbrk(1);
    2954:	e3a00001 	mov	r0, #1
    2958:	eb0003e0 	bl	38e0 <sbrk>
  if(c != a + 1){
    295c:	e1540000 	cmp	r4, r0
    2960:	1a0000eb 	bne	2d14 <sbrktest+0x498>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2964:	e3580000 	cmp	r8, #0
    2968:	0a0000f2 	beq	2d38 <sbrktest+0x4bc>
    exit();
  wait();
    296c:	eb00030b 	bl	35a0 <wait>
  printf(stdout, "test #3 done.\n");
    2970:	e3051254 	movw	r1, #21076	; 0x5254
    2974:	e3401000 	movt	r1, #0
    2978:	e5950000 	ldr	r0, [r5]
    297c:	eb000445 	bl	3a98 <printf>

  printf(stdout, "test #4 grow address space to something big.\n");
    2980:	e3051264 	movw	r1, #21092	; 0x5264
    2984:	e3401000 	movt	r1, #0
    2988:	e5950000 	ldr	r0, [r5]
    298c:	eb000441 	bl	3a98 <printf>
  // can one grow address space to something big?
  #define BIG (100*1024*1024)
  a = sbrk(0);
    2990:	e3a00000 	mov	r0, #0
    2994:	eb0003d1 	bl	38e0 <sbrk>
    2998:	e1a04000 	mov	r4, r0
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    299c:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    29a0:	eb0003ce 	bl	38e0 <sbrk>
  if (p != a) { 
    29a4:	e1540000 	cmp	r4, r0
    29a8:	1a0000de 	bne	2d28 <sbrktest+0x4ac>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    29ac:	e30f3fff 	movw	r3, #65535	; 0xffff
  printf(stdout, "test #4 done.\n");
    29b0:	e30512d4 	movw	r1, #21204	; 0x52d4
  if (p != a) { 
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    29b4:	e340363f 	movt	r3, #1599	; 0x63f
    29b8:	e3a02063 	mov	r2, #99	; 0x63
  printf(stdout, "test #4 done.\n");
    29bc:	e3401000 	movt	r1, #0
  if (p != a) { 
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    29c0:	e5c32000 	strb	r2, [r3]
  printf(stdout, "test #4 done.\n");
    29c4:	e5950000 	ldr	r0, [r5]
    29c8:	eb000432 	bl	3a98 <printf>

  printf(stdout, "test #5 de-allocate\n");
    29cc:	e30512e4 	movw	r1, #21220	; 0x52e4
    29d0:	e3401000 	movt	r1, #0
    29d4:	e5950000 	ldr	r0, [r5]
    29d8:	eb00042e 	bl	3a98 <printf>
  // can one de-allocate?
  a = sbrk(0);
    29dc:	e3a00000 	mov	r0, #0
    29e0:	eb0003be 	bl	38e0 <sbrk>
    29e4:	e1a04000 	mov	r4, r0
  c = sbrk(-4096);
    29e8:	e3a00a0f 	mov	r0, #61440	; 0xf000
    29ec:	e34f0fff 	movt	r0, #65535	; 0xffff
    29f0:	eb0003ba 	bl	38e0 <sbrk>
  if(c == (char*)0xffffffff){
    29f4:	e3700001 	cmn	r0, #1
    29f8:	0a0000cf 	beq	2d3c <sbrktest+0x4c0>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    29fc:	e3a00000 	mov	r0, #0
    2a00:	eb0003b6 	bl	38e0 <sbrk>
  if(c != a - 4096){
    2a04:	e2442a01 	sub	r2, r4, #4096	; 0x1000
    2a08:	e1500002 	cmp	r0, r2
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2a0c:	e1a03000 	mov	r3, r0
  if(c != a - 4096){
    2a10:	1a0000ce 	bne	2d50 <sbrktest+0x4d4>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }
  printf(stdout, "test #5 done.\n");
    2a14:	e3051350 	movw	r1, #21328	; 0x5350
    2a18:	e5950000 	ldr	r0, [r5]
    2a1c:	e3401000 	movt	r1, #0
    2a20:	eb00041c 	bl	3a98 <printf>

  printf(stdout, "test #6 re-allocate page.\n");
    2a24:	e3051360 	movw	r1, #21344	; 0x5360
    2a28:	e5950000 	ldr	r0, [r5]
    2a2c:	e3401000 	movt	r1, #0
    2a30:	eb000418 	bl	3a98 <printf>
  // can one re-allocate that page?
  a = sbrk(0);
    2a34:	e3a00000 	mov	r0, #0
    2a38:	eb0003a8 	bl	38e0 <sbrk>
    2a3c:	e1a04000 	mov	r4, r0
  c = sbrk(4096);
    2a40:	e3a00a01 	mov	r0, #4096	; 0x1000
    2a44:	eb0003a5 	bl	38e0 <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2a48:	e1540000 	cmp	r4, r0
  printf(stdout, "test #5 done.\n");

  printf(stdout, "test #6 re-allocate page.\n");
  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    2a4c:	e1a05000 	mov	r5, r0
  if(c != a || sbrk(0) != a + 4096){
    2a50:	1a0000c4 	bne	2d68 <sbrktest+0x4ec>
    2a54:	e3a00000 	mov	r0, #0
    2a58:	eb0003a0 	bl	38e0 <sbrk>
    2a5c:	e2843a01 	add	r3, r4, #4096	; 0x1000
    2a60:	e1530000 	cmp	r3, r0
    2a64:	1a0000bf 	bne	2d68 <sbrktest+0x4ec>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2a68:	e30f3fff 	movw	r3, #65535	; 0xffff
    2a6c:	e340363f 	movt	r3, #1599	; 0x63f
    2a70:	e5d33000 	ldrb	r3, [r3]
    2a74:	e3530063 	cmp	r3, #99	; 0x63
    2a78:	0a0000c1 	beq	2d84 <sbrktest+0x508>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }
  printf(stdout, "test #6 done.\n");
    2a7c:	e30513d4 	movw	r1, #21460	; 0x53d4
    2a80:	e5960000 	ldr	r0, [r6]
    2a84:	e3401000 	movt	r1, #0
    2a88:	e3054810 	movw	r4, #22544	; 0x5810
    2a8c:	eb000401 	bl	3a98 <printf>

  printf(stdout, "test #7 downsize.\n");
    2a90:	e30513e4 	movw	r1, #21476	; 0x53e4
    2a94:	e3401000 	movt	r1, #0
    2a98:	e5960000 	ldr	r0, [r6]
    2a9c:	eb0003fd 	bl	3a98 <printf>
  a = sbrk(0);
    2aa0:	e3a00000 	mov	r0, #0
    2aa4:	eb00038d 	bl	38e0 <sbrk>
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }
  printf(stdout, "test #6 done.\n");
    2aa8:	e3404000 	movt	r4, #0

  printf(stdout, "test #7 downsize.\n");
  a = sbrk(0);
    2aac:	e1a05000 	mov	r5, r0
  c = sbrk(-(sbrk(0) - oldbrk));
    2ab0:	e3a00000 	mov	r0, #0
    2ab4:	eb000389 	bl	38e0 <sbrk>
    2ab8:	e0600007 	rsb	r0, r0, r7
    2abc:	eb000387 	bl	38e0 <sbrk>
  if(c != a){
    2ac0:	e1550000 	cmp	r5, r0
  }
  printf(stdout, "test #6 done.\n");

  printf(stdout, "test #7 downsize.\n");
  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
    2ac4:	e1a03000 	mov	r3, r0
  if(c != a){
    2ac8:	1a0000b2 	bne	2d98 <sbrktest+0x51c>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  printf(stdout, "test #7 done.\n");
    2acc:	e305141c 	movw	r1, #21532	; 0x541c
    2ad0:	e5940000 	ldr	r0, [r4]
    2ad4:	e3401000 	movt	r1, #0

  printf(stdout, "test #8 read the kernel's memory.\n");
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ad8:	e3085480 	movw	r5, #33920	; 0x8480
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  printf(stdout, "test #7 done.\n");
    2adc:	eb0003ed 	bl	3a98 <printf>

  printf(stdout, "test #8 read the kernel's memory.\n");
    2ae0:	e305142c 	movw	r1, #21548	; 0x542c
    2ae4:	e5940000 	ldr	r0, [r4]
    2ae8:	e3401000 	movt	r1, #0
    2aec:	eb0003e9 	bl	3a98 <printf>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2af0:	e348501e 	movt	r5, #32798	; 0x801e
    2af4:	e3a04102 	mov	r4, #-2147483648	; 0x80000000
    ppid = getpid();
    2af8:	eb00036b 	bl	38ac <getpid>
    2afc:	e1a08000 	mov	r8, r0
    pid = fork();
    2b00:	eb00028c 	bl	3538 <fork>
    if(pid < 0){
    2b04:	e3500000 	cmp	r0, #0
    2b08:	ba0000a8 	blt	2db0 <sbrktest+0x534>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2b0c:	0a0000ac 	beq	2dc4 <sbrktest+0x548>
  }
  printf(stdout, "test #7 done.\n");

  printf(stdout, "test #8 read the kernel's memory.\n");
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b10:	e2844cc3 	add	r4, r4, #49920	; 0xc300
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2b14:	eb0002a1 	bl	35a0 <wait>
  }
  printf(stdout, "test #7 done.\n");

  printf(stdout, "test #8 read the kernel's memory.\n");
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2b18:	e2844050 	add	r4, r4, #80	; 0x50
    2b1c:	e1540005 	cmp	r4, r5
    2b20:	1afffff4 	bne	2af8 <sbrktest+0x27c>
      kill(ppid);
      exit();
    }
    wait();
  }
  printf(stdout, "test #8 done.\n");
    2b24:	e305146c 	movw	r1, #21612	; 0x546c
    2b28:	e5960000 	ldr	r0, [r6]
    2b2c:	e3401000 	movt	r1, #0
    2b30:	e3055810 	movw	r5, #22544	; 0x5810
    2b34:	eb0003d7 	bl	3a98 <printf>

  printf(stdout, "test #9 clean up the last failed allocation\n");
    2b38:	e305147c 	movw	r1, #21628	; 0x547c
    2b3c:	e3401000 	movt	r1, #0
    2b40:	e5960000 	ldr	r0, [r6]
    2b44:	eb0003d3 	bl	3a98 <printf>
  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2b48:	e24b0038 	sub	r0, fp, #56	; 0x38
    2b4c:	eb0002a0 	bl	35d4 <pipe>
      kill(ppid);
      exit();
    }
    wait();
  }
  printf(stdout, "test #8 done.\n");
    2b50:	e3405000 	movt	r5, #0

  printf(stdout, "test #9 clean up the last failed allocation\n");
  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2b54:	e2504000 	subs	r4, r0, #0
    2b58:	1a0000a2 	bne	2de8 <sbrktest+0x56c>
    printf(1, "pipe() failed\n");
    exit();
  }
  printf(stdout, "test #9 done.\n");
    2b5c:	e30514ac 	movw	r1, #21676	; 0x54ac
    2b60:	e5950000 	ldr	r0, [r5]
    2b64:	e3401000 	movt	r1, #0
    2b68:	e24b8030 	sub	r8, fp, #48	; 0x30
    2b6c:	eb0003c9 	bl	3a98 <printf>

  printf(stdout, "test #10 memory utilization 1.\n");
    2b70:	e30514bc 	movw	r1, #21692	; 0x54bc
    2b74:	e5950000 	ldr	r0, [r5]
    2b78:	e3401000 	movt	r1, #0
    2b7c:	eb0003c5 	bl	3a98 <printf>
    2b80:	e1a09008 	mov	r9, r8
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    2b84:	eb00026b 	bl	3538 <fork>
    2b88:	e3500000 	cmp	r0, #0
    2b8c:	e1a05000 	mov	r5, r0
    2b90:	e4890004 	str	r0, [r9], #4
    2b94:	0a00003a 	beq	2c84 <sbrktest+0x408>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    2b98:	e3700001 	cmn	r0, #1
    2b9c:	0a000003 	beq	2bb0 <sbrktest+0x334>
      read(fds[0], &scratch, 1);
    2ba0:	e3a02001 	mov	r2, #1
    2ba4:	e24b1039 	sub	r1, fp, #57	; 0x39
    2ba8:	e51b0038 	ldr	r0, [fp, #-56]	; 0xffffffc8
    2bac:	eb000295 	bl	3608 <read>
    exit();
  }
  printf(stdout, "test #9 done.\n");

  printf(stdout, "test #10 memory utilization 1.\n");
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2bb0:	e2844001 	add	r4, r4, #1
    2bb4:	e3540005 	cmp	r4, #5
    2bb8:	1afffff1 	bne	2b84 <sbrktest+0x308>
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  printf(stdout, "test #10 done.\n");
    2bbc:	e3051554 	movw	r1, #21844	; 0x5554
    2bc0:	e5960000 	ldr	r0, [r6]
    2bc4:	e3401000 	movt	r1, #0
    2bc8:	e24b401c 	sub	r4, fp, #28
    2bcc:	eb0003b1 	bl	3a98 <printf>

  printf(stdout, "test #11 memory utilization 2.\n");
    2bd0:	e3051564 	movw	r1, #21860	; 0x5564
    2bd4:	e3401000 	movt	r1, #0
    2bd8:	e5960000 	ldr	r0, [r6]
    2bdc:	eb0003ad 	bl	3a98 <printf>
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2be0:	e3a00a01 	mov	r0, #4096	; 0x1000
    2be4:	eb00033d 	bl	38e0 <sbrk>
    2be8:	e1a05000 	mov	r5, r0
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    2bec:	e4980004 	ldr	r0, [r8], #4
    2bf0:	e3700001 	cmn	r0, #1
    2bf4:	0a000001 	beq	2c00 <sbrktest+0x384>
      continue;
    kill(pids[i]);
    2bf8:	eb0002a9 	bl	36a4 <kill>
    wait();
    2bfc:	eb000267 	bl	35a0 <wait>

  printf(stdout, "test #11 memory utilization 2.\n");
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2c00:	e1580004 	cmp	r8, r4
    2c04:	1afffff8 	bne	2bec <sbrktest+0x370>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  printf(stdout, "test #11 done.\n");
    2c08:	e30514ec 	movw	r1, #21740	; 0x54ec
    2c0c:	e5960000 	ldr	r0, [r6]
    2c10:	e3401000 	movt	r1, #0
    2c14:	e3054810 	movw	r4, #22544	; 0x5810
    2c18:	eb00039e 	bl	3a98 <printf>

  printf(stdout, "test #12 leaked memory.\n");
    2c1c:	e30514fc 	movw	r1, #21756	; 0x54fc
    2c20:	e3401000 	movt	r1, #0
    2c24:	e5960000 	ldr	r0, [r6]
    2c28:	eb00039a 	bl	3a98 <printf>
  if(c == (char*)0xffffffff){
    2c2c:	e3750001 	cmn	r5, #1
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  printf(stdout, "test #11 done.\n");
    2c30:	e3404000 	movt	r4, #0

  printf(stdout, "test #12 leaked memory.\n");
  if(c == (char*)0xffffffff){
    2c34:	0a000023 	beq	2cc8 <sbrktest+0x44c>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }
  printf(stdout, "test #12 done.\n");
    2c38:	e3051534 	movw	r1, #21812	; 0x5534
    2c3c:	e5940000 	ldr	r0, [r4]
    2c40:	e3401000 	movt	r1, #0
    2c44:	eb000393 	bl	3a98 <printf>

  if(sbrk(0) > oldbrk)
    2c48:	e3a00000 	mov	r0, #0
    2c4c:	eb000323 	bl	38e0 <sbrk>
    2c50:	e1570000 	cmp	r7, r0
    2c54:	3a000005 	bcc	2c70 <sbrktest+0x3f4>
    sbrk(-(sbrk(0) - oldbrk));

  printf(stdout, "sbrk test OK\n");
    2c58:	e3051544 	movw	r1, #21828	; 0x5544
    2c5c:	e5960000 	ldr	r0, [r6]
    2c60:	e3401000 	movt	r1, #0
    2c64:	eb00038b 	bl	3a98 <printf>
}
    2c68:	e24bd01c 	sub	sp, fp, #28
    2c6c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    exit();
  }
  printf(stdout, "test #12 done.\n");

  if(sbrk(0) > oldbrk)
    sbrk(-(sbrk(0) - oldbrk));
    2c70:	e3a00000 	mov	r0, #0
    2c74:	eb000319 	bl	38e0 <sbrk>
    2c78:	e0600007 	rsb	r0, r0, r7
    2c7c:	eb000317 	bl	38e0 <sbrk>
    2c80:	eafffff4 	b	2c58 <sbrktest+0x3dc>
  printf(stdout, "test #9 done.\n");

  printf(stdout, "test #10 memory utilization 1.\n");
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      printf(stdout, "create pid:%d.\n",i);
    2c84:	e30514dc 	movw	r1, #21724	; 0x54dc
    2c88:	e1a02004 	mov	r2, r4
    2c8c:	e3401000 	movt	r1, #0
    2c90:	e5960000 	ldr	r0, [r6]
    2c94:	eb00037f 	bl	3a98 <printf>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2c98:	e1a00005 	mov	r0, r5
    2c9c:	eb00030f 	bl	38e0 <sbrk>
    2ca0:	e2600519 	rsb	r0, r0, #104857600	; 0x6400000
    2ca4:	eb00030d 	bl	38e0 <sbrk>
      write(fds[1], "x", 1);
    2ca8:	e3041ae8 	movw	r1, #19176	; 0x4ae8
    2cac:	e3401000 	movt	r1, #0
    2cb0:	e3a02001 	mov	r2, #1
    2cb4:	e51b0034 	ldr	r0, [fp, #-52]	; 0xffffffcc
    2cb8:	eb00025f 	bl	363c <write>
      // sit around until killed
      for(;;) sleep(1000);
    2cbc:	e3a00ffa 	mov	r0, #1000	; 0x3e8
    2cc0:	eb000313 	bl	3914 <sleep>
    2cc4:	eafffffc 	b	2cbc <sbrktest+0x440>
  }
  printf(stdout, "test #11 done.\n");

  printf(stdout, "test #12 leaked memory.\n");
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    2cc8:	e3051518 	movw	r1, #21784	; 0x5518
    2ccc:	e5940000 	ldr	r0, [r4]
    2cd0:	e3401000 	movt	r1, #0
    2cd4:	eb00036f 	bl	3a98 <printf>
    exit();
    2cd8:	eb000223 	bl	356c <exit>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2cdc:	e596c000 	ldr	ip, [r6]
    2ce0:	e30511bc 	movw	r1, #20924	; 0x51bc
    2ce4:	e58d0000 	str	r0, [sp]
    2ce8:	e1a03004 	mov	r3, r4
    2cec:	e1a02005 	mov	r2, r5
    2cf0:	e3401000 	movt	r1, #0
    2cf4:	e1a0000c 	mov	r0, ip
    2cf8:	eb000366 	bl	3a98 <printf>
      exit();
    2cfc:	eb00021a 	bl	356c <exit>
  printf(stdout, "test #1 done.\n");

  printf(stdout, "test #2 test fork?\n");
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    2d00:	e30511fc 	movw	r1, #20988	; 0x51fc
    2d04:	e5950000 	ldr	r0, [r5]
    2d08:	e3401000 	movt	r1, #0
    2d0c:	eb000361 	bl	3a98 <printf>
    exit();
    2d10:	eb000215 	bl	356c <exit>

  printf(stdout, "test #3 post-fork.\n");
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    2d14:	e3051238 	movw	r1, #21048	; 0x5238
    2d18:	e5950000 	ldr	r0, [r5]
    2d1c:	e3401000 	movt	r1, #0
    2d20:	eb00035c 	bl	3a98 <printf>
    exit();
    2d24:	eb000210 	bl	356c <exit>
  #define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) { 
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2d28:	e3051294 	movw	r1, #21140	; 0x5294
    2d2c:	e5950000 	ldr	r0, [r5]
    2d30:	e3401000 	movt	r1, #0
    2d34:	eb000357 	bl	3a98 <printf>
    exit();
    2d38:	eb00020b 	bl	356c <exit>
  printf(stdout, "test #5 de-allocate\n");
  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    2d3c:	e30512fc 	movw	r1, #21244	; 0x52fc
    2d40:	e5950000 	ldr	r0, [r5]
    2d44:	e3401000 	movt	r1, #0
    2d48:	eb000352 	bl	3a98 <printf>
    exit();
    2d4c:	eb000206 	bl	356c <exit>
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    2d50:	e3051318 	movw	r1, #21272	; 0x5318
    2d54:	e1a02004 	mov	r2, r4
    2d58:	e5950000 	ldr	r0, [r5]
    2d5c:	e3401000 	movt	r1, #0
    2d60:	eb00034c 	bl	3a98 <printf>
    exit();
    2d64:	eb000200 	bl	356c <exit>
  printf(stdout, "test #6 re-allocate page.\n");
  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    2d68:	e305137c 	movw	r1, #21372	; 0x537c
    2d6c:	e1a03005 	mov	r3, r5
    2d70:	e1a02004 	mov	r2, r4
    2d74:	e5960000 	ldr	r0, [r6]
    2d78:	e3401000 	movt	r1, #0
    2d7c:	eb000345 	bl	3a98 <printf>
    exit();
    2d80:	eb0001f9 	bl	356c <exit>
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    2d84:	e30513a4 	movw	r1, #21412	; 0x53a4
    2d88:	e5960000 	ldr	r0, [r6]
    2d8c:	e3401000 	movt	r1, #0
    2d90:	eb000340 	bl	3a98 <printf>
    exit();
    2d94:	eb0001f4 	bl	356c <exit>

  printf(stdout, "test #7 downsize.\n");
  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    2d98:	e30513f8 	movw	r1, #21496	; 0x53f8
    2d9c:	e1a02005 	mov	r2, r5
    2da0:	e5940000 	ldr	r0, [r4]
    2da4:	e3401000 	movt	r1, #0
    2da8:	eb00033a 	bl	3a98 <printf>
    exit();
    2dac:	eb0001ee 	bl	356c <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    2db0:	e3051714 	movw	r1, #22292	; 0x5714
    2db4:	e5960000 	ldr	r0, [r6]
    2db8:	e3401000 	movt	r1, #0
    2dbc:	eb000335 	bl	3a98 <printf>
      exit();
    2dc0:	eb0001e9 	bl	356c <exit>
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    2dc4:	e3051450 	movw	r1, #21584	; 0x5450
    2dc8:	e5960000 	ldr	r0, [r6]
    2dcc:	e3401000 	movt	r1, #0
    2dd0:	e5d43000 	ldrb	r3, [r4]
    2dd4:	e1a02004 	mov	r2, r4
    2dd8:	eb00032e 	bl	3a98 <printf>
      kill(ppid);
    2ddc:	e1a00008 	mov	r0, r8
    2de0:	eb00022f 	bl	36a4 <kill>
      exit();
    2de4:	eb0001e0 	bl	356c <exit>

  printf(stdout, "test #9 clean up the last failed allocation\n");
  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    2de8:	e3041118 	movw	r1, #16664	; 0x4118
    2dec:	e3a00001 	mov	r0, #1
    2df0:	e3401000 	movt	r1, #0
    2df4:	eb000327 	bl	3a98 <printf>
    exit();
    2df8:	eb0001db 	bl	356c <exit>

00002dfc <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    2dfc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2e00:	e28db000 	add	fp, sp, #0
    sleep(*p);
    2e04:	e5900000 	ldr	r0, [r0]
}
    2e08:	e24bd000 	sub	sp, fp, #0
    2e0c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
}

void
validateint(int *p)
{
    sleep(*p);
    2e10:	ea0002bf 	b	3914 <sleep>

00002e14 <validatetest>:
}

void
validatetest(void)
{
    2e14:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    2e18:	e3056810 	movw	r6, #22544	; 0x5810
    2e1c:	e3051584 	movw	r1, #21892	; 0x5584
    2e20:	e3406000 	movt	r6, #0
    sleep(*p);
}

void
validatetest(void)
{
    2e24:	e28db014 	add	fp, sp, #20
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    2e28:	e3401000 	movt	r1, #0
    2e2c:	e5960000 	ldr	r0, [r6]
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    2e30:	e3a04000 	mov	r4, #0
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    2e34:	eb000317 	bl	3a98 <printf>
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    2e38:	eb0001be 	bl	3538 <fork>
    2e3c:	e2505000 	subs	r5, r0, #0
    2e40:	0a000015 	beq	2e9c <validatetest+0x88>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    2e44:	e3a00000 	mov	r0, #0
    2e48:	eb0002b1 	bl	3914 <sleep>
    sleep(0);
    2e4c:	e3a00000 	mov	r0, #0
    2e50:	eb0002af 	bl	3914 <sleep>
    kill(pid);
    2e54:	e1a00005 	mov	r0, r5
    2e58:	eb000211 	bl	36a4 <kill>
    wait();
    2e5c:	eb0001cf 	bl	35a0 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    2e60:	e3050594 	movw	r0, #21908	; 0x5594
    2e64:	e1a01004 	mov	r1, r4
    2e68:	e3400000 	movt	r0, #0
    2e6c:	eb00025a 	bl	37dc <link>
    2e70:	e3700001 	cmn	r0, #1
    2e74:	1a00000b 	bne	2ea8 <validatetest+0x94>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    2e78:	e2844a01 	add	r4, r4, #4096	; 0x1000
    2e7c:	e3540945 	cmp	r4, #1130496	; 0x114000
    2e80:	1affffec 	bne	2e38 <validatetest+0x24>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    2e84:	e30515bc 	movw	r1, #21948	; 0x55bc
    2e88:	e5960000 	ldr	r0, [r6]
    2e8c:	e3401000 	movt	r1, #0
}
    2e90:	e24bd014 	sub	sp, fp, #20
    2e94:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    2e98:	ea0002fe 	b	3a98 <printf>
}

void
validateint(int *p)
{
    sleep(*p);
    2e9c:	e5940000 	ldr	r0, [r4]
    2ea0:	eb00029b 	bl	3914 <sleep>

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    2ea4:	eb0001b0 	bl	356c <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    2ea8:	e30515a0 	movw	r1, #21920	; 0x55a0
    2eac:	e5960000 	ldr	r0, [r6]
    2eb0:	e3401000 	movt	r1, #0
    2eb4:	eb0002f7 	bl	3a98 <printf>
      exit();
    2eb8:	eb0001ab 	bl	356c <exit>

00002ebc <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    2ebc:	e92d4830 	push	{r4, r5, fp, lr}
  int i;

  printf(stdout, "bss test\n");
    2ec0:	e3054810 	movw	r4, #22544	; 0x5810
    2ec4:	e30515cc 	movw	r1, #21964	; 0x55cc
    2ec8:	e3404000 	movt	r4, #0

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    2ecc:	e28db00c 	add	fp, sp, #12
  int i;

  printf(stdout, "bss test\n");
    2ed0:	e3401000 	movt	r1, #0
    2ed4:	e5940000 	ldr	r0, [r4]
    2ed8:	eb0002ee 	bl	3a98 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    2edc:	e30538b8 	movw	r3, #22712	; 0x58b8
    2ee0:	e3403000 	movt	r3, #0
    2ee4:	e5d32000 	ldrb	r2, [r3]
    2ee8:	e3520000 	cmp	r2, #0
    2eec:	1a00000c 	bne	2f24 <bsstest+0x68>
    2ef0:	e3071fc7 	movw	r1, #32711	; 0x7fc7
    2ef4:	e3401000 	movt	r1, #0
    2ef8:	e5f32001 	ldrb	r2, [r3, #1]!
    2efc:	e3520000 	cmp	r2, #0
    2f00:	1a000007 	bne	2f24 <bsstest+0x68>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    2f04:	e1530001 	cmp	r3, r1
    2f08:	1afffffa 	bne	2ef8 <bsstest+0x3c>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    2f0c:	e30515ec 	movw	r1, #21996	; 0x55ec
    2f10:	e5940000 	ldr	r0, [r4]
    2f14:	e3401000 	movt	r1, #0
}
    2f18:	e24bd00c 	sub	sp, fp, #12
    2f1c:	e8bd4830 	pop	{r4, r5, fp, lr}
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    2f20:	ea0002dc 	b	3a98 <printf>
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    2f24:	e30515d8 	movw	r1, #21976	; 0x55d8
    2f28:	e5940000 	ldr	r0, [r4]
    2f2c:	e3401000 	movt	r1, #0
    2f30:	eb0002d8 	bl	3a98 <printf>
      exit();
    2f34:	eb00018c 	bl	356c <exit>

00002f38 <bigargtest>:
void
bigargtest(void)
{
  int pid, fd;

  unlink("bigarg-ok");
    2f38:	e30505fc 	movw	r0, #22012	; 0x55fc
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    2f3c:	e92d4830 	push	{r4, r5, fp, lr}
  int pid, fd;

  unlink("bigarg-ok");
    2f40:	e3400000 	movt	r0, #0
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    2f44:	e28db00c 	add	fp, sp, #12
  int pid, fd;

  unlink("bigarg-ok");
    2f48:	eb000209 	bl	3774 <unlink>
  pid = fork();
    2f4c:	eb000179 	bl	3538 <fork>
  if(pid == 0){
    2f50:	e3500000 	cmp	r0, #0
    2f54:	0a00000d 	beq	2f90 <bigargtest+0x58>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    2f58:	ba000033 	blt	302c <bigargtest+0xf4>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    2f5c:	eb00018f 	bl	35a0 <wait>
  fd = open("bigarg-ok", 0);
    2f60:	e30505fc 	movw	r0, #22012	; 0x55fc
    2f64:	e3400000 	movt	r0, #0
    2f68:	e3a01000 	mov	r1, #0
    2f6c:	eb0001e6 	bl	370c <open>
  if(fd < 0){
    2f70:	e3500000 	cmp	r0, #0
    2f74:	ba000025 	blt	3010 <bigargtest+0xd8>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    2f78:	eb0001bc 	bl	3670 <close>
  unlink("bigarg-ok");
    2f7c:	e30505fc 	movw	r0, #22012	; 0x55fc
    2f80:	e3400000 	movt	r0, #0
}
    2f84:	e24bd00c 	sub	sp, fp, #12
    2f88:	e8bd4830 	pop	{r4, r5, fp, lr}
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
  unlink("bigarg-ok");
    2f8c:	ea0001f8 	b	3774 <unlink>
    2f90:	e3053828 	movw	r3, #22568	; 0x5828
    2f94:	e3052608 	movw	r2, #22024	; 0x5608
    2f98:	e3403000 	movt	r3, #0
    2f9c:	e283107c 	add	r1, r3, #124	; 0x7c
    2fa0:	e3402000 	movt	r2, #0
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    2fa4:	e5a32004 	str	r2, [r3, #4]!
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    2fa8:	e1530001 	cmp	r3, r1
    2fac:	1afffffc 	bne	2fa4 <bigargtest+0x6c>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    2fb0:	e3054810 	movw	r4, #22544	; 0x5810
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    2fb4:	e305582c 	movw	r5, #22572	; 0x582c
    printf(stdout, "bigarg test\n");
    2fb8:	e3404000 	movt	r4, #0
    2fbc:	e30516e8 	movw	r1, #22248	; 0x56e8
    2fc0:	e5940000 	ldr	r0, [r4]
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    2fc4:	e3405000 	movt	r5, #0
    printf(stdout, "bigarg test\n");
    2fc8:	e3401000 	movt	r1, #0
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    2fcc:	e3a03000 	mov	r3, #0
    2fd0:	e585307c 	str	r3, [r5, #124]	; 0x7c
    printf(stdout, "bigarg test\n");
    2fd4:	eb0002af 	bl	3a98 <printf>
    exec("echo", args);
    2fd8:	e3030dc0 	movw	r0, #15808	; 0x3dc0
    2fdc:	e1a01005 	mov	r1, r5
    2fe0:	e3400000 	movt	r0, #0
    2fe4:	eb0001bb 	bl	36d8 <exec>
    printf(stdout, "bigarg test ok\n");
    2fe8:	e30516f8 	movw	r1, #22264	; 0x56f8
    2fec:	e5940000 	ldr	r0, [r4]
    2ff0:	e3401000 	movt	r1, #0
    2ff4:	eb0002a7 	bl	3a98 <printf>
    fd = open("bigarg-ok", O_CREATE);
    2ff8:	e30505fc 	movw	r0, #22012	; 0x55fc
    2ffc:	e3a01c02 	mov	r1, #512	; 0x200
    3000:	e3400000 	movt	r0, #0
    3004:	eb0001c0 	bl	370c <open>
    close(fd);
    3008:	eb000198 	bl	3670 <close>
    exit();
    300c:	eb000156 	bl	356c <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    3010:	e3053810 	movw	r3, #22544	; 0x5810
    3014:	e3051724 	movw	r1, #22308	; 0x5724
    3018:	e3403000 	movt	r3, #0
    301c:	e3401000 	movt	r1, #0
    3020:	e5930000 	ldr	r0, [r3]
    3024:	eb00029b 	bl	3a98 <printf>
    exit();
    3028:	eb00014f 	bl	356c <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    302c:	e3053810 	movw	r3, #22544	; 0x5810
    3030:	e3051708 	movw	r1, #22280	; 0x5708
    3034:	e3403000 	movt	r3, #0
    3038:	e3401000 	movt	r1, #0
    303c:	e5930000 	ldr	r0, [r3]
    3040:	eb000294 	bl	3a98 <printf>
    exit();
    3044:	eb000148 	bl	356c <exit>

00003048 <fsfull>:
fsfull()
{
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    3048:	e305173c 	movw	r1, #22332	; 0x573c

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    304c:	e3043dd3 	movw	r3, #19923	; 0x4dd3

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3050:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    3054:	e3a00001 	mov	r0, #1

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3058:	e28db020 	add	fp, sp, #32
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    305c:	e3401000 	movt	r1, #0

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3060:	e24dd054 	sub	sp, sp, #84	; 0x54
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3064:	e1a04003 	mov	r4, r3
fsfull()
{
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    3068:	eb00028a 	bl	3a98 <printf>
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    306c:	e3063667 	movw	r3, #26215	; 0x6667

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3070:	e308a51f 	movw	sl, #34079	; 0x851f
    name[3] = '0' + (nfiles % 100) / 10;
    3074:	e1a02003 	mov	r2, r3
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3078:	e1a03004 	mov	r3, r4
    307c:	e3413062 	movt	r3, #4194	; 0x1062
    name[2] = '0' + (nfiles % 1000) / 100;
    3080:	e345a1eb 	movt	sl, #20971	; 0x51eb
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3084:	e50b3070 	str	r3, [fp, #-112]	; 0xffffff90
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3088:	e3a04000 	mov	r4, #0
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    308c:	e1a03002 	mov	r3, r2
    3090:	e3463666 	movt	r3, #26214	; 0x6666
    3094:	e50b306c 	str	r3, [fp, #-108]	; 0xffffff94
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3098:	e51b3070 	ldr	r3, [fp, #-112]	; 0xffffff90
    309c:	e1a05fc4 	asr	r5, r4, #31
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    30a0:	e51bc06c 	ldr	ip, [fp, #-108]	; 0xffffff94
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    30a4:	e3a02064 	mov	r2, #100	; 0x64
    30a8:	e0c76a94 	smull	r6, r7, r4, sl

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    30ac:	e3a06066 	mov	r6, #102	; 0x66
    name[1] = '0' + nfiles / 1000;
    30b0:	e0c98394 	smull	r8, r9, r4, r3
    name[2] = '0' + (nfiles % 1000) / 100;
    30b4:	e3a03ffa 	mov	r3, #1000	; 0x3e8

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    30b8:	e54b6064 	strb	r6, [fp, #-100]	; 0xffffff9c
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    30bc:	e305174c 	movw	r1, #22348	; 0x574c
    30c0:	e3401000 	movt	r1, #0
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    30c4:	e0650349 	rsb	r0, r5, r9, asr #6
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    30c8:	e0c98c94 	smull	r8, r9, r4, ip
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    30cc:	e065c2c7 	rsb	ip, r5, r7, asr #5

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    30d0:	e0634093 	mls	r3, r3, r0, r4
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    30d4:	e2800030 	add	r0, r0, #48	; 0x30
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    30d8:	e06c4c92 	mls	ip, r2, ip, r4
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    30dc:	e54b0063 	strb	r0, [fp, #-99]	; 0xffffff9d
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    30e0:	e065e149 	rsb	lr, r5, r9, asr #2
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    30e4:	e24b2064 	sub	r2, fp, #100	; 0x64
    30e8:	e3a00001 	mov	r0, #1
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    30ec:	e1a0618e 	lsl	r6, lr, #3
    30f0:	e086e08e 	add	lr, r6, lr, lsl #1
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    30f4:	e51b606c 	ldr	r6, [fp, #-108]	; 0xffffff94

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    30f8:	e0c98a93 	smull	r8, r9, r3, sl
    30fc:	e1a03fc3 	asr	r3, r3, #31
    name[3] = '0' + (nfiles % 100) / 10;
    3100:	e0c7669c 	smull	r6, r7, ip, r6
    3104:	e1a0cfcc 	asr	ip, ip, #31
    name[4] = '0' + (nfiles % 10);
    3108:	e06ee004 	rsb	lr, lr, r4
    name[5] = '\0';
    310c:	e3a06000 	mov	r6, #0

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3110:	e06332c9 	rsb	r3, r3, r9, asr #5
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    3114:	e28ee030 	add	lr, lr, #48	; 0x30

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3118:	e2833030 	add	r3, r3, #48	; 0x30
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    311c:	e54be060 	strb	lr, [fp, #-96]	; 0xffffffa0

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3120:	e54b3062 	strb	r3, [fp, #-98]	; 0xffffff9e
    name[3] = '0' + (nfiles % 100) / 10;
    3124:	e06cc147 	rsb	ip, ip, r7, asr #2
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    3128:	e54b605f 	strb	r6, [fp, #-95]	; 0xffffffa1
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    312c:	e28cc030 	add	ip, ip, #48	; 0x30
    3130:	e54bc061 	strb	ip, [fp, #-97]	; 0xffffff9f
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3134:	eb000257 	bl	3a98 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3138:	e3001202 	movw	r1, #514	; 0x202
    313c:	e24b0064 	sub	r0, fp, #100	; 0x64
    3140:	eb000171 	bl	370c <open>
    if(fd < 0){
    3144:	e2507000 	subs	r7, r0, #0
    3148:	aa000001 	bge	3154 <fsfull+0x10c>
    314c:	ea000012 	b	319c <fsfull+0x154>
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3150:	e0866000 	add	r6, r6, r0
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    3154:	e3071fc8 	movw	r1, #32712	; 0x7fc8
    3158:	e3a02c02 	mov	r2, #512	; 0x200
    315c:	e3401000 	movt	r1, #0
    3160:	e1a00007 	mov	r0, r7
    3164:	eb000134 	bl	363c <write>
      if(cc < 512)
    3168:	e3500c02 	cmp	r0, #512	; 0x200
    316c:	aafffff7 	bge	3150 <fsfull+0x108>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3170:	e3051768 	movw	r1, #22376	; 0x5768
    3174:	e1a02006 	mov	r2, r6
    3178:	e3401000 	movt	r1, #0
    317c:	e3a00001 	mov	r0, #1
    3180:	eb000244 	bl	3a98 <printf>
    close(fd);
    3184:	e1a00007 	mov	r0, r7
    3188:	eb000138 	bl	3670 <close>
    if(total == 0)
    318c:	e3560000 	cmp	r6, #0
    3190:	0a000006 	beq	31b0 <fsfull+0x168>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3194:	e2844001 	add	r4, r4, #1
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3198:	eaffffbe 	b	3098 <fsfull+0x50>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    319c:	e3051758 	movw	r1, #22360	; 0x5758
    31a0:	e24b2064 	sub	r2, fp, #100	; 0x64
    31a4:	e3401000 	movt	r1, #0
    31a8:	e3a00001 	mov	r0, #1
    31ac:	eb000239 	bl	3a98 <printf>
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    31b0:	e304add3 	movw	sl, #19923	; 0x4dd3
    name[2] = '0' + (nfiles % 1000) / 100;
    31b4:	e308751f 	movw	r7, #34079	; 0x851f
    name[3] = '0' + (nfiles % 100) / 10;
    31b8:	e3066667 	movw	r6, #26215	; 0x6667
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    31bc:	e341a062 	movt	sl, #4194	; 0x1062
    name[2] = '0' + (nfiles % 1000) / 100;
    31c0:	e34571eb 	movt	r7, #20971	; 0x51eb
    name[3] = '0' + (nfiles % 100) / 10;
    31c4:	e3466666 	movt	r6, #26214	; 0x6666
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    31c8:	e0c98a94 	smull	r8, r9, r4, sl
    name[2] = '0' + (nfiles % 1000) / 100;
    31cc:	e3a08ffa 	mov	r8, #1000	; 0x3e8
    name[3] = '0' + (nfiles % 100) / 10;
    31d0:	e0c32794 	smull	r2, r3, r4, r7
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    31d4:	e3a01066 	mov	r1, #102	; 0x66
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    31d8:	e3a0c064 	mov	ip, #100	; 0x64
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    31dc:	e54b1064 	strb	r1, [fp, #-100]	; 0xffffff9c
    name[1] = '0' + nfiles / 1000;
    31e0:	e0652349 	rsb	r2, r5, r9, asr #6
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    31e4:	e24b0064 	sub	r0, fp, #100	; 0x64
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    31e8:	e2821030 	add	r1, r2, #48	; 0x30
    31ec:	e54b1063 	strb	r1, [fp, #-99]	; 0xffffff9d
    name[2] = '0' + (nfiles % 1000) / 100;
    31f0:	e0684298 	mls	r8, r8, r2, r4
    name[3] = '0' + (nfiles % 100) / 10;
    31f4:	e06532c3 	rsb	r3, r5, r3, asr #5
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    31f8:	e3a02000 	mov	r2, #0
    31fc:	e54b205f 	strb	r2, [fp, #-95]	; 0xffffffa1
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3200:	e06c439c 	mls	ip, ip, r3, r4
    name[4] = '0' + (nfiles % 10);
    3204:	e0c32694 	smull	r2, r3, r4, r6

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3208:	e1a01fc8 	asr	r1, r8, #31
    320c:	e0c98798 	smull	r8, r9, r8, r7
    name[3] = '0' + (nfiles % 100) / 10;
    3210:	e1a02fcc 	asr	r2, ip, #31
    name[4] = '0' + (nfiles % 10);
    3214:	e0655143 	rsb	r5, r5, r3, asr #2
    3218:	e1a03185 	lsl	r3, r5, #3

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    321c:	e14b86fc 	strd	r8, [fp, #-108]	; 0xffffff94
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    3220:	e0833085 	add	r3, r3, r5, lsl #1
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3224:	e0c9869c 	smull	r8, r9, ip, r6

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3228:	e51bc068 	ldr	ip, [fp, #-104]	; 0xffffff98
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    322c:	e0633004 	rsb	r3, r3, r4
    name[5] = '\0';
    unlink(name);
    nfiles--;
    3230:	e2444001 	sub	r4, r4, #1
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    3234:	e2833030 	add	r3, r3, #48	; 0x30
    3238:	e54b3060 	strb	r3, [fp, #-96]	; 0xffffffa0

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    323c:	e06112cc 	rsb	r1, r1, ip, asr #5
    3240:	e1a05fc4 	asr	r5, r4, #31
    3244:	e2811030 	add	r1, r1, #48	; 0x30
    3248:	e54b1062 	strb	r1, [fp, #-98]	; 0xffffff9e
    name[3] = '0' + (nfiles % 100) / 10;
    324c:	e0622149 	rsb	r2, r2, r9, asr #2
    3250:	e2822030 	add	r2, r2, #48	; 0x30
    3254:	e54b2061 	strb	r2, [fp, #-97]	; 0xffffff9f
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    3258:	eb000145 	bl	3774 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    325c:	e3740001 	cmn	r4, #1
    3260:	1affffd8 	bne	31c8 <fsfull+0x180>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3264:	e3051778 	movw	r1, #22392	; 0x5778
    3268:	e3a00001 	mov	r0, #1
    326c:	e3401000 	movt	r1, #0
    3270:	eb000208 	bl	3a98 <printf>
}
    3274:	e24bd020 	sub	sp, fp, #32
    3278:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

0000327c <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    327c:	e3052810 	movw	r2, #22544	; 0x5810
    3280:	e306060d 	movw	r0, #26125	; 0x660d
    3284:	e3402000 	movt	r2, #0
    3288:	e30f135f 	movw	r1, #62303	; 0xf35f
}

unsigned long randstate = 1;
unsigned int
rand()
{
    328c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
  randstate = randstate * 1664525 + 1013904223;
    3290:	e3431c6e 	movt	r1, #15470	; 0x3c6e
    3294:	e5923018 	ldr	r3, [r2, #24]
    3298:	e3400019 	movt	r0, #25
}

unsigned long randstate = 1;
unsigned int
rand()
{
    329c:	e28db000 	add	fp, sp, #0
  randstate = randstate * 1664525 + 1013904223;
    32a0:	e0201390 	mla	r0, r0, r3, r1
    32a4:	e5820018 	str	r0, [r2, #24]
  return randstate;
}
    32a8:	e24bd000 	sub	sp, fp, #0
    32ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    32b0:	e12fff1e 	bx	lr

000032b4 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
    32b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    32b8:	e2402001 	sub	r2, r0, #1
    32bc:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    32c0:	e4d13001 	ldrb	r3, [r1], #1
    32c4:	e3530000 	cmp	r3, #0
    32c8:	e5e23001 	strb	r3, [r2, #1]!
    32cc:	1afffffb 	bne	32c0 <strcpy+0xc>
    ;
  return os;
}
    32d0:	e24bd000 	sub	sp, fp, #0
    32d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    32d8:	e12fff1e 	bx	lr

000032dc <strcmp>:

int
strcmp(const char *p, const char *q)
{
    32dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    32e0:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
    32e4:	e5d03000 	ldrb	r3, [r0]
    32e8:	e3530000 	cmp	r3, #0
    32ec:	05d10000 	ldrbeq	r0, [r1]
    32f0:	0a00000a 	beq	3320 <strcmp+0x44>
    32f4:	e5d12000 	ldrb	r2, [r1]
    32f8:	e1530002 	cmp	r3, r2
    32fc:	0a000003 	beq	3310 <strcmp+0x34>
    3300:	ea00000a 	b	3330 <strcmp+0x54>
    3304:	e5f12001 	ldrb	r2, [r1, #1]!
    3308:	e1530002 	cmp	r3, r2
    330c:	1a000007 	bne	3330 <strcmp+0x54>
    3310:	e5f03001 	ldrb	r3, [r0, #1]!
    3314:	e3530000 	cmp	r3, #0
    3318:	1afffff9 	bne	3304 <strcmp+0x28>
    331c:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
    3320:	e0600003 	rsb	r0, r0, r3
    3324:	e24bd000 	sub	sp, fp, #0
    3328:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    332c:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3330:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
    3334:	e0600003 	rsb	r0, r0, r3
    3338:	e24bd000 	sub	sp, fp, #0
    333c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3340:	e12fff1e 	bx	lr

00003344 <strlen>:

uint
strlen(char *s)
{
    3344:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3348:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
    334c:	e5d03000 	ldrb	r3, [r0]
    3350:	e3530000 	cmp	r3, #0
    3354:	0a000009 	beq	3380 <strlen+0x3c>
    3358:	e1a02000 	mov	r2, r0
    335c:	e3a03000 	mov	r3, #0
    3360:	e5f21001 	ldrb	r1, [r2, #1]!
    3364:	e2833001 	add	r3, r3, #1
    3368:	e3510000 	cmp	r1, #0
    336c:	e1a00003 	mov	r0, r3
    3370:	1afffffa 	bne	3360 <strlen+0x1c>
    ;
  return n;
}
    3374:	e24bd000 	sub	sp, fp, #0
    3378:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    337c:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    3380:	e1a00003 	mov	r0, r3
    3384:	eafffffa 	b	3374 <strlen+0x30>

00003388 <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
    3388:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
    338c:	e1a03000 	mov	r3, r0
    3390:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    3394:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
    3398:	0a000004 	beq	33b0 <memset+0x28>
    339c:	e6ef1071 	uxtb	r1, r1
    33a0:	e0800002 	add	r0, r0, r2
    33a4:	e4c31001 	strb	r1, [r3], #1
    33a8:	e1500003 	cmp	r0, r3
    33ac:	1afffffc 	bne	33a4 <memset+0x1c>
  return (void *)p;
}
    33b0:	e24bd000 	sub	sp, fp, #0
    33b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    33b8:	e12fff1e 	bx	lr

000033bc <strchr>:

char*
strchr(const char *s, char c)
{
    33bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    33c0:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
    33c4:	e5d02000 	ldrb	r2, [r0]
    33c8:	e3520000 	cmp	r2, #0
    33cc:	0a00000b 	beq	3400 <strchr+0x44>
    if(*s == c)
    33d0:	e1510002 	cmp	r1, r2
    33d4:	1a000002 	bne	33e4 <strchr+0x28>
    33d8:	ea000005 	b	33f4 <strchr+0x38>
    33dc:	e1530001 	cmp	r3, r1
    33e0:	0a000003 	beq	33f4 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    33e4:	e5f03001 	ldrb	r3, [r0, #1]!
    33e8:	e3530000 	cmp	r3, #0
    33ec:	1afffffa 	bne	33dc <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    33f0:	e1a00003 	mov	r0, r3
}
    33f4:	e24bd000 	sub	sp, fp, #0
    33f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    33fc:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
    3400:	e1a00002 	mov	r0, r2
    3404:	eafffffa 	b	33f4 <strchr+0x38>

00003408 <gets>:
}

char*
gets(char *buf, int max)
{
    3408:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
    340c:	e1a08000 	mov	r8, r0
    3410:	e28db018 	add	fp, sp, #24
    3414:	e1a07001 	mov	r7, r1
    3418:	e24dd00c 	sub	sp, sp, #12
    341c:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3420:	e3a05000 	mov	r5, #0
    3424:	ea000008 	b	344c <gets+0x44>
    cc = read(0, &c, 1);
    3428:	eb000076 	bl	3608 <read>
    if(cc < 1)
    342c:	e3500000 	cmp	r0, #0
    3430:	da00000b 	ble	3464 <gets+0x5c>
      break;
    buf[i++] = c;
    3434:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
    3438:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
    343c:	e353000d 	cmp	r3, #13
    3440:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    3444:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
    3448:	0a000005 	beq	3464 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    344c:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3450:	e0854002 	add	r4, r5, r2
    3454:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
    3458:	e24b101d 	sub	r1, fp, #29
    345c:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3460:	bafffff0 	blt	3428 <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3464:	e3a03000 	mov	r3, #0
  return buf;
}
    3468:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    346c:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
    3470:	e24bd018 	sub	sp, fp, #24
    3474:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00003478 <stat>:

int
stat(char *n, struct stat *st)
{
    3478:	e92d4830 	push	{r4, r5, fp, lr}
    347c:	e1a04001 	mov	r4, r1
    3480:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3484:	e3a01000 	mov	r1, #0
    3488:	eb00009f 	bl	370c <open>
  if(fd < 0)
    348c:	e2505000 	subs	r5, r0, #0
    3490:	ba000006 	blt	34b0 <stat+0x38>
    return -1;
  r = fstat(fd, st);
    3494:	e1a01004 	mov	r1, r4
    3498:	eb0000c2 	bl	37a8 <fstat>
    349c:	e1a04000 	mov	r4, r0
  close(fd);
    34a0:	e1a00005 	mov	r0, r5
    34a4:	eb000071 	bl	3670 <close>
  return r;
    34a8:	e1a00004 	mov	r0, r4
    34ac:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    34b0:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
    34b4:	e8bd8830 	pop	{r4, r5, fp, pc}

000034b8 <atoi>:

int
atoi(const char *s)
{
    34b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    34bc:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    34c0:	e5d01000 	ldrb	r1, [r0]
    34c4:	e2413030 	sub	r3, r1, #48	; 0x30
    34c8:	e3530009 	cmp	r3, #9
    34cc:	e3a03000 	mov	r3, #0
    34d0:	8a000007 	bhi	34f4 <atoi+0x3c>
    n = n*10 + *s++ - '0';
    34d4:	e1a02183 	lsl	r2, r3, #3
    34d8:	e0823083 	add	r3, r2, r3, lsl #1
    34dc:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    34e0:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
    34e4:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    34e8:	e2412030 	sub	r2, r1, #48	; 0x30
    34ec:	e3520009 	cmp	r2, #9
    34f0:	9afffff7 	bls	34d4 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
    34f4:	e1a00003 	mov	r0, r3
    34f8:	e24bd000 	sub	sp, fp, #0
    34fc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3500:	e12fff1e 	bx	lr

00003504 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3504:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
    3508:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    350c:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3510:	da000005 	ble	352c <memmove+0x28>
    3514:	e0812002 	add	r2, r1, r2
    3518:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
    351c:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3520:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
    3524:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3528:	1afffffb 	bne	351c <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    352c:	e24bd000 	sub	sp, fp, #0
    3530:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    3534:	e12fff1e 	bx	lr

00003538 <fork>:
    3538:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    353c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3540:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3544:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3548:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    354c:	e3a00001 	mov	r0, #1
    3550:	ef000040 	svc	0x00000040
    3554:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3558:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    355c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3560:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3564:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3568:	e12fff1e 	bx	lr

0000356c <exit>:
    356c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3570:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3574:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3578:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    357c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3580:	e3a00002 	mov	r0, #2
    3584:	ef000040 	svc	0x00000040
    3588:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    358c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3590:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3594:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3598:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    359c:	e12fff1e 	bx	lr

000035a0 <wait>:
    35a0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    35a4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    35a8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35ac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35b0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35b4:	e3a00003 	mov	r0, #3
    35b8:	ef000040 	svc	0x00000040
    35bc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35c4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    35c8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    35cc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    35d0:	e12fff1e 	bx	lr

000035d4 <pipe>:
    35d4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    35d8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    35dc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    35e0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    35e4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    35e8:	e3a00004 	mov	r0, #4
    35ec:	ef000040 	svc	0x00000040
    35f0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    35f8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    35fc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3600:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3604:	e12fff1e 	bx	lr

00003608 <read>:
    3608:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    360c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3610:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3614:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3618:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    361c:	e3a00005 	mov	r0, #5
    3620:	ef000040 	svc	0x00000040
    3624:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3628:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    362c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3630:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3634:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3638:	e12fff1e 	bx	lr

0000363c <write>:
    363c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3640:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3644:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3648:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    364c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3650:	e3a00010 	mov	r0, #16
    3654:	ef000040 	svc	0x00000040
    3658:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    365c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3660:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3664:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3668:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    366c:	e12fff1e 	bx	lr

00003670 <close>:
    3670:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3674:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3678:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    367c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3680:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3684:	e3a00015 	mov	r0, #21
    3688:	ef000040 	svc	0x00000040
    368c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3690:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3694:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3698:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    369c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36a0:	e12fff1e 	bx	lr

000036a4 <kill>:
    36a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    36a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36b8:	e3a00006 	mov	r0, #6
    36bc:	ef000040 	svc	0x00000040
    36c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    36cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    36d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    36d4:	e12fff1e 	bx	lr

000036d8 <exec>:
    36d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    36dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    36e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    36e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    36e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    36ec:	e3a00007 	mov	r0, #7
    36f0:	ef000040 	svc	0x00000040
    36f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    36fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3700:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3704:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3708:	e12fff1e 	bx	lr

0000370c <open>:
    370c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3710:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3714:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3718:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    371c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3720:	e3a0000f 	mov	r0, #15
    3724:	ef000040 	svc	0x00000040
    3728:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    372c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3730:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3734:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3738:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    373c:	e12fff1e 	bx	lr

00003740 <mknod>:
    3740:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3744:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3748:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    374c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3750:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3754:	e3a00011 	mov	r0, #17
    3758:	ef000040 	svc	0x00000040
    375c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3760:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3764:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3768:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    376c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3770:	e12fff1e 	bx	lr

00003774 <unlink>:
    3774:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3778:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    377c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3780:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3784:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3788:	e3a00012 	mov	r0, #18
    378c:	ef000040 	svc	0x00000040
    3790:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3794:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3798:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    379c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    37a4:	e12fff1e 	bx	lr

000037a8 <fstat>:
    37a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37bc:	e3a00008 	mov	r0, #8
    37c0:	ef000040 	svc	0x00000040
    37c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    37d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    37d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    37d8:	e12fff1e 	bx	lr

000037dc <link>:
    37dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    37e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    37e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    37e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    37ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    37f0:	e3a00013 	mov	r0, #19
    37f4:	ef000040 	svc	0x00000040
    37f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    37fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3800:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3804:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3808:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    380c:	e12fff1e 	bx	lr

00003810 <mkdir>:
    3810:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3814:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3818:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    381c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3820:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3824:	e3a00014 	mov	r0, #20
    3828:	ef000040 	svc	0x00000040
    382c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3830:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3834:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3838:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    383c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3840:	e12fff1e 	bx	lr

00003844 <chdir>:
    3844:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3848:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    384c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3850:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3854:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3858:	e3a00009 	mov	r0, #9
    385c:	ef000040 	svc	0x00000040
    3860:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3864:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3868:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    386c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3870:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3874:	e12fff1e 	bx	lr

00003878 <dup>:
    3878:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    387c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3880:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3884:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3888:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    388c:	e3a0000a 	mov	r0, #10
    3890:	ef000040 	svc	0x00000040
    3894:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3898:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    389c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38a0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    38a4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    38a8:	e12fff1e 	bx	lr

000038ac <getpid>:
    38ac:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38b0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38b4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38b8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38bc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38c0:	e3a0000b 	mov	r0, #11
    38c4:	ef000040 	svc	0x00000040
    38c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38cc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    38d0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    38d4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    38d8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    38dc:	e12fff1e 	bx	lr

000038e0 <sbrk>:
    38e0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    38e4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    38e8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    38ec:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    38f0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    38f4:	e3a0000c 	mov	r0, #12
    38f8:	ef000040 	svc	0x00000040
    38fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3900:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3904:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3908:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    390c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3910:	e12fff1e 	bx	lr

00003914 <sleep>:
    3914:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    3918:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    391c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3920:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3924:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    3928:	e3a0000d 	mov	r0, #13
    392c:	ef000040 	svc	0x00000040
    3930:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3934:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3938:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    393c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3940:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3944:	e12fff1e 	bx	lr

00003948 <uptime>:
    3948:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    394c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    3950:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    3954:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    3958:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    395c:	e3a0000e 	mov	r0, #14
    3960:	ef000040 	svc	0x00000040
    3964:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    3968:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    396c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    3970:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    3974:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    3978:	e12fff1e 	bx	lr

0000397c <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    397c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    3980:	e1a09fa1 	lsr	r9, r1, #31
    3984:	e3530000 	cmp	r3, #0
    3988:	03a03000 	moveq	r3, #0
    398c:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3990:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    3994:	e3530000 	cmp	r3, #0
    3998:	e30587f4 	movw	r8, #22516	; 0x57f4
    neg = 1;
    x = -xx;
    399c:	1261e000 	rsbne	lr, r1, #0
    39a0:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    39a4:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    39a8:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
    39ac:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
    39b0:	01a09003 	moveq	r9, r3
    39b4:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
    39b8:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
    39bc:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    39c0:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    39c4:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
    39c8:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    39cc:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
    39d0:	e1a0033e 	lsr	r0, lr, r3
    39d4:	e2000001 	and	r0, r0, #1
    39d8:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
    39dc:	e1520001 	cmp	r2, r1
            r = r - d;
    39e0:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
    39e4:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    39e8:	e2533001 	subs	r3, r3, #1
    39ec:	2afffff7 	bcs	39d0 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    39f0:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
    39f4:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    39f8:	e2873001 	add	r3, r7, #1
    39fc:	e7d8100e 	ldrb	r1, [r8, lr]
    3a00:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
    3a04:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    3a08:	11a07003 	movne	r7, r3
    3a0c:	1affffec 	bne	39c4 <printint+0x48>
  }while((x = y) != 0);
  if(neg)
    3a10:	e3590000 	cmp	r9, #0
    3a14:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
    3a18:	124b201c 	subne	r2, fp, #28
    3a1c:	10822003 	addne	r2, r2, r3
    3a20:	12873002 	addne	r3, r7, #2
    3a24:	e0865003 	add	r5, r6, r3
    3a28:	13a0102d 	movne	r1, #45	; 0x2d
    3a2c:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
    3a30:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a34:	e3a02001 	mov	r2, #1
    3a38:	e24b102d 	sub	r1, fp, #45	; 0x2d
    3a3c:	e1a00004 	mov	r0, r4
    3a40:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
    3a44:	ebfffefc 	bl	363c <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3a48:	e1560005 	cmp	r6, r5
    3a4c:	1afffff7 	bne	3a30 <printint+0xb4>
    putc(fd, buf[i]);
}
    3a50:	e24bd01c 	sub	sp, fp, #28
    3a54:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00003a58 <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    3a58:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
    3a5c:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    3a60:	e28db008 	add	fp, sp, #8
    3a64:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    3a68:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    3a6c:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
    3a70:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
    3a74:	e1a0c33e 	lsr	ip, lr, r3
    3a78:	e20cc001 	and	ip, ip, #1
    3a7c:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
    3a80:	e1520001 	cmp	r2, r1
            r = r - d;
    3a84:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
    3a88:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    3a8c:	e2533001 	subs	r3, r3, #1
    3a90:	2afffff7 	bcs	3a74 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
    3a94:	e8bd8810 	pop	{r4, fp, pc}

00003a98 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3a98:	e92d000e 	push	{r1, r2, r3}
    3a9c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    3aa0:	e28db01c 	add	fp, sp, #28
    3aa4:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3aa8:	e59b6004 	ldr	r6, [fp, #4]
    3aac:	e5d64000 	ldrb	r4, [r6]
    3ab0:	e3540000 	cmp	r4, #0
    3ab4:	0a00002d 	beq	3b70 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
    3ab8:	e3058808 	movw	r8, #22536	; 0x5808
    3abc:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ac0:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
    3ac4:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ac8:	e3a05000 	mov	r5, #0
    3acc:	ea00000a 	b	3afc <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3ad0:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
    3ad4:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3ad8:	0a000004 	beq	3af0 <printf+0x58>
    3adc:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3ae0:	e3a02001 	mov	r2, #1
    3ae4:	e1a00007 	mov	r0, r7
    3ae8:	e5614006 	strb	r4, [r1, #-6]!
    3aec:	ebfffed2 	bl	363c <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3af0:	e5f64001 	ldrb	r4, [r6, #1]!
    3af4:	e3540000 	cmp	r4, #0
    3af8:	0a00001c 	beq	3b70 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
    3afc:	e3550000 	cmp	r5, #0
    3b00:	0afffff2 	beq	3ad0 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3b04:	e3550025 	cmp	r5, #37	; 0x25
    3b08:	1afffff8 	bne	3af0 <printf+0x58>
      if(c == 'd'){
    3b0c:	e3540064 	cmp	r4, #100	; 0x64
    3b10:	0a000037 	beq	3bf4 <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3b14:	e20430f7 	and	r3, r4, #247	; 0xf7
    3b18:	e3530070 	cmp	r3, #112	; 0x70
    3b1c:	0a000017 	beq	3b80 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3b20:	e3540073 	cmp	r4, #115	; 0x73
    3b24:	0a00001c 	beq	3b9c <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3b28:	e3540063 	cmp	r4, #99	; 0x63
    3b2c:	0a000037 	beq	3c10 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3b30:	e3540025 	cmp	r4, #37	; 0x25
    3b34:	0a000027 	beq	3bd8 <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b38:	e3a02001 	mov	r2, #1
    3b3c:	e24b1021 	sub	r1, fp, #33	; 0x21
    3b40:	e1a00007 	mov	r0, r7
    3b44:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
    3b48:	ebfffebb 	bl	363c <write>
    3b4c:	e24b1020 	sub	r1, fp, #32
    3b50:	e3a02001 	mov	r2, #1
    3b54:	e1a00007 	mov	r0, r7
    3b58:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b5c:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b60:	ebfffeb5 	bl	363c <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3b64:	e5f64001 	ldrb	r4, [r6, #1]!
    3b68:	e3540000 	cmp	r4, #0
    3b6c:	1affffe2 	bne	3afc <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3b70:	e24bd01c 	sub	sp, fp, #28
    3b74:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
    3b78:	e28dd00c 	add	sp, sp, #12
    3b7c:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3b80:	e3a03000 	mov	r3, #0
    3b84:	e3a02010 	mov	r2, #16
    3b88:	e4991004 	ldr	r1, [r9], #4
    3b8c:	e1a00007 	mov	r0, r7
    3b90:	ebffff79 	bl	397c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b94:	e3a05000 	mov	r5, #0
    3b98:	eaffffd4 	b	3af0 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    3b9c:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
    3ba0:	e3540000 	cmp	r4, #0
    3ba4:	01a04008 	moveq	r4, r8
        while(*s != 0){
    3ba8:	e5d45000 	ldrb	r5, [r4]
    3bac:	e3550000 	cmp	r5, #0
    3bb0:	0affffce 	beq	3af0 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bb4:	e3a02001 	mov	r2, #1
    3bb8:	e24b1025 	sub	r1, fp, #37	; 0x25
    3bbc:	e1a00007 	mov	r0, r7
    3bc0:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
    3bc4:	ebfffe9c 	bl	363c <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3bc8:	e5f45001 	ldrb	r5, [r4, #1]!
    3bcc:	e3550000 	cmp	r5, #0
    3bd0:	1afffff7 	bne	3bb4 <printf+0x11c>
    3bd4:	eaffffc5 	b	3af0 <printf+0x58>
    3bd8:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bdc:	e3a02001 	mov	r2, #1
    3be0:	e1a00007 	mov	r0, r7
    3be4:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3be8:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3bec:	ebfffe92 	bl	363c <write>
    3bf0:	eaffffbe 	b	3af0 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3bf4:	e3a03001 	mov	r3, #1
    3bf8:	e3a0200a 	mov	r2, #10
    3bfc:	e4991004 	ldr	r1, [r9], #4
    3c00:	e1a00007 	mov	r0, r7
    3c04:	ebffff5c 	bl	397c <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3c08:	e3a05000 	mov	r5, #0
    3c0c:	eaffffb7 	b	3af0 <printf+0x58>
    3c10:	e4993004 	ldr	r3, [r9], #4
    3c14:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3c18:	e3a02001 	mov	r2, #1
    3c1c:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3c20:	e3a05000 	mov	r5, #0
    3c24:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3c28:	ebfffe83 	bl	363c <write>
    3c2c:	eaffffaf 	b	3af0 <printf+0x58>

00003c30 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c30:	e305c8ac 	movw	ip, #22700	; 0x58ac
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3c34:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c38:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c3c:	e92d4810 	push	{r4, fp, lr}
    3c40:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c44:	e59c3000 	ldr	r3, [ip]
    3c48:	ea000004 	b	3c60 <free+0x30>
    3c4c:	e1510002 	cmp	r1, r2
    3c50:	3a000009 	bcc	3c7c <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c54:	e1530002 	cmp	r3, r2
    3c58:	2a000007 	bcs	3c7c <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
    3c5c:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c60:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c64:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c68:	3afffff7 	bcc	3c4c <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c6c:	e1530002 	cmp	r3, r2
    3c70:	3afffff9 	bcc	3c5c <free+0x2c>
    3c74:	e1510002 	cmp	r1, r2
    3c78:	2afffff7 	bcs	3c5c <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c7c:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3c80:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c84:	e081418e 	add	r4, r1, lr, lsl #3
    3c88:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
    3c8c:	05922004 	ldreq	r2, [r2, #4]
    3c90:	0082e00e 	addeq	lr, r2, lr
    3c94:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
    3c98:	05932000 	ldreq	r2, [r3]
    3c9c:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
    3ca0:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
    3ca4:	e5932004 	ldr	r2, [r3, #4]
    3ca8:	e083e182 	add	lr, r3, r2, lsl #3
    3cac:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3cb0:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    3cb4:	05101004 	ldreq	r1, [r0, #-4]
    3cb8:	00812002 	addeq	r2, r1, r2
    3cbc:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    3cc0:	05102008 	ldreq	r2, [r0, #-8]
    3cc4:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
    3cc8:	e8bd8810 	pop	{r4, fp, pc}

00003ccc <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3ccc:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    3cd0:	e30588ac 	movw	r8, #22700	; 0x58ac
    3cd4:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3cd8:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
    3cdc:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
    3ce0:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3ce4:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
    3ce8:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3cec:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
    3cf0:	0a00002a 	beq	3da0 <malloc+0xd4>
    3cf4:	e5930000 	ldr	r0, [r3]
    3cf8:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3cfc:	e1540002 	cmp	r4, r2
    3d00:	9a00001c 	bls	3d78 <malloc+0xac>
    3d04:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3d08:	e30558ac 	movw	r5, #22700	; 0x58ac
    3d0c:	e3405000 	movt	r5, #0
    3d10:	33a06902 	movcc	r6, #32768	; 0x8000
    3d14:	21a06184 	lslcs	r6, r4, #3
    3d18:	21a07004 	movcs	r7, r4
    3d1c:	33a07a01 	movcc	r7, #4096	; 0x1000
    3d20:	ea000003 	b	3d34 <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3d24:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
    3d28:	e5902004 	ldr	r2, [r0, #4]
    3d2c:	e1540002 	cmp	r4, r2
    3d30:	9a000010 	bls	3d78 <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3d34:	e5982000 	ldr	r2, [r8]
    3d38:	e1a03000 	mov	r3, r0
    3d3c:	e1520000 	cmp	r2, r0
    3d40:	1afffff7 	bne	3d24 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    3d44:	e1a00006 	mov	r0, r6
    3d48:	ebfffee4 	bl	38e0 <sbrk>
    3d4c:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
    3d50:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
    3d54:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
    3d58:	0a000004 	beq	3d70 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3d5c:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
    3d60:	ebffffb2 	bl	3c30 <free>
  return freep;
    3d64:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    3d68:	e3530000 	cmp	r3, #0
    3d6c:	1affffec 	bne	3d24 <malloc+0x58>
        return 0;
    3d70:	e3a00000 	mov	r0, #0
  }
}
    3d74:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3d78:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
    3d7c:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3d80:	10642002 	rsbne	r2, r4, r2
    3d84:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    3d88:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
    3d8c:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    3d90:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
    3d94:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    3d98:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    3d9c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3da0:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
    3da4:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3da8:	e5880000 	str	r0, [r8]
    3dac:	e5880004 	str	r0, [r8, #4]
    3db0:	eaffffd3 	b	3d04 <malloc+0x38>
