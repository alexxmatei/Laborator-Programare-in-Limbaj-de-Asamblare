.model small
.stack 100
.data
	sir1 db 'sir'
	lenSir1 equ $-sir1
	sir2 db 'sirinaltsirinaltsirinaltsirinaltsirinaltsir', 0
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
		mov es, ax
		lea si, sir1
		lea di, sir2
		CLD
		
		mov dx, lenSir1
		
	start:
		cmp byte ptr [di], 0
		jz afisare
		mov cx, 0
		lea si, sir1
		lodsb            ;Load String (Byte) DS:SI -> AL
	compara:
		scasb            ;Scan String (Byte) AL -  ES:DI
		jne compara
	verificareSubsir:
		inc cx
		cmp cx, lenSir1
		jz incSubsir
		lodsb            ;Load String (Byte) DS:SI -> AL
		scasb            ;Scan String (Byte) AL -  ES:DI
		je verificareSubsir
	incSubsir:
		cmp bl, 9
		je incBx
		inc bl
		jmp start
	incBX:
		inc bh
		mov bl, 0
	afisare:
		push bx
		call p_afisare
		shr bx, 4
		push bx
		call p_afisare
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
	proc p_afisare
		pop dx
		add dl, '0'
		mov ah, 02h
		int 21h
		ret
	endp p_afisare
end program