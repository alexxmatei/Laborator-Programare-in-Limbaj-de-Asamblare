.model small
.stack 100
.data
	nume db 'Alexandru Matei' 
.code
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov ax, word ptr nume
		push ax
		mov bx, word ptr nume[2]
		push bx
		mov bp, sp
		mov cx, word ptr nume[4]
		push cx
		mov al, nume[5]
		mov bx, word ptr nume[6]
		mov cx, word ptr nume[7]
		mov byte ptr [bp], al
		mov word ptr [bp + 2], bx
		mov word ptr [bp - 1], cx
		pop cx
		pop bx
		pop ax
	; iesire din program
	sfarsit:
		mov ah, 4ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end
	
	