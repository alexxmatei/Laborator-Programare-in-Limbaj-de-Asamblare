.model small
.stack 100h
.data
	x db 10
	y db 15
	adr_x dd x ; adr_x este adresa valorii x (pointer)
	adr_y dd y ; adr_y este adresa valorii y (pointer)
.code
	start:
		; Muta adresa datelor in segmentul de date
		mov ax, @data
		mov ds, ax
		;
		lds si, adr_x
		les di, adr_y
		mov byte ptr [si], 20
		mov byte ptr es:[di], 30
		; Sfarsit program
		mov ax, 4C00h
		int 21h
		;
	end start