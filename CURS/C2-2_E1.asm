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
  datab label byte
  dataw label word
.code
program:
  ; muta adresa segmentului de date in DS
  initializare:
    mov ax, @data
    mov ds, ax

  start:
    mov ax, bx      ; ax ← bx
    mov ax, [bx]    ; ax ← ds:(bx)
    mov ax, [bp]    ; ax ← ss:(bp)
    mov ax, es:[bp] ; ax ← es:(bp)
    mov ax, [si]    ; ax ← ds:(si)
    mov [di], ax    ; ds:(di) ← ax
    mov ax, offset datab
    ; adresa relativa din segmentul .data la care s-a definit
    ; eticheta datab este memorata in registrul ax
    mov ax, word ptr datab
    ; echivalent cu mov ax, dataw

    ; in urma instructiunilor DS va adresa segm. de cod
    mov ax, cs
    mov ds, ax

    mov byte ptr [BX + 50], 8
    ; fara operatorul byte ptr instructiunea ar fi fost
    ; ambigua deoarece nu s-ar fi specificat cati octeti
    ; sa fie alocati pentru memorarea valorii 8

  ; iesire din program
  sfarsit:
    ; adauga un caracter de tip 'newline', linie noua
    linie_noua
    mov ah, 4Ch    ; functia DOS de iesire din program
    int 21h
end program