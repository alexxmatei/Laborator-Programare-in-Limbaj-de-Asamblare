.model small
.stack 100
.data
	sir1 db '123456.89'
	sir2 db '123456789'
	ptr_str1 dd sir1, sir2
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
		mov es, ax
		lea si, sir1
		lea di, sir2
		mov cx, 0
	start:
	compara:
		inc cx
		lodsb            ;Load String (Byte) DS:SI -> AL
		scasb            ;Scan String (Byte) AL -  ES:DI
		jnz sfarsit
		jmp compara
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program