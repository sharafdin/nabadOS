ENTRY(kernel_main)

SECTIONS {
    . = 1M;  /* Load kernel at 1MB (0x100000) */

    .multiboot : {
        *(.multiboot)
    }

    .text : { *(.text) }
    .rodata : { *(.rodata) }
    .data : { *(.data) }
    .bss : { *(.bss COMMON) }
}
