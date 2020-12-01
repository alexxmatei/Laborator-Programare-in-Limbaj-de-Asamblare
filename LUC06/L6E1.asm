.model small
.stack 100
data1 SEGMENT BYTE
	v1 db 5
data1 ENDS

data2 SEGMENT WORD
	v2 dw 25
data2 ENDS 

data3 SEGMENT
	v3 dw 100
data3 ENDS
data4 SEGMENT PAGE
	v4 db 'kek1'
data4 ENDS
data5 SEGMENT PAGE
	v5 db 'kek2'
data5 ENDS
dgrup GROUP data1, data2
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