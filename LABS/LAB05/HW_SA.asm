.model small  
.stack 100  
.data  
  
.code  
start:  
 mov ax, @data  
 mov ds, ax  
 
	mov ah, 01H
	int 21H
	mov ah, 02H
	mov dl,al
	int 21h  
end start