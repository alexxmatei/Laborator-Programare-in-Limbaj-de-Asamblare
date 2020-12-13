.model small
.stack 100
.data
	x db 10
	y db 15
	adr_x dd x
	adr_y dd y
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		lds si, adr_x
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program