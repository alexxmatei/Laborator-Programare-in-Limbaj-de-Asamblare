.model small
.stack
.data
	v dd 12Ah
.code
	mov AX,@data
	mov DS,AX
	mov CX,0
	mov BX,10; 0Ah
	mov DX,word ptr [V+2]
	mov AX,word ptr [v]
et:	
	div BX
	push DX
	mov DX,0
	ADD CX,1
	cmp AX,0
	jnz et
et2:	
	pop DX
	ADD DX,'0'
	mov AH,02h
	int 21h
	LOOP et2
	mov AH,4Ch
	int 21h
end