# Custom MBR bootloader
Testing of a custom MBR, written (mostly) in assembly, for purposes of Digital Forensics course at Faculty of Computer and Information science in Ljubljana.

## How to test:

Either download and install bochs (preferrably on Ubuntu), change config files to use this .asm file and run, or run the following commands:

> nasm koncni.asm -f bin -o koncni.bin
> dd if=dev/sdX of=~/backupMBR.bin bs=512 count=1
> dd if=~/koncni.bin of=/dev/sdX bs=512 count=1

Where sdX represents the name of the physical (USB) thumb drive. After using dd to copy the files to first 512B, the MBR, of the drive, just reboot and you will see the bootloader! 
