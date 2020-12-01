.model small
.stack 100
.data
	nr1 dd 145A789Fh
	nr2 dd 92457ABCh
	tabc db '0123456789ABCDEF'
.code
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov ax, word ptr nr1
		mov bx, word ptr nr2
		add ax, bx
		push ax
		mov ax, word ptr [nr1 + 2]
		mov bx, word ptr [nr2 + 2]
		add ax, bx
		push ax
			mov bp, sp
			inc bp
		repet:
			mov al, 0
			mov bx, 0
			call afisare
			jmp repet
		afisare proc
			mov dl, byte ptr [bp]
			shr dl, 4
			mov bl, dl
			mov al, offset tabc
			xlat
			mov dl, al
			mov ah, 2h
			int 21h
			
			mov dl, byte ptr [bp]
			shl dl, 4
			shr dl, 4
			mov bl, dl
			mov al, offset tabc
			xlat
			mov dl, al
			mov ah, 2h
			int 21h
			
			mov dl, byte ptr [bp - 1]
			shr dl, 4
			mov bl, dl
			mov al, offset tabc
			xlat
			mov dl, al
			mov ah, 2h
			int 21h
			
			mov dl, byte ptr [bp - 1]
			shl dl, 4
			shr dl, 4
			mov bl, dl
			mov al, offset tabc
			xlat
			mov dl, al
			mov ah, 2h
			int 21h
			
			mov dl, ' '
			int 21h 
			
			add bp, 2
			cmp bp, 65h
			jz sfarsit
			ret
		afisare endp
	; iesire din program
	sfarsit:
		mov ah, 4ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end