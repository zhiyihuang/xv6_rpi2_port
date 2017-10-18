
_sh:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	e92d4830 	push	{r4, r5, fp, lr}
       4:	e28db00c 	add	fp, sp, #12
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
       8:	ea000001 	b	14 <main+0x14>
    if(fd >= 3){
       c:	e3530002 	cmp	r3, #2
      10:	ca00002f 	bgt	d4 <main+0xd4>
{
  static char buf[100];
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
      14:	e3010710 	movw	r0, #5904	; 0x1710
      18:	e3a01002 	mov	r1, #2
      1c:	e3400000 	movt	r0, #0
      20:	eb0003de 	bl	fa0 <open>
      24:	e2503000 	subs	r3, r0, #0
      28:	aafffff7 	bge	c <main+0xc>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      2c:	e3014754 	movw	r4, #5972	; 0x1754
      30:	e3404000 	movt	r4, #0
      34:	ea000005 	b	50 <main+0x50>
int
fork1(void)
{
  int pid;
  
  pid = fork();
      38:	eb000363 	bl	dcc <fork>
  if(pid == -1)
      3c:	e3700001 	cmn	r0, #1
      40:	0a000026 	beq	e0 <main+0xe0>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      44:	e3500000 	cmp	r0, #0
      48:	0a000027 	beq	ec <main+0xec>
      runcmd(parsecmd(buf));
    wait();
      4c:	eb000378 	bl	e34 <wait>
      break;
    }
  }
  
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      50:	e3010754 	movw	r0, #5972	; 0x1754
      54:	e3a01064 	mov	r1, #100	; 0x64
      58:	e3400000 	movt	r0, #0
      5c:	eb000026 	bl	fc <getcmd>
      60:	e3500000 	cmp	r0, #0
      64:	ba00001c 	blt	dc <main+0xdc>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      68:	e5d43000 	ldrb	r3, [r4]
      6c:	e3530063 	cmp	r3, #99	; 0x63
      70:	1afffff0 	bne	38 <main+0x38>
      74:	e5d43001 	ldrb	r3, [r4, #1]
      78:	e3530064 	cmp	r3, #100	; 0x64
      7c:	1affffed 	bne	38 <main+0x38>
      80:	e5d43002 	ldrb	r3, [r4, #2]
      84:	e3530020 	cmp	r3, #32
      88:	1affffea 	bne	38 <main+0x38>
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      8c:	e3010754 	movw	r0, #5972	; 0x1754
      90:	e3400000 	movt	r0, #0
      94:	eb0002cf 	bl	bd8 <strlen>
      98:	e3a02000 	mov	r2, #0
      9c:	e0843000 	add	r3, r4, r0
      if(chdir(buf+3) < 0)
      a0:	e3010757 	movw	r0, #5975	; 0x1757
      a4:	e3400000 	movt	r0, #0
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      a8:	e5432001 	strb	r2, [r3, #-1]
      if(chdir(buf+3) < 0)
      ac:	eb000409 	bl	10d8 <chdir>
      b0:	e3500000 	cmp	r0, #0
      b4:	aaffffe5 	bge	50 <main+0x50>
        printf(2, "cannot cd %s\n", buf+3);
      b8:	e3011718 	movw	r1, #5912	; 0x1718
      bc:	e3012757 	movw	r2, #5975	; 0x1757
      c0:	e3402000 	movt	r2, #0
      c4:	e3401000 	movt	r1, #0
      c8:	e3a00002 	mov	r0, #2
      cc:	eb000496 	bl	132c <printf>
      d0:	eaffffde 	b	50 <main+0x50>
  int fd;
  
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      d4:	eb00038a 	bl	f04 <close>
      break;
      d8:	eaffffd3 	b	2c <main+0x2c>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
      dc:	eb000347 	bl	e00 <exit>
{
  int pid;
  
  pid = fork();
  if(pid == -1)
    panic("fork");
      e0:	e3010678 	movw	r0, #5752	; 0x1678
      e4:	e3400000 	movt	r0, #0
      e8:	eb000017 	bl	14c <panic>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
      ec:	e3010754 	movw	r0, #5972	; 0x1754
      f0:	e3400000 	movt	r0, #0
      f4:	eb000273 	bl	ac8 <parsecmd>
      f8:	eb00001b 	bl	16c <runcmd>

000000fc <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
      fc:	e92d4830 	push	{r4, r5, fp, lr}
     100:	e1a05001 	mov	r5, r1
  printf(2, "$ ");
     104:	e3011648 	movw	r1, #5704	; 0x1648
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     108:	e1a04000 	mov	r4, r0
     10c:	e28db00c 	add	fp, sp, #12
  printf(2, "$ ");
     110:	e3401000 	movt	r1, #0
     114:	e3a00002 	mov	r0, #2
     118:	eb000483 	bl	132c <printf>
  memset(buf, 0, nbuf);
     11c:	e1a02005 	mov	r2, r5
     120:	e1a00004 	mov	r0, r4
     124:	e3a01000 	mov	r1, #0
     128:	eb0002bb 	bl	c1c <memset>
  gets(buf, nbuf);
     12c:	e1a01005 	mov	r1, r5
     130:	e1a00004 	mov	r0, r4
     134:	eb0002d8 	bl	c9c <gets>
     138:	e5d40000 	ldrb	r0, [r4]
     13c:	e16f0f10 	clz	r0, r0
     140:	e1a002a0 	lsr	r0, r0, #5
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     144:	e2600000 	rsb	r0, r0, #0
     148:	e8bd8830 	pop	{r4, r5, fp, pc}

0000014c <panic>:
}

void
panic(char *s)
{
  printf(2, "%s\n", s);
     14c:	e301164c 	movw	r1, #5708	; 0x164c
     150:	e1a02000 	mov	r2, r0
  exit();
}

void
panic(char *s)
{
     154:	e92d4800 	push	{fp, lr}
  printf(2, "%s\n", s);
     158:	e3401000 	movt	r1, #0
  exit();
}

void
panic(char *s)
{
     15c:	e28db004 	add	fp, sp, #4
  printf(2, "%s\n", s);
     160:	e3a00002 	mov	r0, #2
     164:	eb000470 	bl	132c <printf>
  exit();
     168:	eb000324 	bl	e00 <exit>

0000016c <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     16c:	e92d4810 	push	{r4, fp, lr}
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     170:	e2504000 	subs	r4, r0, #0
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     174:	e28db008 	add	fp, sp, #8
     178:	e24dd00c 	sub	sp, sp, #12
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     17c:	0a00001d 	beq	1f8 <runcmd+0x8c>
    exit();
  
  switch(cmd->type){
     180:	e5943000 	ldr	r3, [r4]
     184:	e2433001 	sub	r3, r3, #1
     188:	e3530004 	cmp	r3, #4
     18c:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     190:	ea00003b 	b	284 <runcmd+0x118>
     194:	00000214 	.word	0x00000214
     198:	00000240 	.word	0x00000240
     19c:	000001a8 	.word	0x000001a8
     1a0:	00000264 	.word	0x00000264
     1a4:	000001fc 	.word	0x000001fc
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     1a8:	e24b0014 	sub	r0, fp, #20
     1ac:	eb00032d 	bl	e68 <pipe>
     1b0:	e3500000 	cmp	r0, #0
     1b4:	ba00003e 	blt	2b4 <runcmd+0x148>
int
fork1(void)
{
  int pid;
  
  pid = fork();
     1b8:	eb000303 	bl	dcc <fork>
  if(pid == -1)
     1bc:	e3700001 	cmn	r0, #1
     1c0:	0a000032 	beq	290 <runcmd+0x124>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
     1c4:	e3500000 	cmp	r0, #0
     1c8:	0a00003c 	beq	2c0 <runcmd+0x154>
int
fork1(void)
{
  int pid;
  
  pid = fork();
     1cc:	eb0002fe 	bl	dcc <fork>
  if(pid == -1)
     1d0:	e3700001 	cmn	r0, #1
     1d4:	0a00002d 	beq	290 <runcmd+0x124>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     1d8:	e3500000 	cmp	r0, #0
     1dc:	0a000041 	beq	2e8 <runcmd+0x17c>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     1e0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     1e4:	eb000346 	bl	f04 <close>
    close(p[1]);
     1e8:	e51b0010 	ldr	r0, [fp, #-16]
     1ec:	eb000344 	bl	f04 <close>
    wait();
     1f0:	eb00030f 	bl	e34 <wait>
    wait();
     1f4:	eb00030e 	bl	e34 <wait>
  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
      exit();
     1f8:	eb000300 	bl	e00 <exit>
int
fork1(void)
{
  int pid;
  
  pid = fork();
     1fc:	eb0002f2 	bl	dcc <fork>
  if(pid == -1)
     200:	e3700001 	cmn	r0, #1
     204:	0a000021 	beq	290 <runcmd+0x124>
    wait();
    break;
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     208:	e3500000 	cmp	r0, #0
     20c:	1afffff9 	bne	1f8 <runcmd+0x8c>
     210:	ea000011 	b	25c <runcmd+0xf0>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     214:	e5940004 	ldr	r0, [r4, #4]
     218:	e3500000 	cmp	r0, #0
     21c:	0afffff5 	beq	1f8 <runcmd+0x8c>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     220:	e2841004 	add	r1, r4, #4
     224:	eb000350 	bl	f6c <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     228:	e3011658 	movw	r1, #5720	; 0x1658
     22c:	e5942004 	ldr	r2, [r4, #4]
     230:	e3401000 	movt	r1, #0
     234:	e3a00002 	mov	r0, #2
     238:	eb00043b 	bl	132c <printf>
    break;
     23c:	eaffffed 	b	1f8 <runcmd+0x8c>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     240:	e5940014 	ldr	r0, [r4, #20]
     244:	eb00032e 	bl	f04 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     248:	e5941010 	ldr	r1, [r4, #16]
     24c:	e5940008 	ldr	r0, [r4, #8]
     250:	eb000352 	bl	fa0 <open>
     254:	e3500000 	cmp	r0, #0
     258:	ba00000f 	blt	29c <runcmd+0x130>
    break;
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     25c:	e5940004 	ldr	r0, [r4, #4]
     260:	ebffffc1 	bl	16c <runcmd>
int
fork1(void)
{
  int pid;
  
  pid = fork();
     264:	eb0002d8 	bl	dcc <fork>
  if(pid == -1)
     268:	e3700001 	cmn	r0, #1
     26c:	0a000007 	beq	290 <runcmd+0x124>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     270:	e3500000 	cmp	r0, #0
     274:	0afffff8 	beq	25c <runcmd+0xf0>
      runcmd(lcmd->left);
    wait();
     278:	eb0002ed 	bl	e34 <wait>
    runcmd(lcmd->right);
     27c:	e5940008 	ldr	r0, [r4, #8]
     280:	ebffffb9 	bl	16c <runcmd>
  if(cmd == 0)
    exit();
  
  switch(cmd->type){
  default:
    panic("runcmd");
     284:	e3010650 	movw	r0, #5712	; 0x1650
     288:	e3400000 	movt	r0, #0
     28c:	ebffffae 	bl	14c <panic>
{
  int pid;
  
  pid = fork();
  if(pid == -1)
    panic("fork");
     290:	e3010678 	movw	r0, #5752	; 0x1678
     294:	e3400000 	movt	r0, #0
     298:	ebffffab 	bl	14c <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     29c:	e3011668 	movw	r1, #5736	; 0x1668
     2a0:	e5942008 	ldr	r2, [r4, #8]
     2a4:	e3401000 	movt	r1, #0
     2a8:	e3a00002 	mov	r0, #2
     2ac:	eb00041e 	bl	132c <printf>
     2b0:	eaffffd0 	b	1f8 <runcmd+0x8c>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     2b4:	e3010680 	movw	r0, #5760	; 0x1680
     2b8:	e3400000 	movt	r0, #0
     2bc:	ebffffa2 	bl	14c <panic>
    if(fork1() == 0){
      close(1);
     2c0:	e3a00001 	mov	r0, #1
     2c4:	eb00030e 	bl	f04 <close>
      dup(p[1]);
     2c8:	e51b0010 	ldr	r0, [fp, #-16]
     2cc:	eb00038e 	bl	110c <dup>
      close(p[0]);
     2d0:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     2d4:	eb00030a 	bl	f04 <close>
      close(p[1]);
     2d8:	e51b0010 	ldr	r0, [fp, #-16]
     2dc:	eb000308 	bl	f04 <close>
      runcmd(pcmd->left);
     2e0:	e5940004 	ldr	r0, [r4, #4]
     2e4:	ebffffa0 	bl	16c <runcmd>
    }
    if(fork1() == 0){
      close(0);
     2e8:	eb000305 	bl	f04 <close>
      dup(p[0]);
     2ec:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     2f0:	eb000385 	bl	110c <dup>
      close(p[0]);
     2f4:	e51b0014 	ldr	r0, [fp, #-20]	; 0xffffffec
     2f8:	eb000301 	bl	f04 <close>
      close(p[1]);
     2fc:	e51b0010 	ldr	r0, [fp, #-16]
     300:	eb0002ff 	bl	f04 <close>
      runcmd(pcmd->right);
     304:	e5940008 	ldr	r0, [r4, #8]
     308:	ebffff97 	bl	16c <runcmd>

0000030c <fork1>:
  exit();
}

int
fork1(void)
{
     30c:	e92d4800 	push	{fp, lr}
     310:	e28db004 	add	fp, sp, #4
  int pid;
  
  pid = fork();
     314:	eb0002ac 	bl	dcc <fork>
  if(pid == -1)
     318:	e3700001 	cmn	r0, #1
     31c:	18bd8800 	popne	{fp, pc}
    panic("fork");
     320:	e3010678 	movw	r0, #5752	; 0x1678
     324:	e3400000 	movt	r0, #0
     328:	ebffff87 	bl	14c <panic>

0000032c <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     32c:	e92d4830 	push	{r4, r5, fp, lr}
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     330:	e3a00054 	mov	r0, #84	; 0x54
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     334:	e28db00c 	add	fp, sp, #12
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     338:	eb000488 	bl	1560 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     33c:	e3a02054 	mov	r2, #84	; 0x54
     340:	e3a01000 	mov	r1, #0
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     344:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     348:	eb000233 	bl	c1c <memset>
  cmd->type = EXEC;
     34c:	e3a03001 	mov	r3, #1
  return (struct cmd*)cmd;
}
     350:	e1a00004 	mov	r0, r4
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
     354:	e5843000 	str	r3, [r4]
  return (struct cmd*)cmd;
}
     358:	e8bd8830 	pop	{r4, r5, fp, pc}

0000035c <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     35c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     360:	e28db01c 	add	fp, sp, #28
     364:	e1a09000 	mov	r9, r0
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     368:	e3a00018 	mov	r0, #24
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     36c:	e1a08001 	mov	r8, r1
     370:	e1a07002 	mov	r7, r2
     374:	e1a06003 	mov	r6, r3
     378:	e59b5004 	ldr	r5, [fp, #4]
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     37c:	eb000477 	bl	1560 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     380:	e3a02018 	mov	r2, #24
     384:	e3a01000 	mov	r1, #0
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     388:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     38c:	eb000222 	bl	c1c <memset>
  cmd->type = REDIR;
     390:	e3a02002 	mov	r2, #2
  cmd->cmd = subcmd;
     394:	e5849004 	str	r9, [r4, #4]
  cmd->file = file;
     398:	e5848008 	str	r8, [r4, #8]
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}
     39c:	e1a00004 	mov	r0, r4
  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
  cmd->file = file;
  cmd->efile = efile;
     3a0:	e584700c 	str	r7, [r4, #12]
  cmd->mode = mode;
     3a4:	e5846010 	str	r6, [r4, #16]
  cmd->fd = fd;
     3a8:	e5845014 	str	r5, [r4, #20]
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     3ac:	e5842000 	str	r2, [r4]
  cmd->file = file;
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}
     3b0:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000003b4 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3b4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     3b8:	e1a06000 	mov	r6, r0
     3bc:	e28db014 	add	fp, sp, #20
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c0:	e3a0000c 	mov	r0, #12
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3c4:	e1a05001 	mov	r5, r1
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c8:	eb000464 	bl	1560 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3cc:	e3a0200c 	mov	r2, #12
     3d0:	e3a01000 	mov	r1, #0
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3d4:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     3d8:	eb00020f 	bl	c1c <memset>
  cmd->type = PIPE;
     3dc:	e3a03003 	mov	r3, #3
  cmd->left = left;
     3e0:	e5846004 	str	r6, [r4, #4]
  cmd->right = right;
     3e4:	e5845008 	str	r5, [r4, #8]
  return (struct cmd*)cmd;
}
     3e8:	e1a00004 	mov	r0, r4
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     3ec:	e5843000 	str	r3, [r4]
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}
     3f0:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

000003f4 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3f4:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     3f8:	e1a06000 	mov	r6, r0
     3fc:	e28db014 	add	fp, sp, #20
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     400:	e3a0000c 	mov	r0, #12
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     404:	e1a05001 	mov	r5, r1
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     408:	eb000454 	bl	1560 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     40c:	e3a0200c 	mov	r2, #12
     410:	e3a01000 	mov	r1, #0
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     414:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     418:	eb0001ff 	bl	c1c <memset>
  cmd->type = LIST;
     41c:	e3a03004 	mov	r3, #4
  cmd->left = left;
     420:	e5846004 	str	r6, [r4, #4]
  cmd->right = right;
     424:	e5845008 	str	r5, [r4, #8]
  return (struct cmd*)cmd;
}
     428:	e1a00004 	mov	r0, r4
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     42c:	e5843000 	str	r3, [r4]
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}
     430:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}

00000434 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     434:	e92d4830 	push	{r4, r5, fp, lr}
     438:	e1a05000 	mov	r5, r0
     43c:	e28db00c 	add	fp, sp, #12
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     440:	e3a00008 	mov	r0, #8
     444:	eb000445 	bl	1560 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     448:	e3a02008 	mov	r2, #8
     44c:	e3a01000 	mov	r1, #0
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     450:	e1a04000 	mov	r4, r0
  memset(cmd, 0, sizeof(*cmd));
     454:	eb0001f0 	bl	c1c <memset>
  cmd->type = BACK;
     458:	e3a03005 	mov	r3, #5
  cmd->cmd = subcmd;
     45c:	e5845004 	str	r5, [r4, #4]
  return (struct cmd*)cmd;
}
     460:	e1a00004 	mov	r0, r4
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     464:	e5843000 	str	r3, [r4]
  cmd->cmd = subcmd;
  return (struct cmd*)cmd;
}
     468:	e8bd8830 	pop	{r4, r5, fp, pc}

0000046c <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     46c:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     470:	e1a07000 	mov	r7, r0
  char *s;
  int ret;
  
  s = *ps;
     474:	e5904000 	ldr	r4, [r0]
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     478:	e28db01c 	add	fp, sp, #28
     47c:	e1a06001 	mov	r6, r1
     480:	e1a09002 	mov	r9, r2
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     484:	e1540001 	cmp	r4, r1
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     488:	e1a08003 	mov	r8, r3
     48c:	31a05004 	movcc	r5, r4
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     490:	3a000003 	bcc	4a4 <gettoken+0x38>
     494:	ea00000a 	b	4c4 <gettoken+0x58>
     498:	e1550006 	cmp	r5, r6
    s++;
     49c:	e1a04005 	mov	r4, r5
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     4a0:	0a000007 	beq	4c4 <gettoken+0x58>
     4a4:	e3010744 	movw	r0, #5956	; 0x1744
     4a8:	e5d51000 	ldrb	r1, [r5]
     4ac:	e3400000 	movt	r0, #0
     4b0:	e1a04005 	mov	r4, r5
     4b4:	eb0001e5 	bl	c50 <strchr>
     4b8:	e2855001 	add	r5, r5, #1
     4bc:	e3500000 	cmp	r0, #0
     4c0:	1afffff4 	bne	498 <gettoken+0x2c>
    s++;
  if(q)
     4c4:	e3590000 	cmp	r9, #0
    *q = s;
     4c8:	15894000 	strne	r4, [r9]
  ret = *s;
     4cc:	e5d49000 	ldrb	r9, [r4]
  switch(*s){
     4d0:	e3590029 	cmp	r9, #41	; 0x29
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
     4d4:	e1a01009 	mov	r1, r9
  switch(*s){
     4d8:	8a000018 	bhi	540 <gettoken+0xd4>
     4dc:	e3590028 	cmp	r9, #40	; 0x28
     4e0:	2a00001d 	bcs	55c <gettoken+0xf0>
     4e4:	e3590000 	cmp	r9, #0
     4e8:	1a00003b 	bne	5dc <gettoken+0x170>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ec:	e3580000 	cmp	r8, #0
     4f0:	0a000000 	beq	4f8 <gettoken+0x8c>
    *eq = s;
     4f4:	e5884000 	str	r4, [r8]
  
  while(s < es && strchr(whitespace, *s))
     4f8:	e1560004 	cmp	r6, r4
     4fc:	81a05004 	movhi	r5, r4
     500:	8a000003 	bhi	514 <gettoken+0xa8>
     504:	ea00000a 	b	534 <gettoken+0xc8>
     508:	e1550006 	cmp	r5, r6
    s++;
     50c:	e1a04005 	mov	r4, r5
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
     510:	0a000007 	beq	534 <gettoken+0xc8>
     514:	e3010744 	movw	r0, #5956	; 0x1744
     518:	e5d51000 	ldrb	r1, [r5]
     51c:	e3400000 	movt	r0, #0
     520:	e1a04005 	mov	r4, r5
     524:	eb0001c9 	bl	c50 <strchr>
     528:	e2855001 	add	r5, r5, #1
     52c:	e3500000 	cmp	r0, #0
     530:	1afffff4 	bne	508 <gettoken+0x9c>
    s++;
  *ps = s;
     534:	e5874000 	str	r4, [r7]
  return ret;
}
     538:	e1a00009 	mov	r0, r9
     53c:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     540:	e359003e 	cmp	r9, #62	; 0x3e
     544:	1a000006 	bne	564 <gettoken+0xf8>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     548:	e5d43001 	ldrb	r3, [r4, #1]
     54c:	e353003e 	cmp	r3, #62	; 0x3e
      ret = '+';
      s++;
     550:	02844002 	addeq	r4, r4, #2
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     554:	03a0902b 	moveq	r9, #43	; 0x2b
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     558:	0affffe3 	beq	4ec <gettoken+0x80>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     55c:	e2844001 	add	r4, r4, #1
     560:	eaffffe1 	b	4ec <gettoken+0x80>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     564:	8a000019 	bhi	5d0 <gettoken+0x164>
     568:	e249303b 	sub	r3, r9, #59	; 0x3b
     56c:	e3530001 	cmp	r3, #1
     570:	9afffff9 	bls	55c <gettoken+0xf0>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     574:	e1560004 	cmp	r6, r4
     578:	9a00001a 	bls	5e8 <gettoken+0x17c>
     57c:	e1a05004 	mov	r5, r4
     580:	ea000007 	b	5a4 <gettoken+0x138>
     584:	e5d41000 	ldrb	r1, [r4]
     588:	eb0001b0 	bl	c50 <strchr>
     58c:	e3500000 	cmp	r0, #0
     590:	1a00000c 	bne	5c8 <gettoken+0x15c>
     594:	e1550006 	cmp	r5, r6
      s++;
     598:	e1a04005 	mov	r4, r5
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     59c:	0a000011 	beq	5e8 <gettoken+0x17c>
     5a0:	e5d51000 	ldrb	r1, [r5]
     5a4:	e3010744 	movw	r0, #5956	; 0x1744
     5a8:	e1a04005 	mov	r4, r5
     5ac:	e3400000 	movt	r0, #0
     5b0:	e2855001 	add	r5, r5, #1
     5b4:	eb0001a5 	bl	c50 <strchr>
     5b8:	e3500000 	cmp	r0, #0
     5bc:	e301074c 	movw	r0, #5964	; 0x174c
     5c0:	e3400000 	movt	r0, #0
     5c4:	0affffee 	beq	584 <gettoken+0x118>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     5c8:	e3a09061 	mov	r9, #97	; 0x61
     5cc:	eaffffc6 	b	4ec <gettoken+0x80>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     5d0:	e359007c 	cmp	r9, #124	; 0x7c
     5d4:	0affffe0 	beq	55c <gettoken+0xf0>
     5d8:	eaffffe5 	b	574 <gettoken+0x108>
     5dc:	e3590026 	cmp	r9, #38	; 0x26
     5e0:	1affffe3 	bne	574 <gettoken+0x108>
     5e4:	eaffffdc 	b	55c <gettoken+0xf0>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     5e8:	e3580000 	cmp	r8, #0
     5ec:	e3a09061 	mov	r9, #97	; 0x61
     5f0:	1affffbf 	bne	4f4 <gettoken+0x88>
     5f4:	eaffffce 	b	534 <gettoken+0xc8>

000005f8 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     5f8:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
     5fc:	e1a07000 	mov	r7, r0
  char *s;
  
  s = *ps;
     600:	e5905000 	ldr	r5, [r0]
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     604:	e28db01c 	add	fp, sp, #28
     608:	e1a08002 	mov	r8, r2
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     60c:	e1550001 	cmp	r5, r1
     610:	2a00000d 	bcs	64c <peek+0x54>
     614:	e1a06001 	mov	r6, r1
     618:	e1a04005 	mov	r4, r5
     61c:	ea000002 	b	62c <peek+0x34>
     620:	e1540006 	cmp	r4, r6
    s++;
     624:	e1a05004 	mov	r5, r4
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
     628:	0a000007 	beq	64c <peek+0x54>
     62c:	e3010744 	movw	r0, #5956	; 0x1744
     630:	e5d41000 	ldrb	r1, [r4]
     634:	e3400000 	movt	r0, #0
     638:	e1a05004 	mov	r5, r4
     63c:	eb000183 	bl	c50 <strchr>
     640:	e2844001 	add	r4, r4, #1
     644:	e3500000 	cmp	r0, #0
     648:	1afffff4 	bne	620 <peek+0x28>
    s++;
  *ps = s;
     64c:	e5875000 	str	r5, [r7]
  return *s && strchr(toks, *s);
     650:	e5d51000 	ldrb	r1, [r5]
     654:	e3510000 	cmp	r1, #0
     658:	1a000001 	bne	664 <peek+0x6c>
     65c:	e1a00001 	mov	r0, r1
}
     660:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
     664:	e1a00008 	mov	r0, r8
     668:	eb000178 	bl	c50 <strchr>
     66c:	e2900000 	adds	r0, r0, #0
     670:	13a00001 	movne	r0, #1
     674:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

00000678 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     678:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     67c:	e1a07000 	mov	r7, r0
     680:	e1a06001 	mov	r6, r1
     684:	e1a05002 	mov	r5, r2
     688:	e28db014 	add	fp, sp, #20
     68c:	e24dd010 	sub	sp, sp, #16
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     690:	e30126a8 	movw	r2, #5800	; 0x16a8
     694:	e1a01005 	mov	r1, r5
     698:	e3402000 	movt	r2, #0
     69c:	e1a00006 	mov	r0, r6
     6a0:	ebffffd4 	bl	5f8 <peek>
     6a4:	e3500000 	cmp	r0, #0
     6a8:	0a000023 	beq	73c <parseredirs+0xc4>
    tok = gettoken(ps, es, 0, 0);
     6ac:	e3a03000 	mov	r3, #0
     6b0:	e1a01005 	mov	r1, r5
     6b4:	e1a02003 	mov	r2, r3
     6b8:	e1a00006 	mov	r0, r6
     6bc:	ebffff6a 	bl	46c <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     6c0:	e24b3018 	sub	r3, fp, #24
     6c4:	e24b201c 	sub	r2, fp, #28
     6c8:	e1a01005 	mov	r1, r5
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
     6cc:	e1a04000 	mov	r4, r0
    if(gettoken(ps, es, &q, &eq) != 'a')
     6d0:	e1a00006 	mov	r0, r6
     6d4:	ebffff64 	bl	46c <gettoken>
     6d8:	e3500061 	cmp	r0, #97	; 0x61
     6dc:	1a000019 	bne	748 <parseredirs+0xd0>
      panic("missing file for redirection");
    switch(tok){
     6e0:	e354003c 	cmp	r4, #60	; 0x3c
     6e4:	0a00000c 	beq	71c <parseredirs+0xa4>
     6e8:	e354003e 	cmp	r4, #62	; 0x3e
     6ec:	0a000001 	beq	6f8 <parseredirs+0x80>
     6f0:	e354002b 	cmp	r4, #43	; 0x2b
     6f4:	1affffe5 	bne	690 <parseredirs+0x18>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6f8:	e1a00007 	mov	r0, r7
     6fc:	e3a0c001 	mov	ip, #1
     700:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     704:	e3003201 	movw	r3, #513	; 0x201
     708:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
     70c:	e58dc000 	str	ip, [sp]
     710:	ebffff11 	bl	35c <redircmd>
     714:	e1a07000 	mov	r7, r0
      break;
     718:	eaffffdc 	b	690 <parseredirs+0x18>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     71c:	e3a03000 	mov	r3, #0
     720:	e1a00007 	mov	r0, r7
     724:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     728:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
     72c:	e58d3000 	str	r3, [sp]
     730:	ebffff09 	bl	35c <redircmd>
     734:	e1a07000 	mov	r7, r0
      break;
     738:	eaffffd4 	b	690 <parseredirs+0x18>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     73c:	e1a00007 	mov	r0, r7
     740:	e24bd014 	sub	sp, fp, #20
     744:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     748:	e3010688 	movw	r0, #5768	; 0x1688
     74c:	e3400000 	movt	r0, #0
     750:	ebfffe7d 	bl	14c <panic>

00000754 <parseexec>:
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     754:	e30126ac 	movw	r2, #5804	; 0x16ac
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     758:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     75c:	e3402000 	movt	r2, #0
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     760:	e28db020 	add	fp, sp, #32
     764:	e24dd00c 	sub	sp, sp, #12
     768:	e1a05000 	mov	r5, r0
     76c:	e1a06001 	mov	r6, r1
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
     770:	ebffffa0 	bl	5f8 <peek>
     774:	e2504000 	subs	r4, r0, #0
     778:	1a000027 	bne	81c <parseexec+0xc8>
    return parseblock(ps, es);

  ret = execcmd();
     77c:	ebfffeea 	bl	32c <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     780:	e1a02006 	mov	r2, r6
     784:	e1a01005 	mov	r1, r5
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     788:	e1a0a000 	mov	sl, r0
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     78c:	ebffffb9 	bl	678 <parseredirs>
     790:	e1a0900a 	mov	r9, sl
     794:	e28a8028 	add	r8, sl, #40	; 0x28
     798:	e1a07000 	mov	r7, r0
     79c:	ea000004 	b	7b4 <parseexec+0x60>
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7a0:	e1a00007 	mov	r0, r7
     7a4:	e1a02006 	mov	r2, r6
     7a8:	e1a01005 	mov	r1, r5
     7ac:	ebffffb1 	bl	678 <parseredirs>
     7b0:	e1a07000 	mov	r7, r0
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     7b4:	e30126c8 	movw	r2, #5832	; 0x16c8
     7b8:	e1a01006 	mov	r1, r6
     7bc:	e3402000 	movt	r2, #0
     7c0:	e1a00005 	mov	r0, r5
     7c4:	ebffff8b 	bl	5f8 <peek>
     7c8:	e3500000 	cmp	r0, #0
     7cc:	1a000017 	bne	830 <parseexec+0xdc>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7d0:	e24b3028 	sub	r3, fp, #40	; 0x28
     7d4:	e24b202c 	sub	r2, fp, #44	; 0x2c
     7d8:	e1a01006 	mov	r1, r6
     7dc:	e1a00005 	mov	r0, r5
     7e0:	ebffff21 	bl	46c <gettoken>
     7e4:	e3500000 	cmp	r0, #0
     7e8:	0a000010 	beq	830 <parseexec+0xdc>
      break;
    if(tok != 'a')
     7ec:	e3500061 	cmp	r0, #97	; 0x61
     7f0:	1a000015 	bne	84c <parseexec+0xf8>
      panic("syntax");
    cmd->argv[argc] = q;
     7f4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
    cmd->eargv[argc] = eq;
    argc++;
     7f8:	e2844001 	add	r4, r4, #1
    if(argc >= MAXARGS)
     7fc:	e354000a 	cmp	r4, #10
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     800:	e5a93004 	str	r3, [r9, #4]!
    cmd->eargv[argc] = eq;
     804:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
     808:	e5a83004 	str	r3, [r8, #4]!
    argc++;
    if(argc >= MAXARGS)
     80c:	1affffe3 	bne	7a0 <parseexec+0x4c>
      panic("too many args");
     810:	e30106b8 	movw	r0, #5816	; 0x16b8
     814:	e3400000 	movt	r0, #0
     818:	ebfffe4b 	bl	14c <panic>
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    return parseblock(ps, es);
     81c:	e1a01006 	mov	r1, r6
     820:	e1a00005 	mov	r0, r5
     824:	eb000051 	bl	970 <parseblock>
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     828:	e24bd020 	sub	sp, fp, #32
     82c:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
     830:	e08a4104 	add	r4, sl, r4, lsl #2
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     834:	e3a03000 	mov	r3, #0
     838:	e1a00007 	mov	r0, r7
     83c:	e5843004 	str	r3, [r4, #4]
  cmd->eargv[argc] = 0;
     840:	e584302c 	str	r3, [r4, #44]	; 0x2c
  return ret;
}
     844:	e24bd020 	sub	sp, fp, #32
     848:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     84c:	e30106b0 	movw	r0, #5808	; 0x16b0
     850:	e3400000 	movt	r0, #0
     854:	ebfffe3c 	bl	14c <panic>

00000858 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     858:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     85c:	e28db014 	add	fp, sp, #20
     860:	e1a04000 	mov	r4, r0
     864:	e1a05001 	mov	r5, r1
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     868:	ebffffb9 	bl	754 <parseexec>
  if(peek(ps, es, "|")){
     86c:	e30126d0 	movw	r2, #5840	; 0x16d0
     870:	e1a01005 	mov	r1, r5
     874:	e3402000 	movt	r2, #0
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     878:	e1a06000 	mov	r6, r0
  if(peek(ps, es, "|")){
     87c:	e1a00004 	mov	r0, r4
     880:	ebffff5c 	bl	5f8 <peek>
     884:	e3500000 	cmp	r0, #0
     888:	1a000001 	bne	894 <parsepipe+0x3c>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     88c:	e1a00006 	mov	r0, r6
     890:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     894:	e3a03000 	mov	r3, #0
     898:	e1a01005 	mov	r1, r5
     89c:	e1a02003 	mov	r2, r3
     8a0:	e1a00004 	mov	r0, r4
     8a4:	ebfffef0 	bl	46c <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8a8:	e1a01005 	mov	r1, r5
     8ac:	e1a00004 	mov	r0, r4
     8b0:	ebffffe8 	bl	858 <parsepipe>
     8b4:	e1a01000 	mov	r1, r0
     8b8:	e1a00006 	mov	r0, r6
  }
  return cmd;
}
     8bc:	e24bd014 	sub	sp, fp, #20
     8c0:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8c4:	eafffeba 	b	3b4 <pipecmd>

000008c8 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     8c8:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
     8cc:	e28db014 	add	fp, sp, #20
     8d0:	e1a04000 	mov	r4, r0
     8d4:	e1a05001 	mov	r5, r1
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     8d8:	ebffffde 	bl	858 <parsepipe>
     8dc:	e1a06000 	mov	r6, r0
  while(peek(ps, es, "&")){
     8e0:	ea000003 	b	8f4 <parseline+0x2c>
    gettoken(ps, es, 0, 0);
     8e4:	ebfffee0 	bl	46c <gettoken>
    cmd = backcmd(cmd);
     8e8:	e1a00006 	mov	r0, r6
     8ec:	ebfffed0 	bl	434 <backcmd>
     8f0:	e1a06000 	mov	r6, r0
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     8f4:	e30126d4 	movw	r2, #5844	; 0x16d4
     8f8:	e1a01005 	mov	r1, r5
     8fc:	e3402000 	movt	r2, #0
     900:	e1a00004 	mov	r0, r4
     904:	ebffff3b 	bl	5f8 <peek>
    gettoken(ps, es, 0, 0);
     908:	e3a03000 	mov	r3, #0
     90c:	e1a02003 	mov	r2, r3
     910:	e1a01005 	mov	r1, r5
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     914:	e2507000 	subs	r7, r0, #0
    gettoken(ps, es, 0, 0);
     918:	e1a00004 	mov	r0, r4
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     91c:	1afffff0 	bne	8e4 <parseline+0x1c>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     920:	e30126d8 	movw	r2, #5848	; 0x16d8
     924:	e3402000 	movt	r2, #0
     928:	ebffff32 	bl	5f8 <peek>
     92c:	e3500000 	cmp	r0, #0
     930:	1a000001 	bne	93c <parseline+0x74>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     934:	e1a00006 	mov	r0, r6
     938:	e8bd88f0 	pop	{r4, r5, r6, r7, fp, pc}
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     93c:	e1a03007 	mov	r3, r7
     940:	e1a02007 	mov	r2, r7
     944:	e1a01005 	mov	r1, r5
     948:	e1a00004 	mov	r0, r4
     94c:	ebfffec6 	bl	46c <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     950:	e1a01005 	mov	r1, r5
     954:	e1a00004 	mov	r0, r4
     958:	ebffffda 	bl	8c8 <parseline>
     95c:	e1a01000 	mov	r1, r0
     960:	e1a00006 	mov	r0, r6
  }
  return cmd;
}
     964:	e24bd014 	sub	sp, fp, #20
     968:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     96c:	eafffea0 	b	3f4 <listcmd>

00000970 <parseblock>:
struct cmd*
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     970:	e30126ac 	movw	r2, #5804	; 0x16ac
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     974:	e92d48f0 	push	{r4, r5, r6, r7, fp, lr}
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     978:	e3402000 	movt	r2, #0
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     97c:	e28db014 	add	fp, sp, #20
     980:	e1a04000 	mov	r4, r0
     984:	e1a05001 	mov	r5, r1
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     988:	ebffff1a 	bl	5f8 <peek>
     98c:	e3500000 	cmp	r0, #0
     990:	0a00001a 	beq	a00 <parseblock+0x90>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     994:	e3a03000 	mov	r3, #0
     998:	e1a01005 	mov	r1, r5
     99c:	e1a02003 	mov	r2, r3
     9a0:	e1a00004 	mov	r0, r4
     9a4:	ebfffeb0 	bl	46c <gettoken>
  cmd = parseline(ps, es);
     9a8:	e1a01005 	mov	r1, r5
     9ac:	e1a00004 	mov	r0, r4
     9b0:	ebffffc4 	bl	8c8 <parseline>
  if(!peek(ps, es, ")"))
     9b4:	e30126e8 	movw	r2, #5864	; 0x16e8
     9b8:	e1a01005 	mov	r1, r5
     9bc:	e3402000 	movt	r2, #0
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     9c0:	e1a06000 	mov	r6, r0
  if(!peek(ps, es, ")"))
     9c4:	e1a00004 	mov	r0, r4
     9c8:	ebffff0a 	bl	5f8 <peek>
     9cc:	e3500000 	cmp	r0, #0
     9d0:	0a00000d 	beq	a0c <parseblock+0x9c>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     9d4:	e3a03000 	mov	r3, #0
     9d8:	e1a01005 	mov	r1, r5
     9dc:	e1a02003 	mov	r2, r3
     9e0:	e1a00004 	mov	r0, r4
     9e4:	ebfffea0 	bl	46c <gettoken>
  cmd = parseredirs(cmd, ps, es);
     9e8:	e1a02005 	mov	r2, r5
     9ec:	e1a01004 	mov	r1, r4
     9f0:	e1a00006 	mov	r0, r6
  return cmd;
}
     9f4:	e24bd014 	sub	sp, fp, #20
     9f8:	e8bd48f0 	pop	{r4, r5, r6, r7, fp, lr}
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
  cmd = parseredirs(cmd, ps, es);
     9fc:	eaffff1d 	b	678 <parseredirs>
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     a00:	e30106dc 	movw	r0, #5852	; 0x16dc
     a04:	e3400000 	movt	r0, #0
     a08:	ebfffdcf 	bl	14c <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     a0c:	e30106ec 	movw	r0, #5868	; 0x16ec
     a10:	e3400000 	movt	r0, #0
     a14:	ebfffdcc 	bl	14c <panic>

00000a18 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a18:	e92d4830 	push	{r4, r5, fp, lr}
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a1c:	e2504000 	subs	r4, r0, #0
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a20:	e28db00c 	add	fp, sp, #12
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a24:	0a00000b 	beq	a58 <nulterminate+0x40>
    return 0;
  
  switch(cmd->type){
     a28:	e5943000 	ldr	r3, [r4]
     a2c:	e2433001 	sub	r3, r3, #1
     a30:	e3530004 	cmp	r3, #4
     a34:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
     a38:	ea000006 	b	a58 <nulterminate+0x40>
     a3c:	00000a78 	.word	0x00000a78
     a40:	00000aac 	.word	0x00000aac
     a44:	00000a60 	.word	0x00000a60
     a48:	00000a60 	.word	0x00000a60
     a4c:	00000a50 	.word	0x00000a50
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     a50:	e5940004 	ldr	r0, [r4, #4]
     a54:	ebffffef 	bl	a18 <nulterminate>
    break;
  }
  return cmd;
}
     a58:	e1a00004 	mov	r0, r4
     a5c:	e8bd8830 	pop	{r4, r5, fp, pc}
    nulterminate(pcmd->right);
    break;
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     a60:	e5940004 	ldr	r0, [r4, #4]
     a64:	ebffffeb 	bl	a18 <nulterminate>
    nulterminate(lcmd->right);
     a68:	e5940008 	ldr	r0, [r4, #8]
     a6c:	ebffffe9 	bl	a18 <nulterminate>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a70:	e1a00004 	mov	r0, r4
     a74:	e8bd8830 	pop	{r4, r5, fp, pc}
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a78:	e5943004 	ldr	r3, [r4, #4]
     a7c:	e3530000 	cmp	r3, #0
     a80:	0afffff4 	beq	a58 <nulterminate+0x40>
     a84:	e2842028 	add	r2, r4, #40	; 0x28
     a88:	e2843004 	add	r3, r4, #4
      *ecmd->eargv[i] = 0;
     a8c:	e3a00000 	mov	r0, #0
     a90:	e5b21004 	ldr	r1, [r2, #4]!
     a94:	e5c10000 	strb	r0, [r1]
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a98:	e5b31004 	ldr	r1, [r3, #4]!
     a9c:	e3510000 	cmp	r1, #0
     aa0:	1afffffa 	bne	a90 <nulterminate+0x78>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     aa4:	e1a00004 	mov	r0, r4
     aa8:	e8bd8830 	pop	{r4, r5, fp, pc}
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     aac:	e5940004 	ldr	r0, [r4, #4]
     ab0:	ebffffd8 	bl	a18 <nulterminate>
    *rcmd->efile = 0;
     ab4:	e594300c 	ldr	r3, [r4, #12]
     ab8:	e3a02000 	mov	r2, #0
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     abc:	e1a00004 	mov	r0, r4
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     ac0:	e5c32000 	strb	r2, [r3]
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ac4:	e8bd8830 	pop	{r4, r5, fp, pc}

00000ac8 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     ac8:	e92d4870 	push	{r4, r5, r6, fp, lr}
     acc:	e28db010 	add	fp, sp, #16
     ad0:	e24b5014 	sub	r5, fp, #20
     ad4:	e24dd00c 	sub	sp, sp, #12
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     ad8:	e1a04000 	mov	r4, r0
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     adc:	e5250004 	str	r0, [r5, #-4]!
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     ae0:	eb00003c 	bl	bd8 <strlen>
     ae4:	e0844000 	add	r4, r4, r0
  cmd = parseline(&s, es);
     ae8:	e1a00005 	mov	r0, r5
     aec:	e1a01004 	mov	r1, r4
     af0:	ebffff74 	bl	8c8 <parseline>
  peek(&s, es, "");
     af4:	e30126cc 	movw	r2, #5836	; 0x16cc
     af8:	e3402000 	movt	r2, #0
     afc:	e1a01004 	mov	r1, r4
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
     b00:	e1a06000 	mov	r6, r0
  peek(&s, es, "");
     b04:	e1a00005 	mov	r0, r5
     b08:	ebfffeba 	bl	5f8 <peek>
  if(s != es){
     b0c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
     b10:	e1540002 	cmp	r4, r2
     b14:	1a000004 	bne	b2c <parsecmd+0x64>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     b18:	e1a00006 	mov	r0, r6
     b1c:	ebffffbd 	bl	a18 <nulterminate>
  return cmd;
}
     b20:	e1a00006 	mov	r0, r6
     b24:	e24bd010 	sub	sp, fp, #16
     b28:	e8bd8870 	pop	{r4, r5, r6, fp, pc}

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     b2c:	e3011700 	movw	r1, #5888	; 0x1700
     b30:	e3a00002 	mov	r0, #2
     b34:	e3401000 	movt	r1, #0
     b38:	eb0001fb 	bl	132c <printf>
    panic("syntax");
     b3c:	e30106b0 	movw	r0, #5808	; 0x16b0
     b40:	e3400000 	movt	r0, #0
     b44:	ebfffd80 	bl	14c <panic>

00000b48 <strcpy>:
#include "user.h"
#include "arm.h"

char*
strcpy(char *s, char *t)
{
     b48:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b4c:	e2402001 	sub	r2, r0, #1
     b50:	e28db000 	add	fp, sp, #0
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b54:	e4d13001 	ldrb	r3, [r1], #1
     b58:	e3530000 	cmp	r3, #0
     b5c:	e5e23001 	strb	r3, [r2, #1]!
     b60:	1afffffb 	bne	b54 <strcpy+0xc>
    ;
  return os;
}
     b64:	e24bd000 	sub	sp, fp, #0
     b68:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     b6c:	e12fff1e 	bx	lr

00000b70 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     b74:	e28db000 	add	fp, sp, #0
  while(*p && *p == *q)
     b78:	e5d03000 	ldrb	r3, [r0]
     b7c:	e3530000 	cmp	r3, #0
     b80:	05d10000 	ldrbeq	r0, [r1]
     b84:	0a00000a 	beq	bb4 <strcmp+0x44>
     b88:	e5d12000 	ldrb	r2, [r1]
     b8c:	e1530002 	cmp	r3, r2
     b90:	0a000003 	beq	ba4 <strcmp+0x34>
     b94:	ea00000a 	b	bc4 <strcmp+0x54>
     b98:	e5f12001 	ldrb	r2, [r1, #1]!
     b9c:	e1530002 	cmp	r3, r2
     ba0:	1a000007 	bne	bc4 <strcmp+0x54>
     ba4:	e5f03001 	ldrb	r3, [r0, #1]!
     ba8:	e3530000 	cmp	r3, #0
     bac:	1afffff9 	bne	b98 <strcmp+0x28>
     bb0:	e5d10001 	ldrb	r0, [r1, #1]
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     bb4:	e0600003 	rsb	r0, r0, r3
     bb8:	e24bd000 	sub	sp, fp, #0
     bbc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     bc0:	e12fff1e 	bx	lr
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     bc4:	e1a00002 	mov	r0, r2
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
     bc8:	e0600003 	rsb	r0, r0, r3
     bcc:	e24bd000 	sub	sp, fp, #0
     bd0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     bd4:	e12fff1e 	bx	lr

00000bd8 <strlen>:

uint
strlen(char *s)
{
     bd8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     bdc:	e28db000 	add	fp, sp, #0
  int n;

  for(n = 0; s[n]; n++)
     be0:	e5d03000 	ldrb	r3, [r0]
     be4:	e3530000 	cmp	r3, #0
     be8:	0a000009 	beq	c14 <strlen+0x3c>
     bec:	e1a02000 	mov	r2, r0
     bf0:	e3a03000 	mov	r3, #0
     bf4:	e5f21001 	ldrb	r1, [r2, #1]!
     bf8:	e2833001 	add	r3, r3, #1
     bfc:	e3510000 	cmp	r1, #0
     c00:	e1a00003 	mov	r0, r3
     c04:	1afffffa 	bne	bf4 <strlen+0x1c>
    ;
  return n;
}
     c08:	e24bd000 	sub	sp, fp, #0
     c0c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c10:	e12fff1e 	bx	lr
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     c14:	e1a00003 	mov	r0, r3
     c18:	eafffffa 	b	c08 <strlen+0x30>

00000c1c <memset>:
memset(void *dst, int c, uint n)
{
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
     c1c:	e3520000 	cmp	r2, #0
  return n;
}

void*
memset(void *dst, int c, uint n)
{
     c20:	e1a03000 	mov	r3, r0
     c24:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c28:	e28db000 	add	fp, sp, #0
  char *p=dst;
  u32 rc=n;

  while (rc-- > 0) *p++ = c;
     c2c:	0a000004 	beq	c44 <memset+0x28>
     c30:	e6ef1071 	uxtb	r1, r1
     c34:	e0800002 	add	r0, r0, r2
     c38:	e4c31001 	strb	r1, [r3], #1
     c3c:	e1500003 	cmp	r0, r3
     c40:	1afffffc 	bne	c38 <memset+0x1c>
  return (void *)p;
}
     c44:	e24bd000 	sub	sp, fp, #0
     c48:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c4c:	e12fff1e 	bx	lr

00000c50 <strchr>:

char*
strchr(const char *s, char c)
{
     c50:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c54:	e28db000 	add	fp, sp, #0
  for(; *s; s++)
     c58:	e5d02000 	ldrb	r2, [r0]
     c5c:	e3520000 	cmp	r2, #0
     c60:	0a00000b 	beq	c94 <strchr+0x44>
    if(*s == c)
     c64:	e1510002 	cmp	r1, r2
     c68:	1a000002 	bne	c78 <strchr+0x28>
     c6c:	ea000005 	b	c88 <strchr+0x38>
     c70:	e1530001 	cmp	r3, r1
     c74:	0a000003 	beq	c88 <strchr+0x38>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     c78:	e5f03001 	ldrb	r3, [r0, #1]!
     c7c:	e3530000 	cmp	r3, #0
     c80:	1afffffa 	bne	c70 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     c84:	e1a00003 	mov	r0, r3
}
     c88:	e24bd000 	sub	sp, fp, #0
     c8c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     c90:	e12fff1e 	bx	lr
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
     c94:	e1a00002 	mov	r0, r2
     c98:	eafffffa 	b	c88 <strchr+0x38>

00000c9c <gets>:
}

char*
gets(char *buf, int max)
{
     c9c:	e92d49f0 	push	{r4, r5, r6, r7, r8, fp, lr}
     ca0:	e1a08000 	mov	r8, r0
     ca4:	e28db018 	add	fp, sp, #24
     ca8:	e1a07001 	mov	r7, r1
     cac:	e24dd00c 	sub	sp, sp, #12
     cb0:	e2406001 	sub	r6, r0, #1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     cb4:	e3a05000 	mov	r5, #0
     cb8:	ea000008 	b	ce0 <gets+0x44>
    cc = read(0, &c, 1);
     cbc:	eb000076 	bl	e9c <read>
    if(cc < 1)
     cc0:	e3500000 	cmp	r0, #0
     cc4:	da00000b 	ble	cf8 <gets+0x5c>
      break;
    buf[i++] = c;
     cc8:	e55b301d 	ldrb	r3, [fp, #-29]	; 0xffffffe3
     ccc:	e1a05004 	mov	r5, r4
    if(c == '\n' || c == '\r')
     cd0:	e353000d 	cmp	r3, #13
     cd4:	1353000a 	cmpne	r3, #10

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     cd8:	e5e63001 	strb	r3, [r6, #1]!
    if(c == '\n' || c == '\r')
     cdc:	0a000005 	beq	cf8 <gets+0x5c>
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     ce0:	e3a02001 	mov	r2, #1
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ce4:	e0854002 	add	r4, r5, r2
     ce8:	e1540007 	cmp	r4, r7
    cc = read(0, &c, 1);
     cec:	e24b101d 	sub	r1, fp, #29
     cf0:	e3a00000 	mov	r0, #0
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     cf4:	bafffff0 	blt	cbc <gets+0x20>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     cf8:	e3a03000 	mov	r3, #0
  return buf;
}
     cfc:	e1a00008 	mov	r0, r8
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     d00:	e7c83005 	strb	r3, [r8, r5]
  return buf;
}
     d04:	e24bd018 	sub	sp, fp, #24
     d08:	e8bd89f0 	pop	{r4, r5, r6, r7, r8, fp, pc}

00000d0c <stat>:

int
stat(char *n, struct stat *st)
{
     d0c:	e92d4830 	push	{r4, r5, fp, lr}
     d10:	e1a04001 	mov	r4, r1
     d14:	e28db00c 	add	fp, sp, #12
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d18:	e3a01000 	mov	r1, #0
     d1c:	eb00009f 	bl	fa0 <open>
  if(fd < 0)
     d20:	e2505000 	subs	r5, r0, #0
     d24:	ba000006 	blt	d44 <stat+0x38>
    return -1;
  r = fstat(fd, st);
     d28:	e1a01004 	mov	r1, r4
     d2c:	eb0000c2 	bl	103c <fstat>
     d30:	e1a04000 	mov	r4, r0
  close(fd);
     d34:	e1a00005 	mov	r0, r5
     d38:	eb000071 	bl	f04 <close>
  return r;
     d3c:	e1a00004 	mov	r0, r4
     d40:	e8bd8830 	pop	{r4, r5, fp, pc}
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     d44:	e3e00000 	mvn	r0, #0
  r = fstat(fd, st);
  close(fd);
  return r;
}
     d48:	e8bd8830 	pop	{r4, r5, fp, pc}

00000d4c <atoi>:

int
atoi(const char *s)
{
     d4c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     d50:	e28db000 	add	fp, sp, #0
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d54:	e5d01000 	ldrb	r1, [r0]
     d58:	e2413030 	sub	r3, r1, #48	; 0x30
     d5c:	e3530009 	cmp	r3, #9
     d60:	e3a03000 	mov	r3, #0
     d64:	8a000007 	bhi	d88 <atoi+0x3c>
    n = n*10 + *s++ - '0';
     d68:	e1a02183 	lsl	r2, r3, #3
     d6c:	e0823083 	add	r3, r2, r3, lsl #1
     d70:	e0833001 	add	r3, r3, r1
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d74:	e5f01001 	ldrb	r1, [r0, #1]!
    n = n*10 + *s++ - '0';
     d78:	e2433030 	sub	r3, r3, #48	; 0x30
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d7c:	e2412030 	sub	r2, r1, #48	; 0x30
     d80:	e3520009 	cmp	r2, #9
     d84:	9afffff7 	bls	d68 <atoi+0x1c>
    n = n*10 + *s++ - '0';
  return n;
}
     d88:	e1a00003 	mov	r0, r3
     d8c:	e24bd000 	sub	sp, fp, #0
     d90:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     d94:	e12fff1e 	bx	lr

00000d98 <memmove>:
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d98:	e3520000 	cmp	r2, #0
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
     d9c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     da0:	e28db000 	add	fp, sp, #0
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     da4:	da000005 	ble	dc0 <memmove+0x28>
     da8:	e0812002 	add	r2, r1, r2
     dac:	e2403001 	sub	r3, r0, #1
    *dst++ = *src++;
     db0:	e4d1c001 	ldrb	ip, [r1], #1
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     db4:	e1510002 	cmp	r1, r2
    *dst++ = *src++;
     db8:	e5e3c001 	strb	ip, [r3, #1]!
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     dbc:	1afffffb 	bne	db0 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     dc0:	e24bd000 	sub	sp, fp, #0
     dc4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
     dc8:	e12fff1e 	bx	lr

00000dcc <fork>:
     dcc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     dd0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     dd4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     dd8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ddc:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     de0:	e3a00001 	mov	r0, #1
     de4:	ef000040 	svc	0x00000040
     de8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     dec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     df0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     df4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     df8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     dfc:	e12fff1e 	bx	lr

00000e00 <exit>:
     e00:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e04:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e08:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e0c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e10:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e14:	e3a00002 	mov	r0, #2
     e18:	ef000040 	svc	0x00000040
     e1c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e20:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e24:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e28:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e2c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e30:	e12fff1e 	bx	lr

00000e34 <wait>:
     e34:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e38:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e3c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e40:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e44:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e48:	e3a00003 	mov	r0, #3
     e4c:	ef000040 	svc	0x00000040
     e50:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e54:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e58:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e5c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e60:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e64:	e12fff1e 	bx	lr

00000e68 <pipe>:
     e68:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     e6c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     e70:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     e74:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     e78:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     e7c:	e3a00004 	mov	r0, #4
     e80:	ef000040 	svc	0x00000040
     e84:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e88:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     e8c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     e90:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     e94:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     e98:	e12fff1e 	bx	lr

00000e9c <read>:
     e9c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ea0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ea4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     ea8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     eac:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     eb0:	e3a00005 	mov	r0, #5
     eb4:	ef000040 	svc	0x00000040
     eb8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ebc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ec0:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ec4:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     ec8:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     ecc:	e12fff1e 	bx	lr

00000ed0 <write>:
     ed0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     ed4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     ed8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     edc:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     ee0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     ee4:	e3a00010 	mov	r0, #16
     ee8:	ef000040 	svc	0x00000040
     eec:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ef0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ef4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ef8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     efc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f00:	e12fff1e 	bx	lr

00000f04 <close>:
     f04:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f08:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f0c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f10:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f14:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f18:	e3a00015 	mov	r0, #21
     f1c:	ef000040 	svc	0x00000040
     f20:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f24:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f28:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f2c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f30:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f34:	e12fff1e 	bx	lr

00000f38 <kill>:
     f38:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f3c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f40:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f44:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f48:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f4c:	e3a00006 	mov	r0, #6
     f50:	ef000040 	svc	0x00000040
     f54:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f58:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f5c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f60:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f64:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f68:	e12fff1e 	bx	lr

00000f6c <exec>:
     f6c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     f70:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     f74:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     f78:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     f7c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     f80:	e3a00007 	mov	r0, #7
     f84:	ef000040 	svc	0x00000040
     f88:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f8c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     f90:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     f94:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     f98:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     f9c:	e12fff1e 	bx	lr

00000fa0 <open>:
     fa0:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fa4:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fa8:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     fac:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fb0:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     fb4:	e3a0000f 	mov	r0, #15
     fb8:	ef000040 	svc	0x00000040
     fbc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fc0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     fc4:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     fc8:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
     fcc:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
     fd0:	e12fff1e 	bx	lr

00000fd4 <mknod>:
     fd4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
     fd8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
     fdc:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
     fe0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
     fe4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
     fe8:	e3a00011 	mov	r0, #17
     fec:	ef000040 	svc	0x00000040
     ff0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ff4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
     ff8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
     ffc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1000:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1004:	e12fff1e 	bx	lr

00001008 <unlink>:
    1008:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    100c:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1010:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1014:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1018:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    101c:	e3a00012 	mov	r0, #18
    1020:	ef000040 	svc	0x00000040
    1024:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1028:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    102c:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1030:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1034:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1038:	e12fff1e 	bx	lr

0000103c <fstat>:
    103c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1040:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1044:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1048:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    104c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1050:	e3a00008 	mov	r0, #8
    1054:	ef000040 	svc	0x00000040
    1058:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    105c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1060:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1064:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1068:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    106c:	e12fff1e 	bx	lr

00001070 <link>:
    1070:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1074:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1078:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    107c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1080:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1084:	e3a00013 	mov	r0, #19
    1088:	ef000040 	svc	0x00000040
    108c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1090:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1094:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1098:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    109c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10a0:	e12fff1e 	bx	lr

000010a4 <mkdir>:
    10a4:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10a8:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10ac:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10b0:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10b4:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10b8:	e3a00014 	mov	r0, #20
    10bc:	ef000040 	svc	0x00000040
    10c0:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10c8:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    10cc:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    10d0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    10d4:	e12fff1e 	bx	lr

000010d8 <chdir>:
    10d8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    10dc:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    10e0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    10e4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    10e8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    10ec:	e3a00009 	mov	r0, #9
    10f0:	ef000040 	svc	0x00000040
    10f4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    10fc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1100:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1104:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1108:	e12fff1e 	bx	lr

0000110c <dup>:
    110c:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1110:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1114:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1118:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    111c:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1120:	e3a0000a 	mov	r0, #10
    1124:	ef000040 	svc	0x00000040
    1128:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    112c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1130:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1134:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1138:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    113c:	e12fff1e 	bx	lr

00001140 <getpid>:
    1140:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1144:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    1148:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    114c:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1150:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1154:	e3a0000b 	mov	r0, #11
    1158:	ef000040 	svc	0x00000040
    115c:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1160:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1164:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1168:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    116c:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    1170:	e12fff1e 	bx	lr

00001174 <sbrk>:
    1174:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    1178:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    117c:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    1180:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    1184:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    1188:	e3a0000c 	mov	r0, #12
    118c:	ef000040 	svc	0x00000040
    1190:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1194:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1198:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    119c:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    11a0:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    11a4:	e12fff1e 	bx	lr

000011a8 <sleep>:
    11a8:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    11ac:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    11b0:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    11b4:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    11b8:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    11bc:	e3a0000d 	mov	r0, #13
    11c0:	ef000040 	svc	0x00000040
    11c4:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    11c8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    11cc:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    11d0:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    11d4:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    11d8:	e12fff1e 	bx	lr

000011dc <uptime>:
    11dc:	e52de004 	push	{lr}		; (str lr, [sp, #-4]!)
    11e0:	e52d3004 	push	{r3}		; (str r3, [sp, #-4]!)
    11e4:	e52d2004 	push	{r2}		; (str r2, [sp, #-4]!)
    11e8:	e52d1004 	push	{r1}		; (str r1, [sp, #-4]!)
    11ec:	e52d0004 	push	{r0}		; (str r0, [sp, #-4]!)
    11f0:	e3a0000e 	mov	r0, #14
    11f4:	ef000040 	svc	0x00000040
    11f8:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    11fc:	e49d1004 	pop	{r1}		; (ldr r1, [sp], #4)
    1200:	e49d2004 	pop	{r2}		; (ldr r2, [sp], #4)
    1204:	e49d3004 	pop	{r3}		; (ldr r3, [sp], #4)
    1208:	e49de004 	pop	{lr}		; (ldr lr, [sp], #4)
    120c:	e12fff1e 	bx	lr

00001210 <printint>:
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1210:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    1214:	e1a09fa1 	lsr	r9, r1, #31
    1218:	e3530000 	cmp	r3, #0
    121c:	03a03000 	moveq	r3, #0
    1220:	12093001 	andne	r3, r9, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1224:	e28db01c 	add	fp, sp, #28
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    1228:	e3530000 	cmp	r3, #0
    122c:	e3018728 	movw	r8, #5928	; 0x1728
    neg = 1;
    x = -xx;
    1230:	1261e000 	rsbne	lr, r1, #0
    1234:	e24b602d 	sub	r6, fp, #45	; 0x2d
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1238:	e1a04000 	mov	r4, r0
  int i, neg;
  uint x, y, b;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    123c:	13a09001 	movne	r9, #1
    x = -xx;
  } else {
    x = xx;
    1240:	01a0e001 	moveq	lr, r1
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x, y, b;

  neg = 0;
    1244:	01a09003 	moveq	r9, r3
    1248:	e3408000 	movt	r8, #0
  } else {
    x = xx;
  }

  b = base;
  i = 0;
    124c:	e3a07000 	mov	r7, #0
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
    1250:	e3a05001 	mov	r5, #1
    return q;
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1254:	e24dd018 	sub	sp, sp, #24
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    1258:	e3a0c000 	mov	ip, #0
    int i;

    for(i=31;i>=0;i--){
    125c:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    1260:	e1a0100c 	mov	r1, ip
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
    1264:	e1a0033e 	lsr	r0, lr, r3
    1268:	e2000001 	and	r0, r0, #1
    126c:	e1801081 	orr	r1, r0, r1, lsl #1
        if(r >= d) {
    1270:	e1520001 	cmp	r2, r1
            r = r - d;
    1274:	90621001 	rsbls	r1, r2, r1
            q = q | (1 << i);
    1278:	918cc315 	orrls	ip, ip, r5, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    127c:	e2533001 	subs	r3, r3, #1
    1280:	2afffff7 	bcs	1264 <printint+0x54>

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    1284:	e06ee29c 	mls	lr, ip, r2, lr
  }while((x = y) != 0);
    1288:	e35c0000 	cmp	ip, #0

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    128c:	e2873001 	add	r3, r7, #1
    1290:	e7d8100e 	ldrb	r1, [r8, lr]
    1294:	e5e61001 	strb	r1, [r6, #1]!
  }while((x = y) != 0);
    1298:	11a0e00c 	movne	lr, ip

  b = base;
  i = 0;
  do{
    y = div(x, b);
    buf[i++] = digits[x - y * b];
    129c:	11a07003 	movne	r7, r3
    12a0:	1affffec 	bne	1258 <printint+0x48>
  }while((x = y) != 0);
  if(neg)
    12a4:	e3590000 	cmp	r9, #0
    12a8:	e24b602c 	sub	r6, fp, #44	; 0x2c
    buf[i++] = '-';
    12ac:	124b201c 	subne	r2, fp, #28
    12b0:	10822003 	addne	r2, r2, r3
    12b4:	12873002 	addne	r3, r7, #2
    12b8:	e0865003 	add	r5, r6, r3
    12bc:	13a0102d 	movne	r1, #45	; 0x2d
    12c0:	15421010 	strbne	r1, [r2, #-16]

  while(--i >= 0)
    putc(fd, buf[i]);
    12c4:	e5753001 	ldrb	r3, [r5, #-1]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    12c8:	e3a02001 	mov	r2, #1
    12cc:	e24b102d 	sub	r1, fp, #45	; 0x2d
    12d0:	e1a00004 	mov	r0, r4
    12d4:	e54b302d 	strb	r3, [fp, #-45]	; 0xffffffd3
    12d8:	ebfffefc 	bl	ed0 <write>
    buf[i++] = digits[x - y * b];
  }while((x = y) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    12dc:	e1560005 	cmp	r6, r5
    12e0:	1afffff7 	bne	12c4 <printint+0xb4>
    putc(fd, buf[i]);
}
    12e4:	e24bd01c 	sub	sp, fp, #28
    12e8:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}

000012ec <div>:
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    12ec:	e92d4810 	push	{r4, fp, lr}
    u32 q=0, r=0;
    12f0:	e3a02000 	mov	r2, #0
{
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    12f4:	e28db008 	add	fp, sp, #8
    12f8:	e1a0e000 	mov	lr, r0
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    12fc:	e3a0301f 	mov	r3, #31
  write(fd, &c, 1);
}

u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    1300:	e1a00002 	mov	r0, r2
    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
        if(r >= d) {
            r = r - d;
            q = q | (1 << i);
    1304:	e3a04001 	mov	r4, #1
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
        r = r << 1;
        r = r | ((n >> i) & 1);
    1308:	e1a0c33e 	lsr	ip, lr, r3
    130c:	e20cc001 	and	ip, ip, #1
    1310:	e18c2082 	orr	r2, ip, r2, lsl #1
        if(r >= d) {
    1314:	e1520001 	cmp	r2, r1
            r = r - d;
    1318:	20612002 	rsbcs	r2, r1, r2
            q = q | (1 << i);
    131c:	21800314 	orrcs	r0, r0, r4, lsl r3
u32 div(u32 n, u32 d)  // long division
{
    u32 q=0, r=0;
    int i;

    for(i=31;i>=0;i--){
    1320:	e2533001 	subs	r3, r3, #1
    1324:	2afffff7 	bcs	1308 <div+0x1c>
            r = r - d;
            q = q | (1 << i);
        }
    }
    return q;
}
    1328:	e8bd8810 	pop	{r4, fp, pc}

0000132c <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    132c:	e92d000e 	push	{r1, r2, r3}
    1330:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
    1334:	e28db01c 	add	fp, sp, #28
    1338:	e24dd00c 	sub	sp, sp, #12
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    133c:	e59b6004 	ldr	r6, [fp, #4]
    1340:	e5d64000 	ldrb	r4, [r6]
    1344:	e3540000 	cmp	r4, #0
    1348:	0a00002d 	beq	1404 <printf+0xd8>
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
    134c:	e301873c 	movw	r8, #5948	; 0x173c
    1350:	e1a07000 	mov	r7, r0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1354:	e28b9008 	add	r9, fp, #8
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
    1358:	e3408000 	movt	r8, #0
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    135c:	e3a05000 	mov	r5, #0
    1360:	ea00000a 	b	1390 <printf+0x64>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1364:	e3540025 	cmp	r4, #37	; 0x25
        state = '%';
    1368:	01a05004 	moveq	r5, r4
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    136c:	0a000004 	beq	1384 <printf+0x58>
    1370:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1374:	e3a02001 	mov	r2, #1
    1378:	e1a00007 	mov	r0, r7
    137c:	e5614006 	strb	r4, [r1, #-6]!
    1380:	ebfffed2 	bl	ed0 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1384:	e5f64001 	ldrb	r4, [r6, #1]!
    1388:	e3540000 	cmp	r4, #0
    138c:	0a00001c 	beq	1404 <printf+0xd8>
    c = fmt[i] & 0xff;
    if(state == 0){
    1390:	e3550000 	cmp	r5, #0
    1394:	0afffff2 	beq	1364 <printf+0x38>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1398:	e3550025 	cmp	r5, #37	; 0x25
    139c:	1afffff8 	bne	1384 <printf+0x58>
      if(c == 'd'){
    13a0:	e3540064 	cmp	r4, #100	; 0x64
    13a4:	0a000037 	beq	1488 <printf+0x15c>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    13a8:	e20430f7 	and	r3, r4, #247	; 0xf7
    13ac:	e3530070 	cmp	r3, #112	; 0x70
    13b0:	0a000017 	beq	1414 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    13b4:	e3540073 	cmp	r4, #115	; 0x73
    13b8:	0a00001c 	beq	1430 <printf+0x104>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    13bc:	e3540063 	cmp	r4, #99	; 0x63
    13c0:	0a000037 	beq	14a4 <printf+0x178>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    13c4:	e3540025 	cmp	r4, #37	; 0x25
    13c8:	0a000027 	beq	146c <printf+0x140>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13cc:	e3a02001 	mov	r2, #1
    13d0:	e24b1021 	sub	r1, fp, #33	; 0x21
    13d4:	e1a00007 	mov	r0, r7
    13d8:	e54b5021 	strb	r5, [fp, #-33]	; 0xffffffdf
    13dc:	ebfffebb 	bl	ed0 <write>
    13e0:	e24b1020 	sub	r1, fp, #32
    13e4:	e3a02001 	mov	r2, #1
    13e8:	e1a00007 	mov	r0, r7
    13ec:	e5614002 	strb	r4, [r1, #-2]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    13f0:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    13f4:	ebfffeb5 	bl	ed0 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    13f8:	e5f64001 	ldrb	r4, [r6, #1]!
    13fc:	e3540000 	cmp	r4, #0
    1400:	1affffe2 	bne	1390 <printf+0x64>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1404:	e24bd01c 	sub	sp, fp, #28
    1408:	e8bd4bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
    140c:	e28dd00c 	add	sp, sp, #12
    1410:	e12fff1e 	bx	lr
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1414:	e3a03000 	mov	r3, #0
    1418:	e3a02010 	mov	r2, #16
    141c:	e4991004 	ldr	r1, [r9], #4
    1420:	e1a00007 	mov	r0, r7
    1424:	ebffff79 	bl	1210 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1428:	e3a05000 	mov	r5, #0
    142c:	eaffffd4 	b	1384 <printf+0x58>
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    1430:	e4994004 	ldr	r4, [r9], #4
        ap++;
        if(s == 0)
          s = "(null)";
    1434:	e3540000 	cmp	r4, #0
    1438:	01a04008 	moveq	r4, r8
        while(*s != 0){
    143c:	e5d45000 	ldrb	r5, [r4]
    1440:	e3550000 	cmp	r5, #0
    1444:	0affffce 	beq	1384 <printf+0x58>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1448:	e3a02001 	mov	r2, #1
    144c:	e24b1025 	sub	r1, fp, #37	; 0x25
    1450:	e1a00007 	mov	r0, r7
    1454:	e54b5025 	strb	r5, [fp, #-37]	; 0xffffffdb
    1458:	ebfffe9c 	bl	ed0 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    145c:	e5f45001 	ldrb	r5, [r4, #1]!
    1460:	e3550000 	cmp	r5, #0
    1464:	1afffff7 	bne	1448 <printf+0x11c>
    1468:	eaffffc5 	b	1384 <printf+0x58>
    146c:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1470:	e3a02001 	mov	r2, #1
    1474:	e1a00007 	mov	r0, r7
    1478:	e5615003 	strb	r5, [r1, #-3]!
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    147c:	e3a05000 	mov	r5, #0
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1480:	ebfffe92 	bl	ed0 <write>
    1484:	eaffffbe 	b	1384 <printf+0x58>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1488:	e3a03001 	mov	r3, #1
    148c:	e3a0200a 	mov	r2, #10
    1490:	e4991004 	ldr	r1, [r9], #4
    1494:	e1a00007 	mov	r0, r7
    1498:	ebffff5c 	bl	1210 <printint>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    149c:	e3a05000 	mov	r5, #0
    14a0:	eaffffb7 	b	1384 <printf+0x58>
    14a4:	e4993004 	ldr	r3, [r9], #4
    14a8:	e24b1020 	sub	r1, fp, #32
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14ac:	e3a02001 	mov	r2, #1
    14b0:	e1a00007 	mov	r0, r7
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    14b4:	e3a05000 	mov	r5, #0
    14b8:	e5613004 	strb	r3, [r1, #-4]!
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    14bc:	ebfffe83 	bl	ed0 <write>
    14c0:	eaffffaf 	b	1384 <printf+0x58>

000014c4 <free>:
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14c4:	e301c7b8 	movw	ip, #6072	; 0x17b8
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    14c8:	e2401008 	sub	r1, r0, #8
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14cc:	e340c000 	movt	ip, #0
static Header base;
static Header *freep;

void
free(void *ap)
{
    14d0:	e92d4810 	push	{r4, fp, lr}
    14d4:	e28db008 	add	fp, sp, #8
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14d8:	e59c3000 	ldr	r3, [ip]
    14dc:	ea000004 	b	14f4 <free+0x30>
    14e0:	e1510002 	cmp	r1, r2
    14e4:	3a000009 	bcc	1510 <free+0x4c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14e8:	e1530002 	cmp	r3, r2
    14ec:	2a000007 	bcs	1510 <free+0x4c>
static Header base;
static Header *freep;

void
free(void *ap)
{
    14f0:	e1a03002 	mov	r3, r2
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14f4:	e1530001 	cmp	r3, r1
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    14f8:	e5932000 	ldr	r2, [r3]
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    14fc:	3afffff7 	bcc	14e0 <free+0x1c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1500:	e1530002 	cmp	r3, r2
    1504:	3afffff9 	bcc	14f0 <free+0x2c>
    1508:	e1510002 	cmp	r1, r2
    150c:	2afffff7 	bcs	14f0 <free+0x2c>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1510:	e510e004 	ldr	lr, [r0, #-4]
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    1514:	e58c3000 	str	r3, [ip]

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1518:	e081418e 	add	r4, r1, lr, lsl #3
    151c:	e1540002 	cmp	r4, r2
    bp->s.size += p->s.ptr->s.size;
    1520:	05922004 	ldreq	r2, [r2, #4]
    1524:	0082e00e 	addeq	lr, r2, lr
    1528:	0500e004 	streq	lr, [r0, #-4]
    bp->s.ptr = p->s.ptr->s.ptr;
    152c:	05932000 	ldreq	r2, [r3]
    1530:	05922000 	ldreq	r2, [r2]
  } else
    bp->s.ptr = p->s.ptr;
    1534:	e5002008 	str	r2, [r0, #-8]
  if(p + p->s.size == bp){
    1538:	e5932004 	ldr	r2, [r3, #4]
    153c:	e083e182 	add	lr, r3, r2, lsl #3
    1540:	e151000e 	cmp	r1, lr
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1544:	15831000 	strne	r1, [r3]
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    1548:	05101004 	ldreq	r1, [r0, #-4]
    154c:	00812002 	addeq	r2, r1, r2
    1550:	05832004 	streq	r2, [r3, #4]
    p->s.ptr = bp->s.ptr;
    1554:	05102008 	ldreq	r2, [r0, #-8]
    1558:	05832000 	streq	r2, [r3]
  } else
    p->s.ptr = bp;
  freep = p;
}
    155c:	e8bd8810 	pop	{r4, fp, pc}

00001560 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1560:	e92d4bf0 	push	{r4, r5, r6, r7, r8, r9, fp, lr}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    1564:	e30187b8 	movw	r8, #6072	; 0x17b8
    1568:	e3408000 	movt	r8, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    156c:	e2800007 	add	r0, r0, #7
  if((prevp = freep) == 0){
    1570:	e5983000 	ldr	r3, [r8]
  return freep;
}

void*
malloc(uint nbytes)
{
    1574:	e28db01c 	add	fp, sp, #28
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1578:	e1a041a0 	lsr	r4, r0, #3
  if((prevp = freep) == 0){
    157c:	e3530000 	cmp	r3, #0
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1580:	e2844001 	add	r4, r4, #1
  if((prevp = freep) == 0){
    1584:	0a00002a 	beq	1634 <malloc+0xd4>
    1588:	e5930000 	ldr	r0, [r3]
    158c:	e5902004 	ldr	r2, [r0, #4]
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1590:	e1540002 	cmp	r4, r2
    1594:	9a00001c 	bls	160c <malloc+0xac>
    1598:	e3540a01 	cmp	r4, #4096	; 0x1000
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    159c:	e30157b8 	movw	r5, #6072	; 0x17b8
    15a0:	e3405000 	movt	r5, #0
    15a4:	33a06902 	movcc	r6, #32768	; 0x8000
    15a8:	21a06184 	lslcs	r6, r4, #3
    15ac:	21a07004 	movcs	r7, r4
    15b0:	33a07a01 	movcc	r7, #4096	; 0x1000
    15b4:	ea000003 	b	15c8 <malloc+0x68>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    15b8:	e5930000 	ldr	r0, [r3]
    if(p->s.size >= nunits){
    15bc:	e5902004 	ldr	r2, [r0, #4]
    15c0:	e1540002 	cmp	r4, r2
    15c4:	9a000010 	bls	160c <malloc+0xac>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    15c8:	e5982000 	ldr	r2, [r8]
    15cc:	e1a03000 	mov	r3, r0
    15d0:	e1520000 	cmp	r2, r0
    15d4:	1afffff7 	bne	15b8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    15d8:	e1a00006 	mov	r0, r6
    15dc:	ebfffee4 	bl	1174 <sbrk>
    15e0:	e1a03000 	mov	r3, r0
  if(p == (char*)-1)
    15e4:	e3730001 	cmn	r3, #1
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
  free((void*)(hp + 1));
    15e8:	e2800008 	add	r0, r0, #8
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
  if(p == (char*)-1)
    15ec:	0a000004 	beq	1604 <malloc+0xa4>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    15f0:	e5837004 	str	r7, [r3, #4]
  free((void*)(hp + 1));
    15f4:	ebffffb2 	bl	14c4 <free>
  return freep;
    15f8:	e5953000 	ldr	r3, [r5]
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    15fc:	e3530000 	cmp	r3, #0
    1600:	1affffec 	bne	15b8 <malloc+0x58>
        return 0;
    1604:	e3a00000 	mov	r0, #0
  }
}
    1608:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    160c:	e1540002 	cmp	r4, r2
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
    1610:	e5883000 	str	r3, [r8]
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1614:	10642002 	rsbne	r2, r4, r2
    1618:	15802004 	strne	r2, [r0, #4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    161c:	05902000 	ldreq	r2, [r0]
      else {
        p->s.size -= nunits;
        p += p->s.size;
    1620:	10800182 	addne	r0, r0, r2, lsl #3
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    1624:	e2800008 	add	r0, r0, #8
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
    1628:	15004004 	strne	r4, [r0, #-4]
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    162c:	05832000 	streq	r2, [r3]
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    1630:	e8bd8bf0 	pop	{r4, r5, r6, r7, r8, r9, fp, pc}
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1634:	e2880004 	add	r0, r8, #4
    base.s.size = 0;
    1638:	e5883008 	str	r3, [r8, #8]
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    163c:	e5880000 	str	r0, [r8]
    1640:	e5880004 	str	r0, [r8, #4]
    1644:	eaffffd3 	b	1598 <malloc+0x38>
