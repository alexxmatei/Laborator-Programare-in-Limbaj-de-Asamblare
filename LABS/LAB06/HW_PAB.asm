.model small
.stack 100
.data
	numar dw 00FFh
	rez dd ?
.code
afisare proc 
	add dl,'0'
	mov ah,2h
	int 21h
	ret
afisare endp
start:
	mov ax,@data
	mov ds,ax
	mov bx,10
	mov si, 0
	mov dx, 0
conv:
	div bx
	mov byte ptr rez[si],dl
	mov dx,0
	inc si
	cmp ax,bx
	ja conv
	mov byte ptr rez[si],al
repet:
	mov dl,byte ptr rez[si]
	call afisare
	dec si
	cmp si,0
	jns repet
	mov ah,4ch
	int 21h
end start