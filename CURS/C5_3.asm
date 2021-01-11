linie_noua MACRO 
    mov dl, 13 ; Carriage Return
    mov ah, 2
    int 21h
    mov dl, 10 ; Line Feed
    mov ah, 2
    int 21h
ENDM

afisare_macr macro X, in_plus
    ifb < X >
      eroare <afis_macr-lipsa parametrii>
      exitm
    endif
    ifnb <in_plus>
      eroare <afis_macr - parametrii in plus>
      exitm
    endif
    lea si, x
    call afiseaza
endm

.model small
.stack 100 ; dimensiunea stivei
.data
  a db '5'
  b db 'a'
  c db '$'
.code

; afiseaza caracterul aflat la adresa efectiva data de SI
proc afiseaza
    mov dl, [si]
    mov ah, 02h
    int 21h
    ret
endp afiseaza

program:
  ; muta adresa segmentului de date in DS
  initializare:
    mov ax, @data
    mov ds, ax

  start:
    afisare_macr a
    afisare_macr b
    afisare_macr c

  ; iesire din program
  sfarsit:
    ; adauga un caracter de tip 'newline', linie noua
    linie_noua
    mov ah, 4Ch    ; functia DOS de iesire din program
    int 21h
end program