.model small
.stack 100
.data
	base_16 dw 16
	x dd 145A789Fh
	y dd 92457ABCH
	res dd ? ;A69F F35B
	tabc db '0123456789ABCDEF'
.code
start: 
	mov ax, @data
	mov ds, ax
	
	;aduc primul operand in ax si bx 
	mov ax, word ptr x
	mov bx, word ptr x+2
	
	;aduc al doilea operand in cx si dx
	mov cx, word ptr y
	mov dx, word ptr y+2
	
	;efectuez adunarea
	add ax, cx
	adc bx, dx
	
	;stochez rezultatul in variabila res pe 32 biti 
	mov word ptr res, ax
	mov word ptr res+2, bx
	
	;printare primul numar pe 16 biti
	mov ax, word ptr res+2
	LEA bx, tabc
	
	
	
	xor  cx, cx   


	repeat_loop:
		xor  dx, dx
		div  base_16
		push dx                 ;push remainder in stiva -> nr%16 ultima cifra
		inc  cx                 ;counter++
		test ax, ax
		jnz  repeat_loop 


	print_char:
		pop  ax
		xlat
		mov dx, ax
		mov  ah, 02h            
		int  21h
    loop print_char
	
	;printare al doilea numar pe 16 biti
	mov ax, word ptr res
	
	xor  cx, cx   


	repeat_loop1:
		xor  dx, dx
		div  base_16
		push dx                 ;push remainder in stiva -> nr%16 ultima cifra
		inc  cx                 ;counter++
		test ax, ax
		jnz  repeat_loop1 


	print_char1:
		pop  ax
		xlat
		mov dx, ax
		mov  ah, 02h            
		int  21h
    loop print_char1


	mov ah, 4ch
	int 21h
end start




















