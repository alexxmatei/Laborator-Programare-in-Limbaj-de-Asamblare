.model small
.stack 100
.data
	
.code
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov bx, sp 
		mov cx, 2134H 
		push cx 
		mov byte ptr ss:[bx-2], 22H 
		pop cx
	; iesire din program
	sfarsit:
		mov ah, 4ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end