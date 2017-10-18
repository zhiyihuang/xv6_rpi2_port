/*****************************************************************
*       main.c
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/


#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "arm.h"
#include "mailbox.h"

extern char end[]; // first address after kernel loaded from ELF file
extern pde_t *kpgdir;
extern FBI fbinfo;
extern volatile uint *mailbuffer;

void OkLoop()
{
   setgpiofunc(18, 1); // gpio 18 for Ok Led, set as an output
   while(1){
        setgpioval(18, 0);
        delay(2000000);
        setgpioval(18, 1);
        delay(2000000);
   }
}

void NotOkLoop()
{
   setgpiofunc(18, 1); // gpio 18 for Ok Led, set as an output
   while(1){
        setgpioval(18, 0);
        delay(500000);
        setgpioval(18, 1);
        delay(500000);
   }
}

void machinit(void)
{
    memset(cpus, 0, sizeof(struct cpu)*NCPU);
}


void enableirqminiuart(void);

uint mb_data[2];

int cmain()
{
  u32 x;
  mmuinit0();
  //XX OK
  mmuinit1();
  machinit();

  #if defined (RPI1) || defined (RPI2)
  uartinit();
  #elif defined (FVP)
  uartinit_fvp();
  #endif
  //XXX OK
  dsb_barrier();

  consoleinit();

  cprintf("\nHello World from xv6\n");
  cprintf("Frame buffer addr size pitch depth: %x %x %x %x\n", fbinfo.fbp, fbinfo.fbs, fbinfo.pitch, fbinfo.depth);
  acknowledge();
  kinit1(end, P2V((8*1024*1024)+PHYSTART));  // reserve 8 pages for PGDIR
  kpgdir=p2v(K_PDX_BASE);

  mailboxinit();

  create_request(mailbuffer, MPI_TAG_GET_ARM_MEMORY, 8, 0, 0);
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("Error readmailbox: %x\n", MPI_TAG_GET_ARM_MEMORY);
  cprintf("ARM memory is %x %x\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH], mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1]);

  mb_data[0] = 64; mb_data[1] = 0;
  create_request(mailbuffer, 0x40001, 8, 4, mb_data);
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40001);
  cprintf("framebuffer addr and size are %x %x\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH], mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1]);

  cprintf("mb_data addr: %x\n", mb_data);

  fbinfo.fbp = 0x40000000 + 0x3fffffff & mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH]; // convert bus address to ARM physical address
  cprintf("fbinfo.fbp addr: %x\n", fbinfo.fbp);

  outw(fbinfo.fbp, 0xabcdef);
  x = inw(fbinfo.fbp);
  cprintf("value of x is %x\n", x);

  outw(0x4f000000, 0xabcdef);
  x = inw(0x4f000000);
  cprintf("value of x is %x\n", x);


  mb_data[0] = 1024; mb_data[1] = 768;
  create_request(mailbuffer, 0x44004, 8, 8, mb_data);
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x48004);
  cprintf("virtual width/height are set %x %x\n", 1024, 768);


  create_request(mailbuffer, 0x40004, 8, 0, 0);
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40004);
  cprintf("virtual width/height are %x %x\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH], mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1]);

  create_request(mailbuffer, 0x40003, 8, 0, 0);
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40003);
  cprintf("physical width/height are %x %x\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH], mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1]);


  mb_data[0] = 32; mb_data[1] = 0;
  create_request(mailbuffer, 0x48005, 4, 4, mb_data);
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x48005);
  cprintf("depth is set to %x\n", 32);


  create_request(mailbuffer, 0x40005, 4, 0, 0);
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40005);
  cprintf("depth is %x\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH]);

  create_request(mailbuffer, 0x40008, 4, 0, 0);
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40008);
  cprintf("pitch is %x\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH]);

  create_request(mailbuffer, 0x40009, 8, 0, 0);
  writemailbox((uint *)mailbuffer, 8);
  readmailbox(8);
  if(mailbuffer[1] != 0x80000000) cprintf("error readmailbox: %x\n", 0x40009);
  cprintf("virtual offset X Y are %x %x\n", mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH], mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1]);


  pinit();
  tvinit();
  cprintf("it is ok after tvinit\n");
  binit();
cprintf("it is ok after binit\n");
  fileinit();
cprintf("it is ok after fileinit\n");
  iinit();
cprintf("it is ok after iinit\n");
  ideinit();
cprintf("it is ok after ideinit\n");
  kinit2(P2V((8*1024*1024)+PHYSTART), P2V(PHYSTOP));
cprintf("it is ok after kinit2\n");
  userinit();
cprintf("it is ok after userinit\n");
  timer3init();
cprintf("it is ok after timer3init\n");
  scheduler();
  NotOkLoop();
  return 0;
}
