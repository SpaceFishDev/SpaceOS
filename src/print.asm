print:
	push bp
	mov bp, sp
	
	mov bx, [bp + 4] ; is print message or whatever args is

	mov ah, 0x0e

	.Loop:
		cmp [bx], byte 0
		je .Stop
			mov al, [bx]
			int 0x10
			inc bx
			jmp .Loop

	.Stop:
		mov  sp, bp       
	    pop  bp
ret