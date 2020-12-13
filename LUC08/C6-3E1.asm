.model small
.stack 100
.data
	sablon struc
		loc_3 dw ?
		loc_2 dw ?
		loc_1 dw ?
		_bp   dw ?
		_ip   dw ?
		par_2 dw ?
		par_1 dw ?
	sablon ends
.code
	proc_loc proc near
		push bp
		sub sp, 6
		mov bp, sp
		; acces la parametrii formali prin:
		;   [bp].par_1, [bp].par_2
    ; acces la variabilele locale prin:
    ;   [bp].loc_1, [bp].loc_2, [bp].loc_3
		add sp, 6
		pop bp
		ret 4
	proc_loc endp
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
	
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program