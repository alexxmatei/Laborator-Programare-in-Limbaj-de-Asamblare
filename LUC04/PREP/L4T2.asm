.model small
.stack 100
.data
	
.code
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov bl, 77h
		sub bl, 78h
		mov ax, 0h
		push ax
		popf
		mov bl, 77h
		cmp bl, 78h
		mov ax, 0h
		push ax
		popf
		mov bl, 78h
		cmp bl, 78h
		mov ax, 0h
		push ax
		popf
		mov bl, 79h
		cmp bl, 78h
		mov ax, 0h
		push ax
		popf
	; iesire din program
	sfarsit:
		mov ah, 4ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end