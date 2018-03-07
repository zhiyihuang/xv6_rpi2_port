/*****************************************************************
 *       console.c
 *       adapted from MIT xv6 by Zhiyi Huang, hzy@cs.otago.ac.nz
 *       University of Otago
 *
 ********************************************************************/

#include "types.h"
#include "defs.h"
#include "param.h"
#include "traps.h"
#include "spinlock.h"
#include "fs.h"
#include "file.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "arm.h"

#define BACKSPACE 0x100

static int panicked = 0;

static struct {
	struct spinlock lock;
	int locking;
} cons;


uint cursor_x=0, cursor_y=0;
uint frameheight=1024, framewidth=1280, framedepth=16;
uint fontheight=16, fontwidth=8;
FBI fbinfo __attribute__ ((aligned (16), nocommon));

extern volatile uint *mailbuffer;
extern u8 font[];
static uint gpucolour=0xffff;

void setgpucolour(u16 c)
{
	gpucolour = c;
}



uint initframebuf(uint width, uint height, uint depth)
{
  

	fbinfo.width = width;
	fbinfo.height = height;
	fbinfo.v_width = width;
	fbinfo.v_height = height;
	fbinfo.pitch = 0;
	fbinfo.depth = depth;
	fbinfo.x = 0;
	fbinfo.y = 0;
	fbinfo.fbp = 0;
	fbinfo.fbs = 0;
	writemailbox((uint *)&fbinfo, 1);
	return readmailbox(1);
}

#define INPUT_BUF 128
struct {
	struct spinlock lock;
	char buf[INPUT_BUF];
	uint r;  // Read index
	uint w;  // Write index
	uint e;  // Edit index
} input;

int
consolewrite(struct inode *ip, char *buf, int n)
{
	int i;

	//  cprintf("consolewrite is called: ip=%x buf=%x, n=%x", ip, buf, n);
	iunlock(ip);
	acquire(&cons.lock);
	for(i = 0; i < n; i++){
#if defined (RPI1)
		gpuputc(buf[i] & 0xff);
		uartputc(buf[i] & 0xff);
#elif defined (RPI2)
		gpuputc(buf[i] & 0xff);
		uartputc(buf[i] & 0xff);
#elif defined (FVP)
		uartputc_fvp(buf[i] & 0xff);
#endif

	}
	release(&cons.lock);
	ilock(ip);

	return n;
}


void drawpixel(uint x, uint y)
{
	u16 *addr;

	if(x >= framewidth || y >= frameheight) return;
	addr = (u16 *) fbinfo.fbp;
	addr += y*framewidth + x;
	*addr = gpucolour;
	return;
}


void drawcursor(uint x, uint y)
{
	u8 row, bit;

	for(row=0; row<15; row++)
		for(bit=0; bit<8; bit++)
			drawpixel(x+bit, y+row);
}

void drawcharacter(u8 c, uint x, uint y)
{
	u8 *faddr;
	u8 row, bit, bits;
	uint tv;

	if(c > 127) return;
	tv = ((uint)c) << 4;
	faddr = font + tv;
	for(row=0; row<15; row++){
		bits = *(faddr+row);
		for(bit=0; bit<8; bit++){
			if((bits>>bit) & 1) drawpixel(x+bit, y+row);
		}
	}

}

//static void
void
gpuputc(uint c)
{
	#if defined (RPI1) || defined (RPI2)

	if(fbinfo.fbp == 0) return;

	if(c=='\n'){
		cursor_x = 0;
		cursor_y += fontheight;
		if(cursor_y >= frameheight) {
			memmove((u8 *)fbinfo.fbp, (u8 *)fbinfo.fbp+framewidth*fontheight*2, (frameheight - fontheight)*framewidth*2);
			cursor_y = frameheight - fontheight;
			setgpucolour(0);
			while(cursor_x < framewidth) {
				drawcursor(cursor_x, cursor_y);
				cursor_x = cursor_x + fontwidth;
			}
			setgpucolour(0xffff);
			cursor_x = 0;
		}
	} else if(c == BACKSPACE) {
		if (cursor_x > 0) {
			cursor_x -= fontwidth;
			setgpucolour(0);
			drawcursor(cursor_x, cursor_y);
			setgpucolour(0xffff);
		}
	} else {
		setgpucolour(0);
		drawcursor(cursor_x, cursor_y);
		setgpucolour(0xffff);
		if(c!=' ') drawcharacter(c, cursor_x, cursor_y);
		cursor_x = cursor_x + fontwidth;
		if(cursor_x >= framewidth) {
			cursor_x = 0;
			cursor_y += fontheight;
			if(cursor_y >= frameheight) {
				memmove((u8 *)fbinfo.fbp, (u8 *)fbinfo.fbp+framewidth*fontheight*2, (frameheight - fontheight)*framewidth*2);
				cursor_y = frameheight - fontheight;
				setgpucolour(0);
				while(cursor_x < framewidth) {
					drawcursor(cursor_x, cursor_y);
					cursor_x = cursor_x + fontwidth;
				}
				setgpucolour(0xffff);
				cursor_x = 0;
			}
		}
	}
	#endif

}


