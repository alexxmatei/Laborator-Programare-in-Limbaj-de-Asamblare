.model small
.stack 100
.data
	n1  dd 12345h
	n2  dd 54321h
	rez dd ?
.code
	program:
	aduna proc near
		mov ax, [si]
		add ax, [di]
		mov dx, [si + 2]
		adc dx, [di + 2]
		ret
	aduna endp
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		lea si, n1
		lea di, n2
		call near ptr aduna
		mov word ptr rez, ax
		mov word ptr rez + 2, dx
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end initializare