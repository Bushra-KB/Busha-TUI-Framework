; utils.asm - Utility functions and helpers

section .text
clear_screen:
    ; Clear the screen
    mov ah, 0x06
    mov al, 0
    mov bh, 0x07
    mov cx, 0
    mov dx, 0x184F
    int 0x10
    ret
