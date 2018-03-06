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
extern volatile uint *mailbuffer;
extern unsigned int pm_size;

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

unsigned int getpmsize()
{
    create_request(mailbuffer, MPI_TAG_GET_ARM_MEMORY, 8, 0, 0);
    writemailbox((uint *)mailbuffer, 8);
    readmailbox(8);
    if(mailbuffer[1] != 0x80000000) cprintf("Error readmailbox: %x\n", MPI_TAG_GET_ARM_MEMORY);
    return mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1];
}

void machinit(void)
{
    memset(cpus, 0, sizeof(struct cpu)*NCPU);
}


void enableirqminiuart(void);

uint mb_data[10];

int cmain()
{
  mmuinit0();
  machinit();

  #if defined (RPI1) || defined (RPI2)
  uartinit();
  #elif defined (FVP)
  uartinit_fvp();
  #endif

  dsb_barrier();

  consoleinit();
  cprintf("\nHello World from xv6\n");

  kinit1(end, P2V((8*1024*1024)+PHYSTART)); 
  // collect some free space (8 MB) for imminent use
  // the physical space below 0x8000 is reserved for PGDIR and kernel stack
  kpgdir=p2v(K_PDX_BASE);

  mailboxinit();

  pm_size = getpmsize();
  cprintf("ARM memory is %x\n", pm_size);
  
  mmuinit1();
  gpuinit();

/**************************************************
**** The following mailbox code for setting up GPU framebuffer also works   ***
**** This may be a better way to set up the framebuffer but leave for future **
**** extension ***************

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
  kinit2(P2V((8*1024*1024)+PHYSTART), P2V(pm_size));
cprintf("it is ok after kinit2\n");
  userinit();
cprintf("it is ok after userinit\n");
  timer3init();
cprintf("it is ok after timer3init\n");
  scheduler();
  NotOkLoop();
  return 0;
}
