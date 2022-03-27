[org 0x7e00]

call svm

call setup_cursor

push 0
mov bp, sp
loop:
	call get_c
	cmp al, 8
	je backspace
	call putc
	mov ah, 02h
	add [bp], byte 1
	mov dl, [bp]
	mov dh, 0
	int 10h
jmp loop

backspace:
	mov ah, 02h
	sub [bp], byte 1
	mov dl, [bp]
	mov dh, 0
	int 10h
	mov al, ' '
	call putc
	jmp loop


jmp $

%include "print.asm"
%include "graphics.asm"

times 2048-($-$$) db 0