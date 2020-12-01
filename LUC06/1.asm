.model small
.stack 100
data1 SEGMENT BYTE
	v1 db 55h
data1 ENDS

data2 SEGMENT WORD
	v2 dw 1111h
	v3 dw 50 dup(?)
data2 ENDS 

data3 SEGMENT
	v4 dd 2222h
data3 ENDS

dgrup GROUP data1, data2, data3
cod SEGMENT
	ASSUME CS: cod, DS: dgrup, ES: data3
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, data1
		mov ds, ax
		mov ax, v2
		mov bx, data3
		mov es, bx
		mov bx, v3
	start:
	
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
cod ENDS
end program