# Toolchain
RISCV = /opt/riscv
CC = $(RISCV)/bin/riscv64-unknown-elf-gcc

ARCH = rv64gcv
ABI = lp64d

CFLAGS = -march=$(ARCH) \
         -mabi=$(ABI) \
         -O3

LDFLAGS = -lm

SPIKE = spike --isa=$(ARCH) pk

# Targets
all: vec.elf noVec.elf

vec.elf: vec.c operacionesVectoriales.c
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

noVec.elf: noVec.c operacionesVectoriales.c
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

asm:
	$(CC) $(CFLAGS) -S operacionesVectoriales.c -o operacionesVectoriales.s

run_vec: vec.elf
	$(SPIKE) vec.elf

run_noVec: noVec.elf
	$(SPIKE) noVec.elf

clean:
	rm -f *.elf *.s