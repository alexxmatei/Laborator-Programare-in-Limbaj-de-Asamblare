.model small
.stack 100
.data
	n1  dd 12345h
	n2  dd 54321h
	rez dd ?
.code
	program:
	aduna proc far
		push bp
		mov bp, sp
		mov ax, [bp + 10]
		add ax, [bp + 6]
		mov dx, [bp + 12]
		adc dx, [bp + 8]
		pop bp
		ret
	aduna endp
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		push word ptr n1 + 2
		push word ptr n1
		push word ptr n2 + 2
		push word ptr n2
		call far ptr aduna
		add sp, 8
		mov word ptr rez, ax
		mov word ptr rez + 2, dx
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end initializare