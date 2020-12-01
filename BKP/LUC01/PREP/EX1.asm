.model small
.stack 100h

.data
	; msg	db	'Hello world!$'
	; heart db 64 dup(3)
	v dw 0A000h
.code
start:
	mov ax, @data
	mov ds, ax
	mov bx, v
	mov bl, [100]
	mov bx, offset v
	mov cx, [bx]
	mov ax, 4C00h
	int 21h
end start