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
		mov ah, 36h
		mov dl, 3h
		int 21h
		;mov ah, 8
		;int 21h
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program