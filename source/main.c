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
