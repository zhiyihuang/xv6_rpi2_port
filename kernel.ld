/******************************************************************************
*	kernel.ld
*	 by Alex Chadwick
*
*	A linker script for generation of raspberry pi kernel images.
******************************************************************************/
ENTRY(_start)

PHYSOFFSET  = DEFINED(PHYSOFFSET)  ? PHYSOFFSET  : 0x80008000;
KERNOFFSET  = DEFINED(KERNOFFSET)  ? KERNOFFSET  : 0xC0008000;
SHIFT		= KERNOFFSET - PHYSOFFSET; 

SECTIONS {
	/* Link the kernel at this address: "." means the current address */
	/* Must be equal to KERNLINK */
	
	/*
	* First and formost we need the .init section, containing the code to 
	* be run first. We allow room for the ATAGs and stack and conform to 
	* the bootloader's expectation by putting this code at 0x8000.
	*/
	
	.init PHYSOFFSET : {
		*(.init)
	}
	
	. = ALIGN(0x100);
	INIT_END = .;
	. = . + SHIFT;
	
	/* 
	* Next we put the rest of the code.
	*/
	
	 .text : AT (INIT_END) {  
		*.c.o(.text)
		*(.text .stub .text.*)
	}

	/*
	* read-only data
	*/
	.rodata : {
		*(.rodata .rodata.*)
	}

	/* Adjust the address for the data segment to the next page */
	. = ALIGN(0x1000);
	
	/* 
	* Next we put the data.
	*/
	.data : {
		*(.data)
		*.c.o(*)
	}

	.bss : {
		*(.bss)
	}

	PROVIDE(end = .);

	/*
	* Finally comes everything else. A fun trick here is to put all other 
	* sections into this section, which will be discarded by default.
	*/
	/DISCARD/ : {
		*(.eh_frame .note.GNU-stack)
	}
}
