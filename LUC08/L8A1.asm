.model small
.stack 100
.data
	sir1 db 'Introduceti 4 cifre:$'
	nr  dd ?
.code
	program:
	numara proc near
		push bp
		mov bp, sp
		mov di, [bp + 4]
		mov cx, 8
		bucla:
			shl byte ptr [nr + di], 1
			adc al, 0
			loop bucla
		pop bp
		ret
	numara endp
	initializare:
		mov ax, @data
		mov ds, ax
		mov cx, 4
	start:
		mov ah, 1
		int 21h
		sub al, '0'
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