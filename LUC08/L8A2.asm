linie_noua MACRO
    mov dl, 13 ; Carriage Return
    mov ah, 2
    int 21h
    mov dl, 10 ; Line Feed
    mov ah, 2
    int 21h
ENDM

.model small
.stack 100 ; dimensiunea stivei
.data
  nr1 dd 12345678h
  nr2 dd 11235811h
  rez dq ? ; rezultatul e de tip quad pentru a se putea
           ; salva in acesta valoarea maxima a adunarii
  double struc
    _LSB dw ?
    _MSB dw ?
  double ends

  sablon struc
    _bp dw ?
    _ip dw ?
    _adrRez dw ?
    _nr2Lsb dw ?
    _nr2Msb dw ?
    _nr1Lsb dw ?
    _nr1Msb dw ?
  sablon ends
.code

; procedura primeste ca parametrii (in stiva):
;  - primul    numar pe 32 de biti (tip double)
;  - al doilea numar pe 32 de biti (tip double)
;  - adresa unde se va stoca rezultatul
;    (adresa - tip word, valoarea la adr. - tip quad)
; se va respecta conventia INTEL
; pentru plasarea parametrilor pe stiva
; prototipul functiei in C:
;void _adunNr32b(long X1, long X2, long long * adr_rez);
proc adunNr32b
  push bp
  mov bp, sp

  ; salvarea contextului
  push ax
  push bx
  push dx
  push cx
  push di

  mov ax, [bp].[_nr1Lsb]
  mov bx, [bp].[_nr1Msb]
  mov cx, [bp].[_nr2Lsb]
  mov dx, [bp].[_nr2Msb]
  add ax, cx
  adc dx, bx
  mov di, bp.[_adrRez]
  mov [di], ax     ; salveaza partea MPS in rezultat
  mov [di + 2], dx ; salveaza urm. 2 octeti in rezultat
  adc [di + 4], 0  ; salveaza partea MS (carry bit)

  ; restaurarea contextului
  pop di
  pop cx
  pop dx
  pop bx
  pop ax
  pop bp
  ret ; revenire din procedura
endp adunNr32b

program:
  ; muta adresa segmentului de date in DS
  initializare:
    mov ax, @data
    mov ds, ax

  start:
    ;instructiuni program
    push nr1._MSB
    push nr1._LSB
    push nr2._MSB
    push nr2._LSB
    push offset rez
    call adunNr32b
    add sp, 10 ; restaurare stiva

  ; iesire din program
  sfarsit:
    ; adauga un caracter de tip 'newline', linie noua
    linie_noua
    mov ah, 4Ch    ; functia DOS de iesire din program
    int 21h
end program