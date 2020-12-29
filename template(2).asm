linie_noua MACRO
	mov dl, 10
	mov ah, 2
	int 21h
ENDM

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
	
	; iesire din program
	sfarsit:
		; adauga un caracter de tip 'newline', linie noua
		linie_noua
		mov ah, 4Ch    ; functia DOS de iesire din program
		int 21h
end program