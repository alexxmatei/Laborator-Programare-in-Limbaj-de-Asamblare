.model small
.stack 100h
.data
numar dw 8 
rezultat dd ?
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
	mov ax,1
	mov bx,1
	mov cx,numar
iarasi:
	inc bx
	cmp bx,cx
	ja sfarsit
	mul bx
	jmp iarasi
sfarsit:
	mov bx,10
	mov si,0
conversie:
	div bx
	mov byte ptr rezultat[si],dl
	mov dx,0
	inc si
	cmp ax,bx
	ja conversie
	mov byte ptr rezultat[si],al
repet:
	mov dl,byte ptr rezultat[si]
	call afisare
	dec si
	cmp si,0
	jns repet
	mov ah,4ch
	int 21h
	end start