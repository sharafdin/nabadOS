BITS 16
ORG 0x7C00

mov ax, 0x07C0
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7C00

cli
lgdt [gdt_desc]
mov eax, cr0
or eax, 1
mov cr0, eax

jmp 0x08:protected_mode

[SECTION .data]
gdt:
    dq 0
    dq 0x00CF9A000000FFFF
    dq 0x00CF92000000FFFF

gdt_desc:
    dw gdt_desc - gdt - 1
    dd gdt

[SECTION .text]
BITS 32
protected_mode:
    mov ax, 0x10
    mov ds, ax
    mov ss, ax
    mov esp, 0x90000

    call switch_to_long_mode

[SECTION .text]
BITS 64
switch_to_long_mode:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov rsp, 0x90000

    ; Jump to kernel at memory location 0x100000
    mov rax, 0x100000
    call rax

    jmp $

times 510 - ($-$$) db 0
dw 0xAA55
