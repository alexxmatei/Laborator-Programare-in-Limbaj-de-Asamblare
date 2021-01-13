linie_noua MACRO
    mov dl, 13 ; Carriage Return
    mov ah, 2
    int 21h
    mov dl, 10 ; Line Feed
    mov ah, 2
    int 21h
ENDM

putsi macro x
  local sir
    .data
      sir db x, 0
    .code
        push si
        lea si, sir
        call afis_sir
        pop si
endm

.model small
.stack 100 ; dimensiunea stivei
.code
program:
  ; muta adresa segmentului de date in DS
  initializare:
    mov ax, @data
    mov ds, ax

  start:
    putsi 'sirDeAfisat'

  ; iesire din program
  sfarsit:
    ; adauga un caracter de tip 'newline', linie noua
    linie_noua
    mov ah, 4Ch    ; functia DOS de iesire din program
    int 21h

afis_sir proc far
    push ax
    push si
    push dx
  iar:
    mov dl, [si]
    test dl, dl
    jz ultim
    mov ah, 2h
    int 21h
    inc si
    jmp iar
  ultim:
    pop dx
    pop si
    pop ax
    ret
afis_sir endp

end program