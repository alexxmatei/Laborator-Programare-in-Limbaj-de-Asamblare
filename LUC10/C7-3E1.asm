.model small
extrn _printf:near, _scanf:near
public _main
.data
  _n dw ?
  _sir db 'Un sir', 0
  _formatp db '%s %d\n', 0
  _formats db '%d', 0
.code
  _main
    lea ax, _n
    push ax
    lea ax, _formats
    push ax
    call near ptr _scanf
    add sp, 4
    push _n
    lea ax, _sir
    push ax
    lea ax, _formatp
    push ax
    call near ptr _printf
    add sp, 6
    retn
  _main endp
end