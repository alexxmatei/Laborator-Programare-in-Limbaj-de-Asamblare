.model small
.stack 100
.data
	numar dw 8
	rez   dd ?

.code
afisare proc
	add dl, '0'
	mov ah, 2h
	int 21h
	ret
afisare endp

start:
	mov ax, @data
	mov ds, ax
	mov ax, 1
	mov bx, 1
	mov cx, numar

iar: inc bx
	cmp bx, cx
	ja sfarsit
	mul bx
	jmp iar 
 
sfarsit:
	mov bx, 10
	mov si, 0

hextodec:
	div bx
	mov byte ptr rez[si], dl
	mov dx, 0
	inc si
	cmp ax, bx 
	ja hextodec	
	mov byte ptr rez[si], al

repet:
	mov dl, byte ptr rez[si]
	call afisare
	dec si
	cmp si, 0
	jns repet
	mov ah, 4Ch
	int 21h
end start



