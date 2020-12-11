.model small
.stack 100
.data
	n1  dd 12345h
	n2  dd 54321h
	rez dd ?
	sablon struc
		_bp dw ?
		_ip dw ?
		n2_low dw ?
		n2_high dw ?
		n1_low dw ?
		n1_high dw ?
	sablon ends
.code
	program:
	aduna proc near
		push bp
		mov bp, sp
		mov ax, [bp].n1_low
		add ax, [bp].n2_low
		mov dx, [bp].n1_high
		adc dx, [bp].n2_high
		pop bp
		ret
	aduna endp
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		push word ptr n1 + 2
		push word ptr n1
		push word ptr n2 + 2
		push word ptr n2
		call near ptr aduna
		add sp, 8
		mov word ptr rez, ax
		mov word ptr rez + 2, dx
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end initializare