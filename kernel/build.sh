#!/bin/bash
clang --target=i686-elf -c src/*.c -std=gnu99 -ffreestanding  -Wall -Wextra
clang --target=i686-elf -T linker.ld -o os.bin -ffreestanding -O2 -nostdlib boot.o kernel.o terminal.o -lgcc

if grub-file --is-x86-multiboot os.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi

cp os.bin isodir/boot/os.bin
if [ $? -eq 0 ]; then
	echo "Copied os.bin.cfg"
else
	echo "Error $?"
fi
cp grub.cfg isodir/boot/grub/grub.cfg
if [ $? -eq 0 ]; then
	echo "Copied grub.cfg"
else
	echo "Error: $?"
fi
grub-mkrescue -o os.iso isodir
