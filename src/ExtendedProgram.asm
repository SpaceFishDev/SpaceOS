[org 0x7e00]


call svm

call setup_cursor
push 0
push 0
push 0
mov bp, sp
loop:
	call get_c
	cmp al, 8
	je backspace
	cmp al, 13
	je enter
	cmp [bp], byte 78
	je wrap
	call putc
	mov ah, 02h
	add [bp], byte 1
	mov dl, [bp]
	mov dh, [bp + 1]
	int 10h
	mov bx, [bp]
	mov [cmd + bx], al
	mov al, [cmd + bx]
jmp loop

backspace:
	mov ax, bx
	mov bx, [bp + 1]
	cmp [bp],  bx
	mov bx, ax
	je both_eq
	.Continue:
		cmp [bp], byte 0
		je back_wrap
		mov ah, 02h
		sub [bp], byte 1
		mov dl, [bp]
		mov dh, [bp + 1]
		int 10h
		mov al, ' '
		call putc
jmp loop

back_wrap:
	sub [bp + 1], byte 1
	mov [bp], byte 78
	call backspace
jmp loop

wrap:
	mov [bp], byte 0
	add [bp + 1], byte 1
	mov ah, 02h
	mov dl, [bp]
	mov dh, [bp + 1]
	int 10h
jmp loop

both_eq:
	cmp [bp], byte 0
	je loop
jmp backspace.Continue

enter:
	mov [cmd + bp + 1], byte 0
	push cmd
	call print
jmp wrap

jmp $

cmd db "                                                                ",0

%include "print.asm"
%include "graphics.asm"


times 2048-($-$$) db 0