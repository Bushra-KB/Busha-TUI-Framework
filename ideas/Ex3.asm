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
    m1 DB "                ___       ___       _   _ ", '$'
    m2 DB "               |  _`\    |  _`\    ( ) ( )", '$'
    m3 DB "               | | ) |   | (_) )   | | | |", '$'
    m4 DB "               | | | )   |  _ <'   | | | |", '$'
    m5 DB "               | |_) |   | (_) )   | (_) |", '$'
    m6 DB "               |____/'   |____/'   (_____)", '$'

;-------------------- Code Section -------------------------------
.CODE
start:
	; set segment registers:
	;-------------------------------------------------------------
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
	
	
	mov al, 1
	mov bh, 0
	mov bl, 10011111b
	mov cx, 42
	mov dl, 0
	mov dh, 6
	mov bp, offset m1
	mov ah, 13h
	int 10h    
	
	mov al, 1
	mov bh, 0
	mov bl, 10011111b
	mov cx, 42
	mov dl, 0
	mov dh, 7
	mov bp, offset m2
	mov ah, 13h
	int 10h 
	
	
	mov al, 1
	mov bh, 0
	mov bl, 10011111b
	mov cx, 42
	mov dl, 0
	mov dh, 8
	mov bp, offset m3
	mov ah, 13h
	int 10h  
	
	mov al, 1
	mov bh, 0
	mov bl, 10011111b
	mov cx, 42
	mov dl, 0
	mov dh, 9
	mov bp, offset m4
	mov ah, 13h
	int 10h  
	
	mov al, 1
	mov bh, 0
	mov bl, 10011111b
	mov cx, 42
	mov dl, 0
	mov dh, 10
	mov bp, offset m5
	mov ah, 13h
	int 10h   
	
	mov al, 1
	mov bh, 0
	mov bl, 10011111b
	mov cx, 42
	mov dl, 0
	mov dh, 11
	mov bp, offset m6
	mov ah, 13h
	int 10h
	        


myend:	
	

ends
end start     
