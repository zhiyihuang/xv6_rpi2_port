/*****************************************************************
*       memlayout.h
*       by Zhiyi Huang, hzy@cs.otago.ac.nz
*       University of Otago
*
********************************************************************/



// Memory layout

#define PHYSTOP         (PHYSTART+PHYSIZE)

#define USERBOUND 	0x40000000        // maximum user space due to one page pgd
#define GPUMEMBASE	0x40000000
#define GPUMEMSIZE	(1024*MBYTE)

#define TVSIZE          0x1000

static inline uint v2p(void *a) { return ((uint) (a))  - (KERNBASE-PHYSTART); }
static inline void *p2v(uint a) { return (void *) ((a) + (KERNBASE-PHYSTART)); }

#define V2P(a) (((uint) (a)) - (KERNBASE-PHYSTART))
#define P2V(a) (((void *) (a)) + (KERNBASE-PHYSTART))

#define V2P_WO(x) ((x) - (KERNBASE-PHYSTART))    // same as V2P, but without casts
#define P2V_WO(x) ((x) + (KERNBASE-PHYSTART))    // same as V2P, but without casts

