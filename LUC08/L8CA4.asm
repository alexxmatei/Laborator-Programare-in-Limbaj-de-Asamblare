.model small
.stack
sablon struc
	_bp dw ?
	_ip dw ?
	nrl dw ?
	nrh dw ?
sablon ends
.data
	numar db 8 dup (?)
	mesaj db 13, 10, 'Numar de biti pe 1 este: $'
.code
	; cati biti sunt pe 1 in dx:ax
	nr_biti proc
		mov bp, sp
    mov dx, [bp].nrh
    mov ax, [bp].nrl
    mov cx, 16
    clc
    xor bx, bx
  repeta:
    shl ax, 1
    adc bx, 0
    shl dx, 1
    adc bx, 0
    loop repeta
    pop bp
    ret 2
  nr_biti endp
  
  ; citeste un caracter de la tastatura
  cit_car proc
    mov ah, 1
    int 21h
    ret
  cit_car endp
  
  ; inmulteste dx ax cu 10
  dxax10 proc
    push bx
    push cx
    push ax
    push dx
    mov cx, 3
  dxax8:
    clc
    shl ax, 1
    rcl dx, 1
    loop dxax8
    pop cx
    pop bx
    add ax, bx
    adc dx, cx
    add ax, bx
    adc dx, cx
    pop cx
    pop bx
    ret
  dxax10 endp
  
  ; afiseaza numarul in baza 10
  afisal proc
    mov ah, 0
    mov dl, 10
    div dl
    push ax
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h
    pop ax
    mov dl, ah
    add dl, '0'
    mov ah, 2
    int 21h
    ret
  afisal endp
    
  start:
    mov ax, @data
    mov dx, ax
    xor ax, ax ; in ax 0
    mov cx, 8  ; contor citiri
    mov si, 0  ; index de plasare in memorie
  iar:
    call cit_car
    sub al, '0'
    mov numar[si], al
    inc si
    loop iar
    
    ; incepe conversia sirului de cifre in numar
    mov ax, 0
    mov dx, 0
    mov cx, 8
    mov si, 0
  iar1:
    call dxax10
    add al, numar[si]
    adc ah, 0
    adc dx, 0
    inc si
    loop iar1
    
    ; apeleaza procedura de calcul in bl 
    ; a numarului de biti pe 1 in dx ax
    push dx
    push ax
    call nr_biti
    
    ; afiseaza mesaj
    mov ah, 9
    lea dx, mesaj
    int 21h
    
    ; afiseaza numar
    mov al, bl
    call afisal
    
    ; iesire DOS
    mov ah, 4Ch
    int 21h
 end start