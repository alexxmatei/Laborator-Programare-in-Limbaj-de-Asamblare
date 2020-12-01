.model small
.stack 100
.data
	a dd 145A789FH
	b dd 92457ABCH
	rez dd ?
	saispe dw 16
	tabc db '0123456789ABCDEF'
.code
start: 
	mov ax,@data
	mov ds,ax
	
	mov ax,word ptr a
	add ax,word ptr b
	mov word ptr rez,ax
	
	mov ax,word ptr a+2
	adc ax,word ptr b+2
	mov word ptr rez+2,ax
	
	mov cl,0 ;contor pt cuvantul afisare

	mov dx,0
	mov ax, word ptr rez   ;punem ultimele 4 cifre in ordine inversa
	div saispe
	push dx	
	div saispe
	push dx
	div saispe
	push dx
	div saispe
	push dx         
	mov ax,word ptr rez+2  ;punem si primele 4 cifre in ordine inversa
	div saispe
	push dx	
	div saispe
	push dx
	div saispe
	push dx
	div saispe
	push dx               

	
afis:      ;avem cifrele in ordine inversa in stiva, trebuie doar sa dam pop si sa afisam una cate una
	pop dx
	mov al,dl       
	mov bx,offset tabc
	xlat       ;pune in al, ce se afla la [bx+al] (codul ascii al caracterului care trebuie afisat)
	mov dl,al  
	mov ah,02h
	int 21h
	inc cl
	cmp cl,8
	jz sfarsit
	jmp afis
		
	
sfarsit:
	mov ax,4c00h
	int 21h
end start
