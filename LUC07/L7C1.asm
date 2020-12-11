.model small 
.stack 100 
.data     
	demp dd 44444444h
	imp dw 1111h
	cat dd ?
	rest dw ?
.code
divc proc
	cmp bx, 0
	jnz divc1
	int 0
divc1:
	push es
	push di
	push cx
	mov di, 0
	mov es, di
	push es:[di]
	push es:[di + 2]
	mov word ptr es:[di], offset trat_0
	mov es:[di + 2], cs
	div bx
	sub bx, bx
revenire:
	pop es:[di + 2]
	pop es:[di]
	pop cx
	pop di
	pop es
	ret
trat_0 proc far
	push bp
	mov bp, sp
	mov word ptr [bp + 2], offset revenire
	push ax
	mov ax, dx
	sub dx, dx
	div bx
	pop cx
	push ax
	mov ax, cx
	div bx
	pop bx
	pop bp
	iret
trat_0 endp
divc endp
start:
	mov ax, @data
	mov ds, ax
	mov ax, word ptr demp
	mov dx, word ptr demp + 2
	mov bx, imp
	call divc
	mov word ptr cat, ax
	mov word ptr cat + 2, bx
	mov rest, dx
	mov ah, 4Ch
	int 21h
end start

end start