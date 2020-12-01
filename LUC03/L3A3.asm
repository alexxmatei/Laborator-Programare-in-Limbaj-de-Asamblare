.model small
.stack 100
.data
	
.code
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov cl, 4 
		mov ax, 0702h 
		shl al, cl 
		shr ax, cl 
	; iesire din program
	sfarsit:
		mov ah, 4ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end