.model small 
.stack 100 
.data     
	demp dd 44444444h     
	imp dw 1111h     
	cat dd ?     
	rest dw ? 
.code
start: 
	mov ax, @data
	mov ds, ax
end start