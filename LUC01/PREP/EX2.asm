.model small
.stack 100h
.data
	tab	dw	1234h, 5678h, 90ABh
.code
start:
	mov ax, @data
	mov ds, ax
	mov bx, 3
	mov ax, tab[bx]
	mov ax, bx[tab]
	mov ax, [bx+tab]
	mov ax, [bx].tab
	mov ax, [tab].bx
	mov ax, [tab + bx]
	mov ax, [bx][tab]
	mov ax, 4C00h
	int 21h
end start