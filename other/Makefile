SHELL = /bin/sh

## General Flags
TARGET	= all
PROJECT = main
ASM		= nasm
ABI		= elf64
SFILES	= $(wildcard *.asm)
OFILES	= $(SFILES:.asm=.o)
ASMFLAGS = -f

.STUFFIXES: .o .asm
.PHONY: clean build rebuild help

target:	$(TARGET)

all: build
	@./$(PROJECT)
	
build: $(PROJECT) 
rebuild:	clean	all


%.o	:	%.asm
	$(ASM) $(ASMFLAGS) $(ABI) $<

$(PROJECT) : $(OFILES)
	ld -o $(PROJECT) $(OFILES)

link :	$(PROJECT)
assemble : $(OFILES)

clean:
	@rm -f *.o *.elf *.hex $(PROJECT)

help:
	@echo "Options:"
	@echo "	all"
	@echo "	build"
	@echo "	rebuild"
	@echo "	clean"
	@echo "	link"
	@echo "	assemble"
	@echo "	help"