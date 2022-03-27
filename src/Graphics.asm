

svm:
	mov ah,0
	mov al,12h
	int 10h
ret

setup_cursor:
	mov ah, 02h
	mov bh, 0
	mov dh, 0
	mov dl, 0

	int 10h
ret

putc:
	mov ah,09h
	mov bl, 0111b
	mov cx,1      
	int 10h  
ret

get_c:
	mov ah, 0h
	int 0x16
ret
	