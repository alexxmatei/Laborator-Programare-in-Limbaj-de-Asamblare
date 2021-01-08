.model small
.stack 100
.data
	sursa db 'kek'
	dest  db 3 dup (?)
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
		mov es, ax
		cld
		lea si, sursa	
		lea di, dest
		mov cx, 3
	start:
		rep movsb
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program