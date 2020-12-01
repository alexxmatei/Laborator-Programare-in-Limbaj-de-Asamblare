.model small
.stack 100
.data
	tabc db '0123456789ABCDEF' 
.code
	; muta adresa de segment a datelor data de directiva @data in registrul DS
	initializare:
		mov ax, @data
		mov ds, ax
		mov al, 0			; initializeaza AL
	start:
	repet:
		mov bx, offset tabc	; pune in BX adresa efectiva tabc
		push ax				; salveaza AL in stiva
		xlat				; pune in AL octetul de la adresa efectiva [BX + AL]
		call afisare		; apelul procedurii afisare
		pop ax
		inc al
		cmp al, 10h			; se verifica daca s-au afisat toate caracterele
		jz sfarsit			
		jmp repet
	afisare proc
		mov dl, al			; pune in DL codul caracterului care trebuie afisat
		mov ah, 2h			; functa DOS pentru afisarea caracterului din DL
		int 21h				
		mov dl, ' '
		mov ah, 2h
		int 21h
		ret
	afisare endp
	sfarsit:
		mov ah, 4ch			; functia DOS de iesire in sistemul de operare
		int 21h
end