.model small
.stack 100
data1 SEGMENT BYTE
	var1 db 55h
data1 ENDS
data2 SEGMENT WORD
	var2 dw 1111h
	var3 dw 50 dup (?)
data2 ENDS 
data3 SEGMENT
	var4 dd 2222h
data3 ENDS
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, data1
		mov ds, ax
		mov al, var1
	start:
	
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program