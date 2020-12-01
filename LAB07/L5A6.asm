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
		mov al, 'D' 
		mov cx, 12 
		rep stosb
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program