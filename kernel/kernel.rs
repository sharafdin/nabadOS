#![no_std] // No standard library
#![no_main] // No default main()
use core::panic::PanicInfo;

#[repr(align(8))]
#[repr(C)]
struct MultibootHeader {
    magic: u32,
    architecture: u32,
    header_length: u32,
    checksum: u32,
}

#[link_section = ".multiboot"]
#[no_mangle]
static MULTIBOOT_HEADER: MultibootHeader = MultibootHeader {
    magic: 0xE85250D6,  // Multiboot2 magic number
    architecture: 0,     // 0 for i386, 1 for MIPS
    header_length: 16,   // Length of the header
    checksum: 0x100000000 - (0xE85250D6 + 0 + 16), // Ensures checksum is 0
};

const VGA_BUFFER: *mut u8 = 0xb8000 as *mut u8;

// VGA Color Codes
const BRIGHT_CYAN: u8 = 0x0B;
const BRIGHT_GREEN: u8 = 0x0A;
const YELLOW: u8 = 0x0E;
const WHITE: u8 = 0x0F;

fn print_colored(message: &str, row: usize, color: u8) {
    unsafe {
        for (i, byte) in message.bytes().enumerate() {
            let offset = (row * 80 + i) * 2;
            VGA_BUFFER.add(offset).write_volatile(byte);
            VGA_BUFFER.add(offset + 1).write_volatile(color);
        }
    }
}

fn print_cursor(row: usize, col: usize) {
    unsafe {
        let offset = (row * 80 + col) * 2;
        VGA_BUFFER.add(offset).write_volatile(b'_');
        VGA_BUFFER.add(offset + 1).write_volatile(WHITE);
    }
}

#[no_mangle]
pub extern "C" fn kernel_main() -> ! {
    print_colored("*********************************************************", 4, BRIGHT_CYAN);
    print_colored("*  Imagine a system without crashes, an OS without bugs. *", 5, BRIGHT_GREEN);
    print_colored("*        Welcome to nabadOS – Run in Peace.             *", 6, YELLOW);
    print_colored("*********************************************************", 7, BRIGHT_CYAN);
    
    print_cursor(9, 0); // Blinking cursor

    loop {}
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}
