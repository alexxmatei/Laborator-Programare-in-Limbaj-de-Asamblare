.model small
.stack 100
.code
	start:
		mov ax, 145Ah
		mov bx, 789Fh
		mov cx, 9245h
		mov dx, 7ABCh
		add ax, cx
		add bx, dx
		mov cx, ax
		mov dx, bx
		mov ds, ax
		mov al, 0
	repet:
		mov bx, cx
		push ax
		xlat
		call afisare
		pop ax
		inc al
		cmp al, 10h
		jz sfarsit
		jmp repet
		
	afisare proc
		mov dl, al
		mov ah, 2h
		int 21h
		ret
	afisare endp
	sfarsit:
		mov ax, 4C00h
end start