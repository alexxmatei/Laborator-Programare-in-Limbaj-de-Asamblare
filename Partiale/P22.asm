.model small
.stack 100
.data
	var1 dw 0B9h
	var2 db 23h
	tabc db 0, '82779'
.code
program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		MOV AX, var1
		MOV BX, WORD PTR var2
		ADD AX, BX
		NOT AX
		MOV AX, 0023h
		PUSH AX
		XOR BX, 01h
		PUSH BX
		XCHG AX, BX
		AND AX, 0Fh	
		SHR AX, 2h	
		CMP AX, 0Ah	
		JLE salt	
		INC BX
		salt: MOV AL, 00h	
		MOV BX, offset tabc	
		XLAT
		POP AX
		POP BX
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program