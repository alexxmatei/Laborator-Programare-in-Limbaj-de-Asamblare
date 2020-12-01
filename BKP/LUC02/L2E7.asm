.model small
.stack 100
.data
	alfa db 14h
	tabel db 0A1h, 10, 0AFh, 23o, 1111b, 0011b
.code
	; Muta adresa segmentului de date in registrul DS
	start:
		mov ax, @data
		mov ds, ax
		lea bx, tabel
		mov si, 3
		mov al, [bx][si]
		; Raspuns - In al se va stoca valoarea 23o, adica 13h
	sfarsit:
		mov ah, 4Ch      ; Functia DOS de iesire din sistemul de operare
		int 21h
	end start