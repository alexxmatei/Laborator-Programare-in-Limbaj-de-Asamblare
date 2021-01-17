.model small
.stack 100
.data
	;nrHex dw 0AAAAh (does not work for hex letters)
  nrHex dw 05555h
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov cx, 4
		mov dx, 0
		mov bx, 16
		mov ax, nrHex
	salvareCifre:
		div bx
		push dx
		LOOP salvareCifre
		mov cx, 4
		mov bx, 0Ah
	extragereNrZecimale:
		pop ax
		div bl
		mov dl, al
		mov bh, ah
		add dl, 30h
		mov ah, 02h
		cmp dl, 30h
		jz skip
		int 21h
		skip:
		mov dl, bh
		add dl, 30h
		mov ah, 02h
		int 21h
		LOOP extragereNrZecimale
	afisare:
		
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end program