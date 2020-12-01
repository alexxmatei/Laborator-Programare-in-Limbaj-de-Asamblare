adunare32Biti MACRO adr1, adr2, adrRez
	mov ax, word ptr [adr1]
	add ax, word ptr [adr2]
	mov word ptr [adrRez], ax
	mov ax, word ptr [adr1 + 2]
	adc ax, word ptr [adr2 + 2]
	mov word ptr [adrRez + 2], ax
ENDM

.model small
.stack 100
.data
	nr1 dd 0000FFFFh
	nr2 dd 00000001h
	rez1 dd ?
	nr3 db 
	nr4 db 
	rez2 dd ?
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		adunare32Biti nr1, nr2, rez
		;adunare32Biti ax, bx 
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program