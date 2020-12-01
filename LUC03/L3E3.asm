.model small
.stack 100
.data
	
.code
	; muta adresa segmentului de date in DS
	initializare:
		MOV ax, @data
		MOV ds, ax
	start:
	instructiunea_NOT:
		; NOT - Negare logica
		; NOT dest
		MOV ax, 1010101011111111b
		NOT ax
	instructiunea_AND:
		; AND - SI logic
		; AND dest, sursa
		MOV ax, 1010101001010101b
		MOV bx, 1111000011110000b
		AND ax, bx
	instructiunea_TEST:
		; TEST 
		; TEST dest, sursa
		; Executa (dest AND sursa) fara a modifica operanzii
		; insa se modifica bistabilii de conditie (FLAGS)
		MOV ax, 1010101001010101b
		MOV bx, 1111000011110000b
		MOV dx, 0h
		PUSH dx
		POPF
		TEST ax, bx
	instructiunea_OR:
		; OR - SAU logic
		; OR dest, sursa
		MOV ax, 1010101001010101b
		MOV bx, 1111000011110000b
		OR  ax, bx
	instructiunea_XOR:
		; XOR - SAU Exclusiv logic
		; XOR dest, sursa
		MOV ax, 1010101001010101b
		MOV bx, 1111000011110000b
		XOR  ax, bx
	instructiunile_de_shiftare_si_rotire:
		; Aceste instructiuni utilizeaza un contor pentru 
		; a indica de cate ori sa se repete operatia 
		; (de shiftare sau rotire)
		
		; Toate au urmatoarea forma:
		; OP operand, contor
		; Unde OP - operatia (de shiftare sau rotire)
	instructiunea_SHL:
		; SHL - Shift Logic Left - Shiftare logica la stanga
	instructiunea_SAL:
		; SAL - Shift Aritmetic Left - 
		;       Shiftare aritmetica la stanga
		; Bitul cel mai semnificativ trece in CF, dupa care 
		; toti bitii se deplaseaza la stanga cu o pozitie. 
		; Bitul cel mai putin semnificativ devine 0.
		MOV al, 11111111b
		SHL al, 2
		SAL al, 2
		MOV al, 00000001b
		bucla_shiftare_stanga:
			SHL al, 1
			cmp al, 80h
		jnz bucla_shiftare_stanga
	instructiunea_SHR:
		; SHR - Shift Logic Right - Shiftare logica la dreapta
		; Bitul cel mai putin semnificativ trece in CF,
		; toti bitii se deplaseaza la dreapta cu o pozitie
		; bitul cel mai semnificativ devine 0.
		MOV al, 11111111b
		SHR al, 4
		MOV al, 10000000b
		bucla_shiftare_logica_dreapta:
			SHR al, 1
			cmp al, 01h
		jnz bucla_shiftare_logica_dreapta
	instructiunea_SAR:
		; SAR - Shift Aritmetic Right - Shiftare aritmetica
        ;                               la dreapta
		; Singura diferenta fata de SHR este ca 
		; bitul de semn ramane neschimbat
		MOV al, 10000000b
		bucla1_shiftare_aritmetica_dreapta:
			SAR al, 1
			cmp al, 0FFh
		jnz bucla1_shiftare_aritmetica_dreapta
		MOV al, 01000000b
		bucla2_shiftare_aritmetica_dreapta:
			SAR al, 1
			cmp al, 01h
		jnz bucla2_shiftare_aritmetica_dreapta
	instructiunea_ROL:
		; ROL - Rotate Left - Rotire la Stanga
		; Se deplaseaza toti bitii la stanga cu o pozitie.
		; Bitul cel mai semnificativ trece atat in CF, 
		; cat si in bitul cel mai putin semnificativ
		MOV al, 01h
		bucla_rotire_stanga:
			ROL al, 1
			cmp al, 01h
		jnz bucla_rotire_stanga
	instructiunea_RCL:
		; RCL - Rotate Left through Carry -
		;       Rotire la Stanga prin bitul de Carry
		; Se deplaseaza toti bitii la stanga cu o pozitie.
		; CF trece in bitul cel mai putin semnificativ, 
		; bitul cel mai semnificativ trece in CF
		MOV al, 01h
		bucla_rotire_stanga_prin_CF:
			RCL al, 1
			cmp al, 01h
		jnz bucla_rotire_stanga_prin_CF
	instructiunea_ROR:
		; ROL - Rotate Right - Rotire la Dreapta
		; Se deplaseaza toti bitii la dreapta cu o pozitie.
		; Bitul cel mai semnificativ trece atat in CF, 
		; cat si in bitul cel mai putin semnificativ
		MOV al, 80h
		bucla_rotire_dreapta:
			ROR al, 1
			cmp al, 80h
		jnz bucla_rotire_dreapta
	instructiunea_RCR:
		MOV al, 80h
		bucla_rotire_dreapta_prin_CF:
			RCR al, 3
			test al, 80h
		jz bucla_rotire_dreapta_prin_CF
		; RCL - Rotate Right through Carry - 
		;       Rotire la Dreapta prin bitul de Carry
		; Se deplaseaza toti bitii la dreapta cu o pozitie.
		; CF trece in bitul cel mai semnificativ, 
		; bitul cel mai putin semnificativ trece in CF		
	; iesire din program
	sfarsit:
		MOV ah, 4ch     ; functia DOS de iesire 
		                ; in sistemul de operare
		INT 21h
end