.model small
.stack 100
.data
	sir db '123456.89'
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
		mov es, ax
		cld
		lea di, sir
		mov cx, 9
		mov al, '.'
	start:
		repnz scasb
		sub di, offset sir
		add di, '0'
		mov dx, di
		mov ah, 02h
		int 21h
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program