static void
printint(int xx, int base, int sign)
{
	static u8 digits[] = "0123456789abcdef";
	u8 buf[16];
	int i;
	uint x, y, b;

	if(sign && (sign = xx < 0))
		x = -xx;
	else
		x = xx;

	b = base;
	i = 0;
	do{
		y = div(x, b);
		buf[i++] = digits[x - y * b];
	}while((x = y) != 0);

	if(sign)
		buf[i++] = '-';

	while(--i >= 0){
		#if defined (RPI1)
		gpuputc(buf[i]);
		uartputc(buf[i]);
		#elif defined (RPI2)
		gpuputc(buf[i]);
		uartputc(buf[i]);
		#elif defined (FVP)
		uartputc_fvp(buf[i]);
		#endif
	}
}


// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
	int i, c;
	int locking;
	uint *argp;
	char *s;

	locking = cons.locking;
	if(locking)
		acquire(&cons.lock);

	if (fmt == 0)
		panic("null fmt");

	argp = (uint *)(void*)(&fmt + 1);
	for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
		if(c != '%'){
			#if defined (RPI1)
			gpuputc(c);
			uartputc(c);
			#elif defined (RPI2)
			gpuputc(c);
			uartputc(c);
			#elif defined (FVP)
			uartputc_fvp(c);
			#endif
			continue;
		}
		c = fmt[++i] & 0xff;
		if(c == 0)
			break;
		switch(c){
		case 'd':
			printint(*argp++, 10, 1);
			break;
		case 'x':
		case 'p':
			printint(*argp++, 16, 0);
			break;
		case 's':
			if((s = (char*)*argp++) == 0)
				s = "(null)";
			for(; *s; s++){
				#if defined (RPI1)
				gpuputc(*s);
				uartputc(*s);
				#elif defined (RPI2)
				gpuputc(*s);
				uartputc(*s);
				#elif defined (FVP)
				uartputc_fvp(*s);
				#endif
			}
			break;
		case '%':
			#if defined (RPI1)
			gpuputc('%');
			uartputc('%');
			#elif defined (RPI2)
			gpuputc('%');
			uartputc('%');
			#elif defined (FVP)
			uartputc_fvp('%');
			#endif
			break;
		default:
			// Print unknown % sequence to draw attention.
			#if defined (RPI1)
			gpuputc('%');
			uartputc('%');
			gpuputc(c);
			uartputc(c);
			#elif defined (RPI2)
			gpuputc('%');
			uartputc('%');
			gpuputc(c);
			uartputc(c);
			#elif defined (FVP)
			uartputc_fvp('%');
			uartputc_fvp(c);
			#endif
			break;
		}
	}
	if(locking)
		release(&cons.lock);
}

void
panic(char *s)
{
	int i;
	uint pcs[10];

	cprintf("cpu%d: panic: ", 0);
	cprintf(s);
	cprintf("\n");
	getcallerpcs(&s, pcs);
	for(i=0; i<10; i++)
		cprintf(" %p", pcs[i]);
	panicked = 1; // freeze other CPU

	for(;;)
		;
}

#define C(x)  ((x)-'@')  // Control-x

void
consputc(int c)
{
	if(panicked){
		cli();
		for(;;)
			;
	}

	if(c == BACKSPACE){
		//#if defined (RPI1)
		gpuputc('\b'); gpuputc(' '); gpuputc('\b');
		//#endif
		uartputc('\b'); uartputc(' '); uartputc('\b');
	} else if(c == C('D')) {
		//#if defined (RPI1)
		gpuputc('^'); gpuputc('D');
		//#endif
		uartputc('^'); uartputc('D');
	} else {
		//#if defined (RPI1)
		gpuputc(c);
		//#endif
		uartputc(c);
	}
}


