.model small
.stack 100
.data
	adr1 dw 1234h
	adr2 dw 5678h
	adr3 dw 9012h
	adr4 dw 3456h
	tabela dd adr1, adr2, adr3, adr4
.code
	start:
		mov ax, @data
		mov ds, ax
		mov cx, 1
		mov bx, cx
		add bx, bx
		add bx, bx
		les di, tabela[bx]
		mov ax, es:[di]
		add bx, 8
		les di, tabela[bx]
		mov ax, es:[di]
		mov ah, 4Ch
		int 21h
	end start