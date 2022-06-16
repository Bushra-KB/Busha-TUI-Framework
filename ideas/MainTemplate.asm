;  ***************************************************************
;  ###############################################################
;  ##                                                           ##
;  ##    BUSH's ASSEMBLY TEXT MODE USER INTERFACE FRAMEWORK     ##
;  ##    --------------------------------------------------     ##
;  ##                   bushra.kmb@gmail.com                    ##
;  ###############################################################


;include 'emu8086.inc'

;-------------------- Header Section -----------------------------
NAME "Template for Main/Start"
TITLE "Bush's TUI Demo"


.STACK 512
.DATA

;-------------------- Code Section -------------------------------
.CODE
start:
	; set segment registers:
	;-----------------------
    mov ax, @data
    mov ds, ax
    mov es, ax

    ;Set Video mode, cursor, initial defaults
    mov ax, 1003h
    mov bx, 0
    int 10h
    cld



    ;-------Add your code here!------


    ;-------------------------------

    ; wait for any key....    
    mov ah, 1
    int 21h

    ; exit to operating system.
    mov ax, 4c00h 
    int 21h 

ends
end start           ;set entry point and stop the assembler.