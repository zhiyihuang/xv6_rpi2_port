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

unsigned int boardmodel, boardrevision, max_core_clock_freq;

#if defined (RPI1) || defined (RPI2)
unsigned int core_clock_freq = 250000000;
#else
unsigned int core_clock_freq = 400000000;
#endif

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

unsigned int getboardmodel()
{
    create_request(mailbuffer, MPI_TAG_GET_BOARD_MODEL, 4, 0, 0);
    writemailbox((uint *)mailbuffer, 8);
    readmailbox(8);
    if(mailbuffer[1] != 0x80000000) cprintf("Error readmailbox: %x\n", MPI_TAG_GET_ARM_MEMORY);
    return mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH];
}

unsigned int getboardrevision()
{
    create_request(mailbuffer, MPI_TAG_GET_BOARD_REVISION, 4, 0, 0);
    writemailbox((uint *)mailbuffer, 8);
    readmailbox(8);
    if(mailbuffer[1] != 0x80000000) cprintf("Error readmailbox: %x\n", MPI_TAG_GET_ARM_MEMORY);
    return mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH];
}

unsigned int getmaxclockrate(unsigned int id)
{
    unsigned int md[2];
    md[0] = id; md[1] = 0;
    create_request(mailbuffer, MPI_TAG_GET_MAX_CLOCK_RATE, 8, 4, md);
    writemailbox((uint *)mailbuffer, 8);
    readmailbox(8);
    if(mailbuffer[1] != 0x80000000) cprintf("Error readmailbox: %x\n", MPI_TAG_GET_MAX_CLOCK_RATE);
    return mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1];
}

unsigned int getminclockrate(unsigned int id)
{
    unsigned int md[2];
    md[0] = id; md[1] = 0;
    create_request(mailbuffer, MPI_TAG_GET_MIN_CLOCK_RATE, 8, 4, md);
    writemailbox((uint *)mailbuffer, 8);
    readmailbox(8);
    if(mailbuffer[1] != 0x80000000) cprintf("Error readmailbox: %x\n", MPI_TAG_GET_MIN_CLOCK_RATE);
    return mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1];
}

unsigned int getclockratemeasured(unsigned int id)
{
    unsigned int md[2];
    md[0] = id; md[1] = 0;
    create_request(mailbuffer, MPI_TAG_GET_CLOCK_RATE_MEASURED, 8, 4, md);
    writemailbox((uint *)mailbuffer, 8);
    readmailbox(8);
    if(mailbuffer[1] != 0x80000000) cprintf("Error readmailbox: %x\n", MPI_TAG_GET_MIN_CLOCK_RATE);
    return mailbuffer[MB_HEADER_LENGTH + TAG_HEADER_LENGTH+1];
}

unsigned int setclockrate(unsigned int id, unsigned int rate)
{
    unsigned int md[3];
    md[0] = id; md[1] = rate; md[2] = 1;
    create_request(mailbuffer, MPI_TAG_SET_CLOCK_RATE, 12, 12, md);
    writemailbox((uint *)mailbuffer, 8);
    readmailbox(8);
    if(mailbuffer[1] != 0x80000000) cprintf("Error readmailbox: %x\n", MPI_TAG_GET_MIN_CLOCK_RATE);
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

  #if defined (RPI1) || defined (RPI2) || defined (RPI3)
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

  mmuinit1();
  gpuinit();

  cprintf("ARM memory is %x\n", pm_size);
  max_core_clock_freq = getmaxclockrate(CORE_CLOCK_ID);
  cprintf("Max core clock rate is %d\n", max_core_clock_freq);
  cprintf("Min core clock rate is %d\n", getminclockrate(CORE_CLOCK_ID));
  // set the core clock rate to max core clock frequency (for RPI 3 it is 400000000, and 250000000 for RPI 2)
  // In this way the core clock frequency can be fixed and the UART baud rate, that relies on the core clock frequency, 
  // could be correctly calculated. 
  cprintf("The core clock rate is set to %d\n", setclockrate(CORE_CLOCK_ID, max_core_clock_freq));

  boardmodel = getboardmodel();
  boardrevision = getboardrevision();

  core_clock_freq = getclockratemeasured(CORE_CLOCK_ID);
  cprintf("The core clock rate measured is %d\n", core_clock_freq);

  cprintf("The board model is %x\n", boardmodel);
  cprintf("The board revision is %x\n", boardrevision);

  #if defined (RPI1) || defined (RPI2) || defined (RPI3)
  uartinit(); // re-init miniUART according to the core clock frequency
  #endif

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
