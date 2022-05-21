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
    mnu1 DB "Menu one", '$' 
    mnu2 DB "Menu two", '$'
    mnu3 DB "Menu three", '$'
    mnu4 DB "Menu four", '$'
    mnu5 DB "Menu five", '$'

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
	
	
	;create red rectangle at the center
	mov al, 00h            ;num of lines
	mov bh, 1100_1111b      ;attribute white on red
	mov ch, 2      ;row upper left corner
	mov cl, 14      ;column upper left corner
	mov dh, 22      ;row lower right corner
	mov dl, 64      ;columnlower right corner
	mov ah, 06h
	int 10h   
	
	;create white rectangle inside the red rectangle
	mov al, 00h            ;num of lines
	mov bh, 1111_0000b      ;attribute black on white
	mov ch, 5      ;row upper left corner
	mov cl, 16      ;column upper left corner
	mov dh, 21      ;row lower right corner
	mov dl, 62      ;columnlower right corner
	mov ah, 06h
	int 10h  
	
	;show menu
menu:   
    call showmnu
    ;Set cursor position at 5x17
    mov dh, 5      ;row
	mov dl, 17      ;column
	mov bh, 0      ;page
	mov ah, 02h
	int 10h  
	
	;highlight selected menu
	mov al, 01h            ;num of lines
	mov bh, 0111_0011b      ;attribute cyan on lightgray
	mov ch, 5      ;row upper left corner
	mov cl, 17      ;column upper left corner
	mov dh, 5      ;row lower right corner
	mov dl, 62      ;columnlower right corner
	mov ah, 06h
	int 10h    
	
	call showmnu
	 
	
    mov ax, 0
	mov ah, 00h			; BIOS call to wait for key
	int 16h 
	
	cmp ah, 50h	    ; Down pressed?  
	
	
	;highlight selected menu
	mov al, 01h            ;num of lines
	mov bh, 0111_0011b      ;attribute cyan on lightgray
	mov ch, 6      ;row upper left corner
	mov cl, 17      ;column upper left corner
	mov dh, 6      ;row lower right corner
	mov dl, 62      ;columnlower right corner
	mov ah, 06h
	int 10h  
	
	
	
	jmp myend
    
	 


showmnu:  
    ;Set cursor position at 0x0
    mov dh, 5      ;row
	mov dl, 17      ;column
	mov bh, 0      ;page
	mov ah, 02h
	int 10h 
	
	mov dx, offset mnu1 
	mov ah, 9
	int 21h 
	
	mov dh, 6      ;row
	mov dl, 17      ;column
	mov bh, 0      ;page
	mov ah, 02h
	int 10h 
	
	mov dx, offset mnu2 
	mov ah, 9
	int 21h  
	
	mov dh, 7      ;row
	mov dl, 17      ;column
	mov bh, 0      ;page
	mov ah, 02h
	int 10h 
	
	mov dx, offset mnu3 
	mov ah, 9
	int 21h 
	
	mov dh, 8      ;row
	mov dl, 17      ;column
	mov bh, 0      ;page
	mov ah, 02h
	int 10h 
	
	mov dx, offset mnu4 
	mov ah, 9
	int 21h 
	
	mov dh, 9      ;row
	mov dl, 17      ;column
	mov bh, 0      ;page
	mov ah, 02h
	int 10h 
	
	mov dx, offset mnu5 
	mov ah, 9
	int 21h  
	
	ret

myend:	
	

ends
end start     
