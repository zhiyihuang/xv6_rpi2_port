UNAME := $(shell uname -m)

ifeq ($(UNAME), x86_64)
	# set FVP as default on x86_64 systems	
	hw?=rpi2
	TOOLCHAIN?=~/gcc-arm-none-eabi-5_4-2016q3/bin/arm-none-eabi-
else
	# RPI reports 'uname -m' as: armv7l
	hw?=rpi2
endif

# PHYSTART  : start of memory (RAM)
# PHYSIZE   : size of memory
# KERNBASE  : address of high memory schema
# MMIO_PA   : physical address of peripherals (MMIO)
# MMIO_VA   : virtal address of peripherals
# MMIO_SIZE : size of peripherals
# PERIPHBASE: virtal address of PERIPHBASE[39:15]

ifeq ($(hw), fvp)
	PHYSTART  = 0x80000000
	PHYSIZE   = 0x08000000
	KERNBASE  = 0xC0000000
	MMIO_PA   = 0x1C000000
	MMIO_VA   = 0xD0000000
	MMIO_SIZE = 0x04000000
	PERIPHBASE= 0xDF000000
	CFLAGS    =   -ffreestanding -nostdlib -nostartfiles -O0 -Wall -MD -ggdb -Wall -mcpu=cortex-a9 -mfloat-abi=hard -fno-short-enums -I include
	#CFLAGS    =   -ffreestanding -nostdlib -nostartfiles -O2 -Wall -MD -ggdb -Wall -mcpu=cortex-a9 -mfloat-abi=hard -fno-short-enums -I include
	TARGET    = fvp.img
	CC_OPTIONS = -DFVP
else ifeq ($(hw), rpi1)
	PHYSTART  = 0x00000000
	# PHYSIZE set to 128mb
	PHYSIZE   = 0x08000000
	KERNBASE  = 0x80000000
	MMIO_PA   = 0x20000000
	MMIO_VA   = 0xD0000000
	MMIO_SIZE = 0x01000000
	PERIPHBASE= 0xDF000000
	#CFLAGS   = -fno-pic -static -Wno-packed-bitfield-compat -fno-builtin -fno-strict-aliasing -fshort-wchar -O2 -Wall -MD -ggdb -Werror -fno-omit-frame-pointer -fno-stack-protector -Wa,-march=armv6 -Wa,-mcpu=arm1176jzf-s -mfloat-abi=hard -fno-short-enums -I include
	CFLAGS    =   -ffreestanding -nostdlib -nostartfiles -O2 -Wall -MD -ggdb -Wall -mcpu=arm1176jzf-s -mfloat-abi=hard -fno-short-enums -I include
	TARGET    = kernel.img
	CC_OPTIONS = -DRPI1
else ifeq ($(hw), rpi2)
	 PHYSTART = 0x00000000
	# PHYSIZE set to 256mb
	PHYSIZE   = 0x10000000
	KERNBASE  = 0x80000000
	MMIO_PA   = 0x3F000000
	MMIO_VA   = 0xD0000000
	MMIO_SIZE = 0x01000000
	PERIPHBASE= 0xDF000000
	CFLAGS    = -ffreestanding -nostdlib -nostartfiles -O2 -Wall -MD -ggdb -Wall -mcpu=cortex-a7 -mfloat-abi=hard -fno-short-enums -I include 
	TARGET    = kernel7.bin
	CC_OPTIONS = -DRPI2
else
$(error Hardware (hw) should be fvp, rpi1 or rpi2, eg. make hw=rpi2)
endif


K_PDX_BASE=$(shell printf "0x%X\n" $$(( $(PHYSTART) + 0x4000 )) )
K_PTX_BASE=$(shell printf "0x%X\n" $$(( $(PHYSTART) + 0x3000 )) )
OFFSET=0x8000
PHYSOFFSET=$(shell printf "0x%X\n" $$(( $(PHYSTART) + $(OFFSET) )) )
KERNOFFSET=$(shell printf "0x%X\n" $$(( $(KERNBASE) + $(OFFSET) )) )

CC_OPTIONS += -DPHYSTART=$(PHYSTART) -DPHYSIZE=$(PHYSIZE) -DKERNBASE=$(KERNBASE) -DMMIO_PA=$(MMIO_PA) -DMMIO_VA=$(MMIO_VA) -DMMIO_SIZE=$(MMIO_SIZE) -DPERIPHBASE=$(PERIPHBASE)
CC_OPTIONS += -DK_PDX_BASE=$(K_PDX_BASE) -DK_PTX_BASE=$(K_PTX_BASE) -DPHYSOFFSET=$(PHYSOFFSET) -DKERNOFFSET=$(KERNOFFSET)

