.model small
.stack 100
.data

.code
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		; functia DOS pentru stocarea caracterului
		; citit de la tastatura in registrul AL
		mov al, 01h
		int 21h
		mov bl, al		; salvam caracterul citit de la tastatura
		
		; functia DOS pentru afişarea caracterului din DL 
		mov ah, 02h
		; afisarea caracterului 10 decimal (sau A hexa)
		; acest caracter reprezinta o linie noua (newline)
		mov dl, 10		
		int 21h
		
		; functia DOS pentru afişarea caracterului din DL 
		mov ah, 02h
		mov dl, bl		; incarcam valoarea citita de la tastatura in DL
		int 21h
		
	; iesire din program
	sfarsit:
		mov ah, 4ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end

