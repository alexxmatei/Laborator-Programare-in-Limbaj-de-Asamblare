.model small
.stack 100
.data
	sir1 db '1234567890123', 0
	sir2 db '3210987654321', 0
	rezLen equ $-sir2
	sirRez db rezLen-1 dup(?)
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
		mov es, ax
		lea si, sir1
		mov di, 0
		mov cx, rezLen
	start:
		mov bx, size sir1
		;mov bx, [si]
		;cmp byte ptr [si], 0
		;je sfarsit
		lodsb
		sub al, '0'
		mov bl, sir2[di]
		sub bl, '0'
		add al, bl
		daa
		mov sirRez[di], al
		inc di
		loop start
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program