.model small
.stack 100h
.data
	
.code
	start:
		; Muta adresa datelor in segmentul de date
		mov ax, @data
		mov ds, ax
		;
		LAHF
		mov ah, 0FFh
		SAHF
		mov ah, 01010101b
		SAHF
		PUSHF
		push 0FFFFh
		POPF
		; Sfarsit program
		mov ax, 4C00h
		int 21h
	end start