LD_OPTIONS = --defsym=PHYSTART=$(PHYSTART) --defsym=PHYSIZE=$(PHYSIZE) --defsym=KERNBASE=$(KERNBASE) --defsym=MMIO_PA=$(MMIO_PA) --defsym=MMIO_VA=$(MMIO_VA) --defsym=MMIO_SIZE=$(MMIO_SIZE) --defsym=PERIPHBASE=$(PERIPHBASE) 
LD_OPTIONS += --defsym=K_PDX_BASE=$(K_PDX_BASE) --defsym=K_PTX_BASE=$(K_PTX_BASE) --defsym=PHYSOFFSET=$(PHYSOFFSET) --defsym=KERNOFFSET=$(KERNOFFSET)

# Build directory
BUILD=build/
# Sources directory.
SOURCE=source/
# Generated listing file.
LIBRARIES=

# The names of all object files that must be generated. Deduced from the 
# assembly code files in source.
ASM_OBJECTS = $(patsubst $(SOURCE)%.S,$(BUILD)%.o,$(wildcard $(SOURCE)*.S))

C_OBJECTS = $(patsubst $(SOURCE)%.c,$(BUILD)%.o,$(wildcard $(SOURCE)*.c))

# Rule to make everything.
all : $(TARGET)
	
# Rule to make the elf file.
$(TARGET): $(ASM_OBJECTS) $(C_OBJECTS) kernel.ld
	$(TOOLCHAIN)ld $(ASM_OBJECTS) $(C_OBJECTS) -L. $(patsubst %,-l %,$(LIBRARIES)) $(LD_OPTIONS) -Map kernel.map -o $(BUILD)kernel.elf -T kernel.ld
	$(TOOLCHAIN)objdump -d $(BUILD)kernel.elf > kernel.list
	$(TOOLCHAIN)objcopy $(BUILD)kernel.elf -O binary $(TARGET)

# Build ASM files
$(BUILD)%.o: $(SOURCE)%.S $(BUILD)
	$(TOOLCHAIN)gcc -c $(CFLAGS) $(CC_OPTIONS) -I source $< -o $@

# Build C files
$(BUILD)%.o: $(SOURCE)%.c $(BUILD)
	$(TOOLCHAIN)gcc -c $(CFLAGS) $(CC_OPTIONS) $<  -o $@

loader: loader.S kernel7.bin
	$(TOOLCHAIN)gcc -c loader.S -o loader.elf -fpic -ffreestanding -nostdlib -nostartfiles -O0 -Wall -ggdb -Wall -mcpu=cortex-a7 -mfloat-abi=hard -fno-short-enums -o loader.o
	$(TOOLCHAIN)ld loader.o -o loader.elf -T loader.ld
	#$(TOOLCHAIN)objdump -D loader.elf > loader.list
	$(TOOLCHAIN)objcopy loader.elf -O binary kernel7.img
	-rm loader.elf  loader.o

$(BUILD):
	mkdir $@

.PHONY: report
report:
	@echo 'Hardware  :' $(hw)
	@echo 'TARGET    :' $(TARGET)
	@echo 'PHYSTART  :' $(PHYSTART)
	@echo 'PHYSIZE   :' $(PHYSIZE)
	
	@echo 'K_PDX_BASE:' $(K_PDX_BASE)
	@echo 'K_PTX_BASE:' $(K_PTX_BASE)
	@echo 'PHYSOFFSET:' $(PHYSOFFSET)
	
	@echo 'KERNBASE  :' $(KERNBASE)
	@echo 'KERNOFFSET:' $(KERNOFFSET)

	@echo 'MMIO_PA   :' $(MMIO_PA)
	@echo 'MMIO_SIZE :' $(MMIO_SIZE)
	@echo 'MMIO_VA   :' $(MMIO_VA)
	@echo 'PERIPHBASE:' $(PERIPHBASE)
	
	@echo 'CFLAGS    :' $(CFLAGS)
	@echo 'CC_OPTIONS:' $(CC_OPTIONS)
	@echo 'LD_OPTIONS:' $(LD_OPTIONS)

.PHONY: install
install:
	cp kernel*.img /media/$(USER)/boot/
	sync
	umount /media/$(USER)/*
	
# Rule to clean files.
clean : 
	-rm -rf $(BUILD)
	-rm -f *.img
	-rm -f *.bin
	-rm -f kernel.list
	-rm -f kernel.map
