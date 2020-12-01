.model small
.stack 100
.data
	
.code
	; muta adresa segmentului de date in DS
	initializare:
		MOV ax, @data
		MOV ds, ax
		MOV ax, 0h
	start:
	instructiunea_CBW:
		; CBW (Convert Byte to Word)
		; - Extinde bitul de semn din AL 
		;   la intreg registrul AH astfel se obtine 
		;   o reprezentare a lui AX pe 4 octeti
		MOV al, 7Fh;
		CBW
		MOV al, 8Fh;
		CBW
	instructiunea_MUL:
		; MUL (Multiply) - Inmultire
		; MUL sursa
		; AH:AL <- AL * sursa (daca sursa este pe octet)
		; DX:AX <- AX * sursa (daca sursa este pe 2 octeti)
		MOV al, 02h
		MOV bl, 0FFh
		MUL bl
		MOV ax, 02h
		MOV cx, 0FFFFh
		MUL cx
	instructiunea_IMUL:
		; IMUL (Integer Multiply) - Inmultire cu 
		;                           operanzi intregi
		; IMUL sursa
		;  - Se comporta similar cu instructiunea MUL
		
	instructiunea_AAM:
		; AAM (ASCII Adjust for Multiply)
		;  - corectie zecimala a acumulatorului AX, 
		;    dupa inmultire pe 8 biti de tip BCD despachetat
		MOV ax, 5
		MOV bx, 9
		MUL bx
		AAM
	instructiunea_DIV:
		; DIV (Divide) - Impartire
		; DIV sursa
		; Daca sursa este pe octet:
		;     AL <- AX / sursa
		;     AH <- AX % sursa (AX mod sursa)
		; Daca sursa este pe 2 octeti:
		;     AL <- DX:AX / sursa
		;     AH <- DX:AX % sursa (AX mod sursa)
		MOV ax, 8
		MOV bl, 2
		DIV bl
		MOV al, 9
		MOV bl, 2
		DIV bl
		MOV ax, 512
		MOV bx, 4
		DIV bx
		MOV ax, 513
		MOV bx, 4
		DIV bx
		MOV dx, 0     ; De ce e necesara stergerea lui DX ?
		MOV ax, 0FFFFh
		MOV bx,  8000h
		DIV bx
	instructiunea_IDIV:
		; IDIV (Integer Divide) - Impartire cu
        ;                         operanzi intregi
		; IDIV sursa
		;  - Se comporta similar cu instructiunea DIV
	instructiunea_AAD:
		; AAM (ASCII Adjust for Division)
		;  - corectie zecimala a acumulatorului AX, 
		;    INAINTE de impartirea unui numar BCD pe 16 biti 
		;    la un numar BCD pe 8 biti
		MOV ax, 0909h
		MOV bx, 01h
		AAD
		DIV bl
		AAD
	; iesire din program
	sfarsit:
		MOV ah, 4ch     ; functia DOS de iesire 
		                ; in sistemul de operare
		INT 21h
end