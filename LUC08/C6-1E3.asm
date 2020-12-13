.model small
.stack 100
.data
	zona label dword
	n1  dd 12345h
	n2  dd 54321h
	rez dd ?
.code
	program:
	aduna proc near
		mov ax, [bx]
		add ax, [bx + 4]
		mov dx, [bx + 2]
		adc dx, [bx + 6]
		mov [bx + 08], ax 
		mov [bx + 10], dx 
		ret
	aduna endp
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		lea bx, zona
		call near ptr aduna
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end initializare