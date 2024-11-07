; vga.asm - VGA text mode initialization and control

section .text
init_vga:
    ; Set video mode to 80x25 text mode (mode 3)
    mov ah, 0x00
    mov al, 0x03
    int 0x10
    ret

print_string:
    ; Print a null-terminated string at the current cursor position
    .next_char:
        lodsb
        or al, al
        jz .done
        mov ah, 0x0E
        int 0x10
        jmp .next_char
    .done:
        ret
