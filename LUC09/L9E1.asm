.model small
.stack 100
sablon struc
  _bp    dw ?
  _cs_ip dw ?
  _n     dw ?
sablon ends
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
  
  afis proc near
      push ax      ; salvarea registrelor
      push bx
      push cx
      push dx
      mov dx, word ptr rez + 2 ; preluare din rezultat
      mov ax, word ptr rez
      mov cx, 0                ; initializarea contorului
      mov bx, 10
    next:
      div bx     ; se obtine pe rand in DX
                 ; fiecare cifra zecimala
      push dx    ; salvarea in stiva e necesara pentru
                 ; afisarea in ordinea corecta
      mov dx, 0
      inc cx
      cmp ax, 0
      jne next
    print:
      pop dx       ; preluare din stiva
      add dl, 30h  ; conversie la codul ASCII
      mov ah, 02h
      int 21h      ; afisarea
      loop print
      pop dx       ; refacerea registrelor
      pop cx
      pop bx
      pop ax
      retn
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
    mov word ptr rez, 0FFFFh
    mov word ptr rez + 2, 0Ah
    call near ptr afis       ; afisarea rezultatului
	; iesire din program
	sfarsit:
		mov ah, 4Ch     ; functia DOS de iesire din program
		int 21h
end program