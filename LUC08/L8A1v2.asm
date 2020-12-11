.model small
.stack 100
.data
	sir1 db 'Introduceti 4 cifre:$'
	nr  dd ?
	rezultat db ?
.code
	program:
	numara proc near
		push bp
		mov bp, sp
		mov di, [bp + 4]
		mov al, byte ptr [nr + di]
		bucla:
			cmp al, 0
			jz sfarsit_numara
			shl al, 1
			adc rezultat, 0
			jmp bucla
		sfarsit_numara:
			pop bp
			ret
	numara endp
	citire_ch proc near
		mov ah, 1
		int 21h
		sub al, 30h ;'0'
		ret
	citire_ch endp
	initializare:
		mov ax, @data
		mov ds, ax
		mov cx, 4
	start:
		call citire_ch
		mov bx, cx
		mov byte ptr nr[bx - 1], al
		loop start
		mov al, 0
		push 0
		call numara
		push 1
		call numara
		push 2
		call numara
		push 3
		call numara
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end initializare