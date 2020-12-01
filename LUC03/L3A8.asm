.model small
.stack 100
.data
	tabc db '0149'
.code
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov al, 01h
		int 21h
		mov bx, offset tabc
		sub al, 30h
		xlat
		mov dl, al
		mov ah, 02h
		int 21h
	; iesire din program
	sfarsit:
		mov ah, 4ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end