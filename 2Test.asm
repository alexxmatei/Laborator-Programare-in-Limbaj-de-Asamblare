.model small
.stack 100
.data
	sir1 db '123456.89'
	sir2 db '123456789'
	ptr_str1 dd sir1, sir2
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
		mov es, ax
		mov si, offset sir1
		mov di, offset sir2
		lea si, sir1
		lds si, ptr_str1
		les si, ptr_str1+4
		lea di, sir2
		mov ax, word ptr sir1
		;mov bx, 0
		;mov si, sir1[bx]
		;mov di, [sir2]
	start:
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program