; ui.asm - User interface components and functions

section .text
draw_box:
    ; Draw a box on the screen
    ; Parameters: cx = width, dx = height
    ; Example usage: mov cx, 10; mov dx, 5; call draw_box
    pusha
    ; Add your box drawing code here
    popa
    ret
