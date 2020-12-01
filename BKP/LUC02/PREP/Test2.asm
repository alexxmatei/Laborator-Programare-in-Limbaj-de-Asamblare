.model small
.stack 100
.data
	
.code
	start:
		; Mutare a adresei segmentului de date in ds
		mov ax, @data
		mov ds, ax
		;
		mov ax, 1234h
		push ax
		mov bx, 5678h
		push bx
		mov bp, sp
		mov cx, 90ABh
		push cx
		mov byte ptr [bp], 11h
		mov word ptr [bp + 2], 2233h
		mov word ptr [bp - 1], 4455h
		pop cx
		pop bx
		pop ax
		; Sfarsit program
		mov ax, 4C00h
		int 21h
		;
	end start