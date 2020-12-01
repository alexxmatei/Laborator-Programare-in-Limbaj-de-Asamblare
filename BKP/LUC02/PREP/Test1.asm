.model small
.stack 100h
.data
	
.code
	start:
		; Muta adresa segmentului de date in ds
		mov ax, @data
		mov ds, ax
		;
		mov bp, sp
		mov bx, 20h
		tinta:
			push ax
			push bx
			push ax
			push bx
			push ax
			push bx
		JMP tinta
		mov cx, [bp-2]
		mov dx, [bp-4]
		; Sfarsit program
		mov ax, 4C00h
		int 21h
		;
	end start