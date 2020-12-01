.model small
.stack 100
.data
	
; Care  este  conţinutul  registrului AL  după  executarea  
; următoarei secvenţe de instrucţiuni ?
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov al, 'A'
		mov bl, 'B'
		cmp al, bl
		jne et1
	et2: 
		mov al, 1
		jmp sfarsit
	et1:
		mov al, 0
		jmp sfarsit
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end program

; A: AL = 0