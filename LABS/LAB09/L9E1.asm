arie_dreptunghi MACRO dreptunghi
...
...
...
...
endm

.model small
.stack 100
.data
	dreptunghi struc
		latime db 100
		lungimea dw 400
	dreptunghi ends
	d1 dreptunghi < , 500>
	d2 dreptunghi <200, >
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		arie_dreptunghi d1
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program