/*
 * fvp.h
 *
 *  Created on: Dec 2, 2016
 *      Author: Mahdi Amiri
 */

#ifndef FVP_H
#define FVP_H
#define FVP_PL011_BASE	(MMIO_VA + 0x90000)
#define FVP_PL011_UARTDR	FVP_PL011_BASE			// Data register
#define FVP_PL011_UARTFR 	(FVP_PL011_BASE+0x18)	// Flag register
#define FVP_PL011_UARTFR_TXFF	(1 << 5)		// Transmit FIFO full @ UARTFR
#define FVP_PL011_UARTFR_RXFE	(1 << 4)		// Receive FIFO empty @ UARTFR
#define FVP_PL011_UARTCR	(FVP_PL011_BASE+0x30)	// Control register
#define FVP_PL011_UARTCR_UARTEN	1				// UART enable @ UARTCR
#define FVP_PL011_UARTCR_TXE	(1<<8)			// Transmit enable @ UARTCR
#define FVP_PL011_UARTCR_RXE	(1<<9)			// Receive enable @ UARTCR
#define FVP_PL011_UARTIMSC (FVP_PL011_BASE+0x38)	// Interrupt mask set/clear register
#define FVP_PL011_UARTIMSC_RXIM (1<<4)			// Receive interrupt mask.

//#define FVP_GLOBAL_TIMER_BASE	((uint) &__va_private_start + 0x0200 )
#define FVP_GLOBAL_TIMER_BASE	(MMIO_VA + 0x110000)
#define FVP_TIMER1_LOAD			FVP_GLOBAL_TIMER_BASE
#define FVP_TIMER1_VALUE		( FVP_GLOBAL_TIMER_BASE	+ 0x4 )
#define FVP_TIMER1_CNTL			( FVP_GLOBAL_TIMER_BASE	+ 0x8 )
#define FVP_TIMER1_INT_CTRL		( FVP_GLOBAL_TIMER_BASE	+ 0xC )
#define FVP_TIMER1_RIS			( FVP_GLOBAL_TIMER_BASE	+ 0x10 )
#define FVP_TIMER1_MIS			( FVP_GLOBAL_TIMER_BASE	+ 0x14 )
#define FVP_TIMER1_BGL			( FVP_GLOBAL_TIMER_BASE	+ 0x18 )

#define ARM_GLOBAL_TIMER_BASE		((uint) &__va_private_start + 0x0200 )
#define ARM_GLOBAL_TIMER_VALUE_LO	ARM_GLOBAL_TIMER_BASE				// Load Register
#define ARM_GLOBAL_TIMER_VALUE_HI	( ARM_GLOBAL_TIMER_BASE	+ 0x4 )		// Value
#define ARM_GLOBAL_TIMER_CNTL		( ARM_GLOBAL_TIMER_BASE	+ 0x8 )		// Value
#define ARM_GLOBAL_TIMER_INT_STATUS	( ARM_GLOBAL_TIMER_BASE	+ 0xC )		// Value
#define ARM_GLOBAL_TIMER_CMP_LO	( ARM_GLOBAL_TIMER_BASE	+ 0x10 )	// Value
#define ARM_GLOBAL_TIMER_CMP_HI	( ARM_GLOBAL_TIMER_BASE	+ 0x14 )	// Value
#define ARM_GLOBAL_TIMER_AUTO_INC	( ARM_GLOBAL_TIMER_BASE	+ 0x18 )	// Value

#endif /* FVP_H */
