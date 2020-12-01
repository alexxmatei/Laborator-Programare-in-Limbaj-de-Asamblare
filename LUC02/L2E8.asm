.model small
.stack 100
.data
	alfa db 23h
	beta db 43h
.code
	; Muta adresa segmentului de date in registrul DS
	start:
	initializare:
		mov ax, @data
		mov ds, ax
	cod:
		mov bl, alfa
		xchg al, beta
		mov alfa, al
	; Raspuns - Schimba locatiile valorilor 23 si 34 intre ele
	sfarsit:
		mov ah, 4Ch      ; Functia DOS de iesire din sistemul de operare
		int 21h
	end start