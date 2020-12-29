linie_noua MACRO
	mov dl, 10
	mov ah, 2
	int 21h
ENDM

.model small
.stack 100
sablon struc
  _bp    dw ?
  _cs_ip dw ?
  _n     dw ?
sablon ends

sablon1 struc
  __bp    dw ?
  __cs_ip dd ?
  __n     dw ?
sablon1 ends
.data
	n   dw 7
  rez dd ?
.code

  fact proc near
      push bp    ; salvare BP
      mov bp, sp ; initializare cu varful stivei
      pushf      ; salvarea indicatorilor de conditie
      push bx
      mov bx, word ptr [bp]._n ; preluarea parametrului
      cmp bx, 0  ; conditia de oprire
      jne rec
      mov ax, 1  ; 0! = 1
      mov dx, 0
      jmp stop
    rec:
      dec bx            ; termenul urmator
      push bx           ; transferul parametrului
      call near ptr fact; apel recursiv cu rezultat in DX:AX
      add sp, 2
      mul word ptr[bp]._n
    stop:
      pop bx     ; refacerea registrului BX
      popf       ; refacerea indicatorilor de conditie
      pop bp
      retn
  fact endp
  ; Doesn't work properly for doubles, only words
  afis proc far
      push bp
      mov bp, sp
      push dx
      push ax
      push bx
      mov ax, [bp].__n
      cmp ax, 10
      mov dl, al ; AX < 10
      jb afis_1
      mov bx, 10
      xor dx, dx
      div bx  ; AX <- catul
      push ax ; DX <- restul
      call far ptr afis
    afis_1:
      add dl, '0'
      mov ah, 2
      int 21h
      pop bx
      pop ax
      pop dx
      pop bp
      retf 2
  afis endp
	program:
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
    mov ax, n
	start:
    push ax      ; transferul parametrului prin stiva
    call near ptr fact       ; DX:AX <- rezultatul
    add sp, 2
    mov word ptr rez + 2, dx ; rezultatul se depune in rez
    mov word ptr rez, ax
    push word ptr rez
    call far ptr afis       ; afisarea rezultatului
	; iesire din program
	sfarsit:
    linie_noua
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program