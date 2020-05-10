#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include "terminal.h"

#if defined(__linux__)
#error "You are not using a cross-compiler"
#endif
 
#if !defined(__i386__)
#error "This needs to be compiled with a ix86-elf compiler"
#endif

void kernel_main(void) 
{
	terminal_initialize();

	terminal_setcolor(vga_entry_color(VGA_COLOR_LIGHT_BLUE, VGA_COLOR_BLACK));

	terminal_writestring("Hello, kernel World!\n");
	terminal_writestring("Line 2\n");
}
