OUTPUT_ARCH( "riscv" )
ENTRY( _start )

/* memory bases for the program */
/* these addresses are in DDR which starts at 0x800,000,000*/
IMEM_START       = 0x800000000;

IMEM_SIZE        = 0x20000;
IMEM_BASE        = IMEM_START;
IMEM_END         = IMEM_START + (768*1024);
STACK_SIZE       = 8K;
STACK_FENCE_SIZE = 16;
CMEM_BASE        = 0x100000000;
TMEM_BASE        = 0x080000000;
TMEM_SIZE        = 0x20000;

SECTIONS
{
    . = IMEM_BASE;
    .boot   : { *(.boot) }
    .text : { *(.text) }
    .data : { *(.data) }
    .bss : { *(.bss) }
    . = ALIGN(8);
    .tohost : { *(.tohost) }
    . = ALIGN(8);
    STACK_END = .;
    .stack_fence : { */xc_boot.o(._stack_fence) }
    . = STACK_END + STACK_SIZE + STACK_FENCE_SIZE;
    STACK_BASE = .;
    . = ALIGN(8);
    _end = .;
}