void
consoleintr(int (*getc)(void))
{
	int c;

	acquire(&input.lock);
	while((c = getc()) >= 0){
		switch(c){
		case C('P'):  // Process listing.
    		  procdump();
		break;
		case C('U'):  // Kill line.
    		  while(input.e != input.w &&
    				  input.buf[(input.e-1) % INPUT_BUF] != '\n'){
    			  input.e--;
    			  consputc(BACKSPACE);
    		  }
		break;
		case C('H'): case '\x7f':  // Backspace
			if(input.e != input.w){
				input.e--;
				consputc(BACKSPACE);
			}
			break;
		default:
			if(c != 0 && input.e-input.r < INPUT_BUF){
				if(c == 0xa) break;
				c = (c == 0xd) ? '\n' : c;
				input.buf[input.e++ % INPUT_BUF] = c;
				consputc(c);
				if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
					input.w = input.e;
					wakeup(&input.r);
				}
			}
			break;
		}
	}
	release(&input.lock);
}

int
consoleread(struct inode *ip, char *dst, int n)
{
	uint target;
	int c;

	//cprintf("inside consoleread\n");
	iunlock(ip);
	target = n;
	acquire(&input.lock);
	while(n > 0){
		while(input.r == input.w){
			if(curr_proc->killed){
				release(&input.lock);
				ilock(ip);
				return -1;
			}
			sleep(&input.r, &input.lock);
		}
		c = input.buf[input.r++ % INPUT_BUF];
		if(c == C('D')){  // EOF
			if(n < target){
				// Save ^D for next time, to make sure
				// caller gets a 0-byte result.
				input.r--;
			}
			break;
		}
		*dst++ = c;
		--n;
		if(c == '\n')
			break;
	}
	release(&input.lock);
	ilock(ip);

	return target - n;
}

void gpuinit()
{
	#if defined (RPI1) || defined (RPI2)
	uint fbinforesp;
	fbinforesp = initframebuf(framewidth, frameheight, framedepth);
	if(fbinforesp != 0){
		fbinfo.fbp = 0;
		cprintf("Failed to initialize GPU framebuffer!\n");
		return;
	}

	// convert the address into ARM space and then to the ARM VM space for the whole physical address space
	fbinfo.fbp = (fbinfo.fbp & 0x3fffffff) + 0x40000000;
	//cprintf("The frame buffer pointer is %x\n", fbinfo.fbp);
        #endif


/**************************************************
**** The following mailbox code for setting up GPU framebuffer also works   ***
**** This may be a better way to set up the framebuffer but left for future extension **

  create_request(mailbuffer, 0x40003, 8, 0, 0); //get physical buffer width/height
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40003);
  cprintf("physical width/height are %d %d\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH], mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1]);

  create_request(mailbuffer, 0x40005, 8, 0, 0); //get display depth
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40005);
  cprintf("The depth of the display is %d\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH]);

  mb_data[0] = 1280; mb_data[1] = 1024;
  create_request(mailbuffer, 0x48004, 8, 2, mb_data); //set virtual buffer width/height
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x48004);
  cprintf("The virtual width/height are %d %d\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH], mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1]);

  mb_data[0] = 0; mb_data[1] = 0;
  create_request(mailbuffer, 0x48009, 8, 2, mb_data); //set virtual offset
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x48009);
  cprintf("The virtual offsets are %d %d\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH], mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1]);

  mb_data[0] = 0;
  create_request(mailbuffer, 0x40001, 8, 1, mb_data); //allocate buffer
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40001);
  cprintf("The buffer base address and size are %x %x\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH], mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1]);
  fb = (u32 *)(0x40000000 + mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH]);

  create_request(mailbuffer, 0x40008, 8, 0, 0); //get pitch
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40008);
  cprintf("The depth of the display is %d\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH]);

for (i=0; i< 2000; i++) fb[i] =0xffffffff;

*****************/

}


void consoleinit(void)
{

	fbinfo.fbp = 0;
	initlock(&cons.lock, "console");
	memset(&input, 0, sizeof(input));
	initlock(&input.lock, "input");

	memset(devsw, 0, sizeof(struct devsw)*NDEV);
	devsw[CONSOLE].write = consolewrite;
	devsw[CONSOLE].read = consoleread;
	cons.locking = 1;
	panicked = 0; // must initialize in code since the compiler does not

	cursor_x=cursor_y=0;

}

