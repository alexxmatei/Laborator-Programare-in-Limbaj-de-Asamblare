;Exercitiul 1
.model small
.stack 100
.data
	taba db 'Marcel'
	tabb db 6 DUP (?)
.code
	start: 
		mov ax,@data
		mov ds,ax
		;mov es,ax
		mov al,0 
		lea si, taba
		lea di, tabb
		mov cx, 6
		rep movs es:[tabb],ds:[taba]
		;lods es:[taba]
		;stos es:[tabb]
		repet: 
		mov bx, offset tabb
		push ax 
		xlat 
		call afisare 
		pop ax
		inc al
		cmp al,06H
		jz sfarsit
		jmp repet
	afisare proc
		mov dl,al
		mov ah,2h
		int 21h
		ret
	afisare endp
	sfarsit: 
		mov ax,4c00h
		int 21h
end start
