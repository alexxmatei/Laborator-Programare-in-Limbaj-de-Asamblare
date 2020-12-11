.model small
.stack 100
.data
	var1 dw 11h
	var2 db 0BDh
	tabc db '10757'
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
		mov ax, 4Ch     ; functia DOS de iesire din program
		int 21h
end program