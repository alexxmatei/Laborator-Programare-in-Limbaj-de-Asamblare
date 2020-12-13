.model small
.stack 100
sablon struc
  _bp    dw ?
  _cs_ip dd ?
  n      dw ?
sablon ends
.data
	
.code
  afis_cifre proc far
      push bp
      mov bp, sp
      push dx
      push ax
      push bx
      mov ax, [bp].n
      cmp ax, 10
      mov dl, al ; AX < 10
      jb afis_1
      mov bx, 10
      xor dx, dx
      div bx  ; AX <- catul
      push ax ; DX <- restul
      call far ptr afis_cifre
    afis_1:
      add dl, '0'
      mov ah, 2
      int 21h
      pop bx
      pop ax
      pop dx
      pop bp
      retf 2
  afis_cifre endp
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
    mov ax, 0
	start:
    push 0FFFFh
    call far ptr afis_cifre
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program