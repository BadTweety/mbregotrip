org         0x7c00

bits 16

msg : db "Timotej  ", 0 ;ime, znaki za animacijo niso potrebni (hardcoded)
msg1 : db "\", 0
msg2 : db "|", 0
msg3 : db "/", 0
msg4 : db "-", 0

cli	 ;interrupts
	;IZPISI IME
mov si, msg		
mov ah, 0x0e
int 0x10
.loop   lodsb                   ; AL <- [DS:SI] && SI++
        or      al, al          ; end of string?
        jz      naprej
        int     0x10            ; print char
        jmp     .loop           ; next char

naprej: mov al, 92			 ; izpisi animacijo, znaki so opisani zgoraj, nato pa hardcodani. 8 je backspace
	call printchar
	mov al, 8
	call printchar
	mov al, 124
	call printchar
	mov al, 8
	call printchar
	mov al, 47
	call printchar
	mov al, 8
	call printchar
	mov al, 45
	call printchar
	mov al, 8
	call printchar
	jmp naprej

printchar: 	mov ah, 0x0e
		mov bh, 0x00
		mov bl, 0x07
		int 0x10
		ret

PrintCharacter:	;Procedure to print character on screen
	;Assume that ASCII value is in register AL
MOV AH, 0x0E	;Tell BIOS that we need to print one charater on screen.
MOV BH, 0x00	;Page no.
MOV BL, 0x07	;Text attribute 0x07 is lightgrey font on black background

halt:           hlt
times 510 - ($-$$) db 0   ; opisano v porocilu
