#!/bin/bash

set -e

echo "Cleaning previous builds..."
rm -rf iso
mkdir -p iso/boot/grub

# Compile the bootloader
echo "Compiling bootloader..."
nasm -f bin bootloader/bootloader.asm -o bootloader/bootloader.bin

# Compile the Rust kernel as an ELF executable with Multiboot2 header
echo "Compiling kernel as ELF..."
rustc --target x86_64-unknown-none -C opt-level=3 -C panic=abort -o kernel/kernel.o --emit=obj kernel/kernel.rs

# Link the kernel properly as an ELF
echo "Linking kernel..."
x86_64-elf-ld -nostdlib -T linker.ld -o kernel/kernel.elf kernel/kernel.o

# Ensure the kernel is copied to the ISO
echo "Copying kernel to ISO directory..."
cp kernel/kernel.elf iso/boot/kernel.elf
cp grub.cfg iso/boot/grub/grub.cfg

# Verify contents before making ISO
echo "Verifying contents of ISO folder..."
ls -lh iso/boot/

# Create the bootable ISO
echo "Creating bootable ISO..."
grub-mkrescue -o nabados.iso iso --modules="multiboot2"

# Verify the ISO contents
echo "Verifying ISO contents..."
xorriso -indev nabados.iso -ls /

# Run in QEMU
echo "Booting in QEMU..."
qemu-system-x86_64 -cdrom nabados.iso -m 512M
