.model small
.stack 100
.data
	
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		; modifica flaguri de stare
		xor ax, ax ; Ocupa 2 locatii in CS (?)
		; nu modifica flaguri de stare
		mov ax, 0  ; Ocupa 3 locatii in CS (?)
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program