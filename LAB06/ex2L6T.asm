.model small
.stack 100
.data
	Numar dw ?
	Baza dw 16
	rez dw 0h
.code
	program:
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov cl, 10h
		mov ch, 30h
		mov ah, 01h 
		int 21h
		sub al, ch
		mul cl
		mov ah, al
		mov bh,ah
		mov ah, 01h 
		int 21h
		sub al, ch
		add bh, al
		
		mov ah, 01h 
		int 21h
		sub al, ch
		mul cl
		mov bl,al
		mov ah, 01h 
		int 21h
		sub al, ch
		add bl, al
		
		mov Numar,bx
		
		mov ax, Numar
		
		mov dx,0
		div Baza
		push dx
		div Baza
		push dx
		div Baza
		push dx
		div Baza
		push dx

		mov cx,3 ;contorul1
		mov bx,0; contorul2
repet :
		mov ax, 0
		pop byte ptr ax
		call Inmultire
		cmp cx, 0
		jz sfarsit
		
		
	Inmultire proc
		mul Baza
		add bx,1
		cmp cx,bx
		JNZ Inmultire
		mov bx,0
		dec cx
		add rez,ax
		jmp repet
	Inmultire endp
		
		
	afisare:
		mov ax,rez
		mov dx, ax
		mov ah,2h
		int 21
		jmp sfarsit
		
	sfarsit:
		mov ah, 4Ch     
		int 21h
end program