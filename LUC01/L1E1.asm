.model small
.stack 100
.data
  tabel  db 1, 2, 3, 4, 5, 10 dup(?)
  tabel1 dw 1, 2, 3, 12h, 12
  tabel2 dd 1, 2, 1234h
  tabel3 dq 1, 2, 12345678h
  tabel4 dt 1, 2,, 1234567890h
.code
  start:
    ; muta adresa segmentului de date in DS
    initializare:
      mov ax, @data
      mov ds, ax

      mov ax, 14h               ; adresare imediata
      mov ax, 14                ; adresare imediata
      mov al, tabel             ; adresare directa
      mov al, tabel[1]          ; adresare directa
      
      ; operatorul ptr este necesar
      ; tabel fiind definit cu directiva DB
      mov ax, word ptr tabel    ; adresare directa
      mov ax, word ptr tabel[2] ; adresare directa
      
      mov bx, offset tabel
      mov al, [bx + 1]         ; adresare indirecta
      mov al, [bx]             ; adresare indirecta
      mov bx, 5                ; adresare imediata
      mov al, tabel[bx]        ; adresare bazata
      mov si, 1                ; adresare imediata
      mov al, [bx][si]         ; adresare bazata si indexata
      mov si, 6                ; adresare imediata

      ; explicitarea cu operatorul ptr este absolut necesara
      mov byte ptr [bx][si], 2 ; adresare bazata si indexata

      mov bp, offset tabel
      mov al, [bp]      ; adresare bazata cu deplasament nul

      ; explicitarea cu operatorul ptr este absolut necesara
      ; adresare bazata si indexata
      mov byte ptr ds:[bp][si][1], 7   
      ; adresare bazata si indexata
      mov word ptr ds:[bp][si][1], 19h

    ; iesire din program
    sfarsit:
      mov ah, 4Ch    ; functia DOS de iesire din program
      int 21h
  end start