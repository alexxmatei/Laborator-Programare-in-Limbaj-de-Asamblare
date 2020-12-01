.model small
.stack 100
.data
	tabel db 1, 2, 3, 4, 5, 10 dup(?)
	tabel1 dw 1, 2, 3, 12h, 12
	tabel2 dd 1, 2, 1234h
	tabel3 dq 1, 2, 12345678h
	tabel4 dt 1, 2,, 1234567890h
.code
	start:
		mov ax, @data
		mov ds, ax
		mov ax, 14h					; adresare imediata
		mov ax, 14
		mov al, tabel				; adresare directa
		mov al, tabel[1]			; adresare directa
		mov ax, word ptr tabel		; adresare directa - op ptr necesar
		mov ax, word ptr tabel[2]   ; tabel fiind def cu directiva DB
		mov bx, offset tabel		
		mov al, [bx + 1]			; adresare indirecta
		mov al, [bx]				; adresare indirecta
		mov bx, 5
		mov al, tabel[bx]			; adresare bazata
		mov si, 1
		mov al, [bx][si]			; adresare bazata si indexata
		mov si, 6
		mov byte ptr [bx][si], 2	; adresare bazata si indexata
		mov bp, offset tabel
		mov al, [bp]				; adresare bazata cu deplasament nul
		mov byte ptr ds:[bp][si][1], 7
		mov word ptr ds:[bp][si][1], 19h
		mov ah, 4ch
		int 21h
	end start