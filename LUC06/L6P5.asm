arie_dreptunghi MACRO dr
	mov ah, 0
	mov al, dr.latime
	mul dr.lungime
ENDM


.model small
.stack 100
.data
	dreptunghi STRUC
		latime db 100
		lungime dw 400
	dreptunghi ENDS
	d1 dreptunghi <, 500>
	d2 dreptunghi <200, >
	d3 dreptunghi <255, 65535>
.code
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov ah, 0
		mov al, d1.latime
		mul d1.lungime
		mov ah, 0
		mov al, d2.latime
		mul d2.lungime
		int 3z
		mov ah, 0
		mov al, d3.latime
		mul d3.lungime
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program