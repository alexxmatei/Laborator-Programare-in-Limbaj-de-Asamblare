.model small
.stack 100
.data
	tabc db '225'
.code
	start:
		mov ax, @data
		mov ds, ax
		mov al, 0
	repet:
		mov bx, offset tabc
		push ax
		xlat
		call afisare
		pop ax
		inc al
		cmp al, 03H  
			; Se verifica daca s-au afisat toate caracterele
		jz sfarsit
		jmp repet
	afisare proc
		mov dl, al     
			; Pune in DL codul caracterului ce trebuie afisat
		mov ah, 2h
			; Functia DOS pentru afisarea caracterului din DL
		int 21h
		ret
	afisare endp
	sfarsit: 
		mov ax, 4C00h   ; Functia DOS de iesire in sistemul de operare
		int 21h
	end start