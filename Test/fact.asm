.model small
.stack 100
.data
	numar dw 9
	rez   dd ?
.code
afis proc             ; procedura de afisare a nr aflat in DL 
	add dl, '0'
	mov ah, 2h
	int 21h
	ret
afis endp

start:
	mov ax, @data
	mov ds, ax
	mov ax, 1         ; operand al inmultirii
	mov bx, 1         ; celalalt operand al inmultirii
	mov cx, numar     ; initializare contor
iar: 
	inc bx
	cmp bx, cx        ; s-a ajuns la sfarsit?
	ja sfarsit
	mul bx            ; daca nu inmulteste
	jmp iar 
; se incepe procedura de determinare a cifrelor rezultatului
; prin impartiri la 10 pana se obtine restul <10
sfarsit:
	mov bx, 10
	mov si, 0
sf1:
	div bx
	mov byte ptr rez[si], dl ; s-a memorat cifra m.p.s 
	                         ; a rezultatului
	mov dx, 0         ; deimpartitul este DX:AX
	inc si
	cmp ax, bx 
	ja sf1	
	mov byte ptr rez[si], al ; s-a memorat cifra m.p.s                 
repet:
	mov dl, byte ptr rez[si]
	call afis
	dec si
	cmp si, 0
	jns repet
	mov ah, 4Ch
	int 21h
end start



