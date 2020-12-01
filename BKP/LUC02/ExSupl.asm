.model small
.stack 100
.data
	var1 	db 	0Fh, 0FFH, 15, 15d, 255, 00001111b, 11111111b, 017o, 277o
	var2 	dw 	0ABA3h, 0BA3h
.code
	start:  	
		mov ax, @data
		mov ds, ax
		mov al, var1	     		
		mov bl, var1+2
		mov cl, var1+3	     		
		mov dl, var1+5
		mov dl, var1+7
		mov al, var1+1	     		
		mov bl, var1+4
		mov cl, var1+6	     		
		mov dl, var1+8
		mov ax, var2
		mov ax, var2+2
		mov ax, var2+1
		mov bx, var2+1
		mov bx, var2+2
		mov cx, var2+3
		mov bx, offset var1
		mov cx, [bx]
		mov dx, [bx+1]
		mov bx, offset var2
		mov cx, [bx]
		mov dx, [bx+1]
		mov si, offset var2
		mov cx, [si]
		mov dx, [si+1]
		mov ax, 1234H
		push ax
		push ax
		mov bp, sp
		mov cx, [bp]
		mov dx, [bp+1]
		mov bx, offset var2
		mov si, 1
		mov dx, [bx+si]
		mov dx, [bx+si+1]
		mov dx, [bx][si][1]
		mov     ah, 4ch
		int        21h
	end start