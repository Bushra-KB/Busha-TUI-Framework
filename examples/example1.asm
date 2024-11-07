; example1.asm - Basic example

org 0x100

section .text
    ; Initialize VGA text mode
    call init_vga

    ; Display a message
    mov si, example_msg
    call print_string

    ; Halt the system
    hlt

example_msg db 'This is a basic example.', 0

; Include other source files
%include 'vga.asm'
%include 'ui.asm'
%include 'utils.asm'

times 510-($-$$) db 0
dw 0xAA55
