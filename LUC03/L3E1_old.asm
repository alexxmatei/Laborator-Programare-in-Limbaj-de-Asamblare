.model small
.stack 100
.data
	
.code
	; muta adresa segmentului de date in DS
	initializare:
		MOV ax, @data
		MOV ds, ax
	start:
	instructiunea_ADD:
	; MOV al, 0FFh
	; MOV bl, 0
	; bucla_flag_test:
	; CMP al, bl
	; INC bl
	; JMP bucla_flag_test
		; ADD - aduna
		; ADD dest, sursa
		; dest <- dest + sursa
		MOV ax, 02h;
		MOV bx, 05h;
		ADD ax, bx;       ; AX = AX(02h) + BX(05h) => AX = 07h
	instructiunea_ADC:
		MOV ax, 0FFh;
		MOV bx, 1;
		; ADC (ADD with Carry)
		; ADC dest, sursa
		; dest <- dest + sursa + CF (Carry Flag)
		ADC ax, bx
		MOV ax, 0FFh;
		MOV bx, 2;
		; ADC (ADD with Carry)
		; ADC dest, sursa
		; dest <- dest + sursa + CF (Carry Flag)
		ADC al, Bl
		ADC al, 0
		ADC al, 0
	instructiunea_INC:
		; INC (Increment) - incrementeaza
		; INC dest
		; INC dest <- dest + 1
		INC dl
		INC dl
		INC dl
	instructiunea_DAA:
		; DAA (Decimal Adjust for Addition)
		;  - corectie zecimala a acumulatorului AL, 
		;    dupa adunare de tip BCD impachetat
		MOV ax, 19h
		MOV bx, 12h
		ADD ax, bx
		DAA
		MOV ax, 19h
		MOV bx, 12h
		ADD bx, ax
		DAA
	instructiunea_AAA:
		; AAA (ASCII Adjust for Addition)
		;  - corectie zecimala a acumulatorului AX, 
		;    dupa adunare de tip BCD despachetat
		MOV ax, 0109h
		MOV bx, 0102h
		ADD ax, bx
		AAA
	instructiunea_SUB:
		; SUB (Substract) - Scadere
		; SUB dest, sursa
		; dest <- dest - sursa
		MOV ax, 0007h
		MOV bx, 0005h
		SUB ax, bx
		MOV ax, 0001h
		MOV bx, 0001h
		SUB ax, bx
		SUB ax, bx
	instructiunea_SBB:
		; SBB (Substract with Borrow)
		; SUB dest, sursa
		; dest <- dest - sursa - CFG
		MOV ax, 0001h
		MOV bx, 0001h
		SBB ax, bx
		SBB ax, bx
		SBB ax, bx
		SBB ax, bx
	instructiunea_DEC:
		; DEC (Decrement)
		; DEC dest
		; dest <- dest - 1
		MOV ax, 3h
		DEC ax
		DEC ax
		DEC ax
		DEC ax
	instructiunea_NEG:
		; NEG (Negate) - Negare
		; NEG dest
		MOV ax, 59
		; dest <- 0 - dest
		NEG al
		NEG ax
	instructiunea_CMP:
		; CMP (Compare) - Compara
		; CMP dest, sursa
		; Executa (dest - sursa) fara a modifica operanzii
		; insa se modifica bistabilii de conditie (FLAGS)
		MOV ax, 58h
		CMP ax, 58h
	instructiunea_DAS:
		; DAS (Decimal Adjust for Substraction)
		;  - corectie zecimala a acumulatorului AL, 
		;    dupa scadere de tip BCD impachetat
		MOV ax, 32h
		MOV bx, 14h
		SUB ax, bx
		DAS
	instructiunea_AAS:
		; AAS (ASCII Adjust for Substraction)
		;  - corectie zecimala a acumulatorului AX, 
		;    dupa scadere de tip BCD despachetat
		MOV ax, 0302h
		MOV bx, 0104h
		SUB ax, bx
		AAS
	; iesire din program
	sfarsit:
		MOV ah, 4ch     ; functia DOS de iesire 
		                ; in sistemul de operare
		INT 21h
end