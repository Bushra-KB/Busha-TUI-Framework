;  ***************************************************************
;  ##                                                           ##
;  ##                                                           ##
;  ##    BUSH's ASSEMBLY TEXT MODE USER INTERFACE FRAMEWORK     ##
;  ##    --------------------------------------------------     ##
;  ##                   bushra.kmb@gmail.com                    ##
;  ***************************************************************



;-------------------- Header Section -----------------------------
NAME "Template for Main/Start"
TITLE "Bush's TUI Demo"


.STACK 512
.DATA   
    msg1 DB "Hello World!"

;-------------------- Code Section -------------------------------
.CODE
start:
	; set segment registers:
	;-----------------------
    mov ax, @data
    mov ds, ax
    mov es, ax

    ;Set Video mode
    mov al, 03h 
    mov ah, 00h
    mov bx, 0
    int 10h
    cld
    
    ; hide blinking text cursor 
    mov ch, 32
    mov ah, 1
    int 10h  
    
    ;Set cursor position at 0x0
    mov dh, 0      ;row
	mov dl, 0      ;column
	mov bh, 0      ;page
	mov ah, 02h
	int 10h    
	
	;clear entire screen white on lightblue
	mov al, 00h  
	mov bh, 10011111b      ;attribute 
	mov ch, 0      ;row upper left corner
	mov cl, 0      ;column upper left corner
	mov dh, 24      ;row lower right corner
	mov dl, 79      ;columnlower right corner
	mov ah, 06h
	int 10h 
	
	;Set cursor position at 0x0
    mov dh, 0      ;row
	mov dl, 0      ;column
	mov bh, 0      ;page
	mov ah, 02h
	int 10h   
	
	;print hello world
	mov al,1
	mov bh, 0
	mov bl, 10011111b     ;attrib
	mov dl, 15          ;column at which to start writing
	mov dh, 5           ;row at which to start writing
	mov cx, 12          ;number of characters in string 
	mov bp, offset msg1
	mov ah, 13h
	int 10h

ends
end start     
