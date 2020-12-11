.model small 
.stack 100 
.data     
	demp dd 44444444h     
	imp dw 1111h     
	cat dd ?     
	rest dw ? 
.code
;proc. primeste deimpartitul in (DX, AX) 
;si impartitorul in BX 
;returneaza catul in (BX, AX) si restul in DX
divc proc     
	cmp bx, 0      ;daca eroare adevarata     
	jnz divc1     
	int 0   
  divc1:
	push es        ;salvare registre modificate de procedura
	push di
	push cx
	pop ax
	pop bx
	pop cx
	mov di, 0
	mov es, di     ;adresa pt. intrarea intrerupere nivel 0
	push es:[di]   ;salvare adresa oficiala     
	push es:[di+2] 
	mov word ptr es:[di], offset trat_0  ;incarcare vector 
	mov es:[di+2],cs ;intrerupere pt. noua rutina de tratare 
	div bx         ;incercare executie instr. de impartire
	               ;nu a aparut eroare 
	sub bx, bx     ;daca impartirea s-a executat corect se
	               ;pune 0 in bx ca sa corespunda modului de
	               ;transmitere al parametrilor
  revenire:
	pop es:[di+2]
	pop es:[di]
	pop cx
	pop di
	pop es
	ret 
	trat_0 proc far
		push bp    ;salvare bp
		;int 3
		mov bp, sp ;schimba adresa de revenire din rutina
		           ;trat_0, adresa care se gaseste in stiva
		           ;a fost pusa in stiva la apelarea rutinei
		           ;de intrerupere (IP-ul)
		mov word ptr [bp+2], offset revenire
		push ax    ;salvare ax, Y0
		mov ax, dx ;primul deimpartit Y1
		sub dx, dx ;executie impartire Y1 la X
		           ;rezulta (AX) = Q1, (DX) = R1
		div bx
		pop cx     ;Y0
		push ax    ;salvare Q1
		mov ax, cx ;executie impartire (R1, AX) la X
		           ;rezulta AX=Q0, DX=R0
		div bx
		pop bx     ;Q1
		pop bp
		iret
	trat_0  endp 
divc endp

start: 
	mov ax, @data
	mov ds, ax
	mov ax, word ptr demp
	mov dx, word ptr demp+2
	mov bx, imp
	call divc
	mov word ptr cat, ax
	mov word ptr cat+2, bx
	mov rest, dx
	mov ah, 4ch
	int 21h
end start