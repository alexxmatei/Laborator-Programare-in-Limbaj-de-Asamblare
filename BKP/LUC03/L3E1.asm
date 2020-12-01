.model small
.stack 100
.data
	
.code
	; muta adresa segmentului de date in DS
	initializare:
		MOV ax, @data
		MOV ds, ax
	start:
		; MOV ax, 02h;
		; MOV bx, 05h;
	; instructiunea_ADD:
		; ; ADD - aduna
		; ; ADD dest, sursa
		; ; dest <- dest + sursa
		; ADD ax, bx;       ; AX = AX(02h) + BX(05h) => AX = 07h
	; instructiunea_ADC:
		; MOV ax, 0FFh;
		; MOV bx, 1;
		; ; ADC (ADD with Carry)
		; ; ADC dest, sursa
		; ; dest <- dest + sursa + CF (Carry Flag)
		; ADC ax, bx
		; MOV ax, 0FFh;
		; MOV bx, 2;
		; ; ADC (ADD with Carry)
		; ; ADC dest, sursa
		; ; dest <- dest + sursa + CF (Carry Flag)
		; ADC al, Bl
		; ADC al, 0
		; ADC al, 0
	; instructiunea_INC:
		; ; INC (Increment) - incrementeaza
		; ; INC dest
		; ; INC dest <- dest + 1
		; INC dl
		; INC dl
		; INC dl
	; iesire din program
	sfarsit:
		MOV ah, 4ch     ; functia DOS de iesire in sistemul de operare
		INT 21h
end