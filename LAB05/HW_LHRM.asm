.model small
.stack 100
.data
    tabel1 dd 154A789Fh
    tabel2 dd 92457ABCh
    rezultat dd 0h
.code
        mov ax,@data
        mov ds, ax
        mov al,0
        start:

        mov bx, word ptr tabel1
        add bx, word ptr tabel2
        mov word ptr rezultat, bx
        mov bx, word ptr tabel1+2
        adc bx, word ptr tabel2+2
        mov word ptr rezultat+2, bx

        afisare proc
        mov dl, al
        mov ah, 2h
        int 21h
        ret
        afisare endp

        sfarsit:
        mov ah, 4ch
        int 21h
end
