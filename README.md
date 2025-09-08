**Its a simple OS from scratch, written in Assembly and C (LATER)**
# DevourOS (Functional Bootloader)

## Features
✅ BIOS-compliant boot sector (512 bytes)  
✅ Bootable floppy disk image generation  
✅ QEMU and physical hardware support  
✅ Makefile-based build system  

## Quick Start

### Prerequisites
- NASM (≥ 2.15)
- QEMU (≥ 5.0)
- GNU Make

## Build & Run
- make        # Builds bootloader binary and disk image
- qemu-system-i386 -fda  build/main_floppy.img # Launches in QEMU

Technical Details

    Boot Address: 0x7C00

    Assembly Format: NASM (Intel syntax)

    Disk Layout:

    First sector: Bootloader

    Remaining space: Reserved for future kernel
