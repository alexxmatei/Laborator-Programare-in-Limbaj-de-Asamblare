.model small
.stack 100
.data
	alfa struc
		a1 db ?
		a2 db 21h
		a3 dw 5176h
	alfa ends
	tab alfa 5 dup(<33h, ?, 1234h>)
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
	
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program