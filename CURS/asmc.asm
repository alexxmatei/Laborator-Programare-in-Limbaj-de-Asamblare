.model small
  extrn _printf:near, _scanf:near,
  extrn _clrscr:near, _afis:near, _adun_C:near,
                extrn _var_C:word
public _main, _var_asm, _adun_asm

.data
  _var_asm dw 15
  _n1 dw ?
  _n2 dw ?
  _sir db 'Suma numerelor este:', 0
  _sir2 db 'Variabila definita in C este:', 0
  _formatp db '%s %d', 13, 10, 0
  _formats db '%d %d', 0
.code
  _adun_asm proc near
    mov ax, _var_C
    add ax, _var_asm
    retn
  _adun_asm endp
  _main proc near
    call near ptr _clrscr
    lea ax, _n2
    push ax
    lea ax, _n1
    push ax
    lea ax, _formats
    push ax
    call near ptr _scanf ; preia doua valori
    add sp, 6
    push _n1
    push _n2
    call near ptr _adun_C
    add sp, 4
    push ax ; rezultatul adunarii in ax
    lea ax, _sir
    push ax
    lea ax, _formatp
    push ax
    call near ptr _printf ; afiseaza rezultatul n1 + n2
    add sp, 6
    mov ax, _var_C
    push ax
    lea ax, _sir2
    push ax
    lea ax, _formatp
    push ax
    call near ptr _printf ; afiseaza variabila din C
    add sp, 6

    ; afiseaza suma valorilor definite in C si asm
    call near ptr _afis
    retn
  _main endp
end