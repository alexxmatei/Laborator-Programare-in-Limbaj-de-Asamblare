.model small
.stack 100
.data
	tabel  db 1, 2, 3, 4, 5, 10 dup(?) 
	tabel1 dw 1, 2, 3, 12H, 12 
	tabel2 dd 1, 2, 1234H 
	tabel3 dq 1, 2, 12345678H 
	tabel4 dt 1, 2,, 1234567890H
.code
	; muta adresa de segment a datelor data de directiva @data in registrul DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov ax, 14h             ;adresare imediata  
		mov ax, 14   
		mov al, tabel           ;adresare directa  
		mov al, tabel[1]        ;adresare directa
		mov ax, word ptr tabel  ;adresare directa, operatorul                      
		                        ;ptr este necesar, tabel fiind 
		                        ;definit cu directiva DB 
		mov bx, offset tabel
		mov al, [bx+1]          ;adresare indirecta
		mov al, [bx]            ;adresare indirecta  
		mov bx, 5   
		mov al, tabel[bx]       ;adresare bazata
		mov si, 1   
		mov al, [bx][si]        ;adresare bazata si indexată  
		mov si, 6 
		mov byte ptr [bx][si],2 ;adresare bazata si indexată   
		mov bp, offset tabel   
		mov al, [bp]            ;adresare bazata cu deplasament nul 
		;adresare bazată şi indexată 
		mov byte ptr ds:[bp][si][1], 7   
		mov word ptr ds:[bp][si][1], 19H  
	; revenire in sistemul de operare
	sfarsit:
		mov ah, 4ch             ; functia DOS de iesire in sistemul de operare
		int 21h
end