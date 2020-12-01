.model small
.stack 100
.data
	
.code
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov cx, 1234h
		push cx
		mov bx, 2359h
		push bx
		mov ax, 4257h
		mov bp, sp
		mov byte ptr [bp], al
		pop ax					; ax = 2357h
	; iesire din program
	sfarsit:
		mov ah, 4ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end