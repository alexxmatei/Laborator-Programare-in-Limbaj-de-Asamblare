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
  adr32 dd 400000h
.code
program:
  ; muta adresa segmentului de date in DS
  initializare:
    mov ax, @data
    mov ds, ax

  start:
    valX16 macro val
        local iar
        push cx
        mov cx, 4
      iar:
        shr word ptr val + 2, 1
        rcr word ptr val, 1
        loop iar
        pop cx
    endm

    valX16 adr32

  ; iesire din program
  sfarsit:
    ; adauga un caracter de tip 'newline', linie noua
    linie_noua
    mov ah, 4Ch    ; functia DOS de iesire din program
    int 21h
end program