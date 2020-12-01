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
		STD     ;   Set direction => Direction Flag (DF) = 1
		CLD     ; Clear direction => Direction Flag (DF) = 0
		STD     ;   Set direction => Direction Flag (DF) = 1
		CLD     ; Clear direction => Direction Flag (DF) = 0
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program