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
  sir1 db '9123456789'
  sir2 db '9123581321'
  lenSir equ $ - sir2
  sir3 db (lenSir + 1) dup (?) ; lungimea unui sir + carry
  zece dw 0Ah

  sablon struc
    _bp   dw ?
    _ip   dw ?
    _nrEl dw ?
    _adr3 dw ?
    _adr2 dw ?
    _adr1 dw ?
  ends

.code

;description
proc adunaSiruri
  push bp
  mov bp, sp
  push ax
  push bx
  push cx
  push si
  mov si, 0
  mov cx, bp.[_nrEl]
bucla:
  mov ax, 0
  mov bx, [bp]._adr1
  add bx, cx
  mov al, [bx]-1
  mov bx, [bp]._adr2
  add bx, cx
  add al, [bx - 1]
  add ax, si
  sub al, 60h
  mov dx, 0
  div zece
  add dl, '0'
  mov bx, [bp]._adr3
  add bx, cx
  mov [bx], dl
  mov si, ax
  loop bucla
  mov dx, si
  add dl, '0'
  mov [bx-1], dl
  pop si
  pop cx
  pop bx
  pop ax
  pop bp
  ret
endp adunaSiruri

program:
  ; muta adresa segmentului de date in DS
  initializare:
    mov ax, @data
    mov ds, ax
    lea si, sir1
    push si
    lea si, sir2
    push si
    lea si, sir3
    push si
    mov si, lenSir
    push si
    call adunaSiruri
    add sp, 8
    mov es, ax
    std ; parcurgem sirul de la dreapta la stanga
    lea si, sir1 + lenSir - 1 ; se incepe de la 0
    lea di, sir3 + lenSir ; avem o cifra in plus
    mov bx, 0Ah
    mov ah, 0

  start:
    mov cx, lenSir + 1
  bucla1:
    lodsb
    add al, [si][lenSir + 1] ; DI a decrementat cu 1
    add ax, bp
    ;mov al, [si][lenSir + 1] ; DI a decrementat cu 1
    sub ax, 60h
    mov dx, 0h
    div bx
    mov bp, ax
  back:
    mov ax, dx
    add ax, 30h
    stosb
    loop bucla1

  ; iesire din program
  sfarsit:
    ; adauga un caracter de tip 'newline', linie noua
    linie_noua
    mov ah, 4Ch    ; functia DOS de iesire din program
    int 21h
end program