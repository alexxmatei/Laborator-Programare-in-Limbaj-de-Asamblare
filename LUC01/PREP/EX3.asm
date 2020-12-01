.model small
.stack 100h
.data
	tab	dw	1234h, 5678h, 90ABh
.code
start:
	mov ax, @data
	mov ds, ax
	mov bx, 3
	mov ax, [bx][si]
	mov ax, [bx + si + 3]
	mov ax, [bx + si].3
	mov ax, [bx][di][3]
	mov ax, ds:[bp + 3]     ; adresare bazata
	mov ax, cs:[si][bx + 3] ; adresare bazata si indexata
	mov ax, ss:[bx]         ; adresare indirecta
	mov ax, 4C00h
	int 21h
end start

