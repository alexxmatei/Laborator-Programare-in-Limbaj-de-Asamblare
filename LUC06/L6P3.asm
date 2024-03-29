afisare_cifra MACRO a
	mov dl, a    ; cifra de afisat
	add dl, 30h  ; caracterul ASCII al cifrei
	mov ah, 2h   ; afisare caracter ASCII
	int 21h
ENDM

afisare_ch MACRO a
	mov dl, a    ; cifra de afisat
	mov ah, 2h   ; afisare caracter ASCII
	int 21h
ENDM

exit_dos MACRO
	mov ah, 4Ch     ; functia DOS de iesire din program
	int 21h
ENDM
	
citire_ch macro
	mov ah, 07h
	int 21h
ENDM
	
cautare_ch MACRO sir, lungime_sir
	lea di, sir     ; DI = adresa sirului
	cld
	citire_ch
	;mov al, 's'     ; litera cautata
	mov cx, lungime_sir
	; repeta cat timp nu este egal sau pana c = 0
	repne scasb
	mov ax, lungime_sir
	; index litera = lung - contor
	sub ax, cx
ENDM

.model small
.stack 100
.data
	sir db 'asamblare'
	lungime_sir equ $-sir
	sir2 db 'Introduceti litera cautata:', 0
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov es, ax
		mov ds, ax
	start:
		lea si, sir2
		lea di, sir2
	comparare:
		mov al, 0
		scasb
		lodsb
		jnz afisareLitera
		jmp sirParcurs
	afisareLitera:
		afisare_ch al
		jmp comparare
	sirParcurs:
		cautare_ch sir, lungime_sir
		afisare_cifra al
		exit_dos
end program