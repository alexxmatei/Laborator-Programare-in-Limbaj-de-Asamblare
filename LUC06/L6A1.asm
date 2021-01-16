.model small
.stack 100
.data
  alfa struc
    a1 db ?
    a2 db 21h
    a3 dw 5176h
  alfa ends
  tab alfa 10 dup (<3h, ?, 2252h>)
.code
  program:
  ; muta adresa segmentului de date in DS
  initializare:
    mov ax, @data
    mov ds, ax
  start:
    mov al, byte ptr tab[12].a2
    mov al, byte ptr tab[11].a2
  ; iesire din program
  sfarsit:
    mov ah, 4Ch     ; functia DOS de iesire din program
    int 21h
end program