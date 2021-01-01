.model small
.stack 100
.data
	var db ?
	saispe dw 16
	tabc db '0123456789ABCDEF'
	msj1 db 'Introdu un numar:$'
	msj2 db 'Rezultat mai mare de 16 biti.$'
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		lea dx, msj1
		mov ah,09H
		int 21H
		
		mov dl, 10
		mov ah, 02h
		int 21h
		
		mov ah, 01h
		int 21h
		mov bl, al
		
		mov dl, 10
		mov ah, 02h
		int 21h
		
		mov al, bl
		sub al, 30h
		mov byte ptr var, al
		mov cl, var
		mov ax, 1
	calc_fact:
		MUL cx
		JC caz_overflow
		LOOP calc_fact
		mov cx, 4
	salvare_in_stiva:
		MOV dx, 0
		DIV saispe
		push dx
		LOOP salvare_in_stiva
		mov cx, 4
		mov bl, offset tabc
	afisare:
		pop dx
		mov al, dl
		xlat
		mov dl, al
		mov ah, 02h
		int 21h
		LOOP afisare
		JMP sfarsit
	caz_overflow:
		lea dx, msj2
		mov ah, 09h
		int 21H
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end program