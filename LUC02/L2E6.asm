.model small
.stack 100
.data

.code
	; Muta adresa segmentului de date in DS
	start:
		mov ax, @data
		mov ds, ax
		mov al, si     
		mov ds, es     
		mov ax, ip     
		mov bl, al     
		mov cs, 23H    
	sfarsit: 
		mov ax, 4Ch    ; Functia DOS de iesire in sistemul de operare
		int 21h
	end start