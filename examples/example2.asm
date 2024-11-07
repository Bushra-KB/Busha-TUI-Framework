; example2.asm - Advanced example

org 0x100

section .text
    ; Initialize VGA text mode
    call init_vga

    ; Clear the screen
    call clear_screen

    ; Draw a box
    mov cx, 20
    mov dx, 10
    call draw_box

    ; Halt the system
    hlt

; Include other source files
%include 'vga.asm'
%include 'ui.asm'
%include 'utils.asm'

times 510-($-$$) db 0
dw 0xAA55
