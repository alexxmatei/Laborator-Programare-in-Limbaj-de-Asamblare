.model small
.stack 100
.data
.code
	start:
	; Muta adresa segmentului de date in registrul DS
	initializare:
		mov ax, @data
		mov ds, ax
	cod:
		mov al, 0
		; cerere input
		mov ah, 1  
		int 21h
		mov ah, 1  
		int 21h
		mov dl, 15
		; initializare ax
		mov ax, 0
		; initializare cl
		mov cl, 0
	repet:
		add ax, dx
		inc cl
		cmp cl, dl
			; Se verifica daca s-au afisat toate caracterele
		jz nrOfHundreds
		jmp repet
	nrOfHundreds:
		mov ah, 0
		mov dl, al  
		mov cl, 0
		repetaScadere100:
		sub al, 64h
		jc nrOfTens; jump if carry
		inc cl
		jmp repetaScadere100
	nrOfTens:
		add al, 64h
		mov bh, cl
		mov cl, 0
		repetaScadere10:
		sub al, 0Ah
		jc nrOfDigits; jump if carry
		inc cl
		jmp repetaScadere10
	nrOfDigits:
		add al, 0Ah
		mov bl, cl
		mov cl, 0
		repetaScadere1:
		sub al, 01
		jc sfarsit; jump if carry
		inc cl
		jmp repetaScadere1
			; Pune in DL codul caracterului ce trebuie afisat
		mov ah, 2h
			; Functia DOS pentru afisarea caracterului din DL
		int 21h
		
	sfarsit: 
	call afisare
		mov ax, 4C00h   ; Functia DOS de iesire in sistemul de operare
		int 21h
	afisare proc
		add bh, 30h
		cmp bh, 30h
		jz displayTens
		mov dl, bh    
			; Pune in DL codul caracterului ce trebuie afisat
		mov ah, 2h
		int 21h
		displayTens:
		add bl, 30h
		cmp bl, 30h
		jz displayDigits
		mov dl, bl    
			; Pune in DL codul caracterului ce trebuie afisat
		mov ah, 2h
			; Functia DOS pentru afisarea caracterului din DL
		int 21h
		displayDigits:
		add cl, 30h
		mov dl, cl    
			; Pune in DL codul caracterului ce trebuie afisat
		mov ah, 2h
		int 21h
		ret
	afisare endp
	end start