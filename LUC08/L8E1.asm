.model small
.stack 100
.data
	n1  dd 12345h
	n2  dd 54321h
	rez dd ?
.code
	program:
	aduna proc near
		add ax, bx
		adc dx, cx
		ret
	aduna endp
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov ax, word ptr n1
		mov dx, word ptr n1 + 2
		mov bx, word ptr n2
		mov cx, word ptr n2 + 2
		call near ptr aduna
		mov word ptr rez, ax
		mov word ptr rez + 2, dx
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end initializare