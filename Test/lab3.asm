.model small
.stack 100
.data
	a DD 145A789Fh
	b DD 92457ABCh
	c DD ?
.code
	mov AX, @data
	mov DS,AX
	mov AX, word ptr a
	ADD AX, word ptr b
	mov word ptr c, AX
	mov AX, word ptr a[2]
	ADD AX, word ptr b[2]
	mov word ptr c[2], AX
	mov AH, 4Ch
	int 21h
end