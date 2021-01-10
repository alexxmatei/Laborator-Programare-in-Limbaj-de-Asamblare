.model tiny
  extrn _clrscr:near, _scanf:near, _printf:near, _getch:near
  public _main
.stack 1024
  sablon struc
    _bp dw ?
    _ip dw ? ; _cs_ip dd ?, modificare I
    _n dw ?
  sablon ends
.data
  n dw ?
  MesRd db 'Introduceti un intreg: ', 0
  MesWr db 'Factorialul este %d...', 0
  scan db '%d', 0
.code
  Factorial proc near ; Factorial proc far, modificare I
      push bp
      mov bp, sp
      ; + push DS, modificare II
      ; + push ES, modificare II
      push dx
      push bx
      mov bx, [bp]._n
      cmp bx, 1
      jne et1
      mov ax, 1
      jmp et2
    et1:
      dec bx
      push bx
      call near ptr Factorial ; call far ptr, modificare I
      add sp, 2
      mul [bp]._n
    et2:
      pop bx
      pop dx ; ax contine rezultatul deci nu se restaureaza
      ; + pop ES, modificare II
      ; + pop DS, modificare II
      pop bp ; => ax nu treb. salvat in stiva la inc. proc
      retn   ; retf, modificare I
  Factorial endp

  _main proc near
      call near ptr _clrscr
      ; + mov ax, seg MesRd, modificare II
      ; + push ax,           modificare II
      lea ax, MesRd
      push ax
      call near ptr _printf ; call far ptr, modificare I
      add sp, 2             ; add sp, 4,    modificare II
      ; + mov ax, seg n, modificare II
      ; + push ax,       modificare II
      lea ax, n
      push ax
      ; + mov ax, seg scan, modificare II
      ; + push ax, modificare II
      lea ax, scan
      push ax
      call near ptr _scanf ; call far ptr _scanf, modif. I
      add sp, 4            ; add sp, 8, modificare II
      mov ax, n
      push ax
      call near ptr Factorial ; call far ptr, modificare I
      add sp, 2
      push ax
      ; + mov ax, seg MesWr, modificare II
      ; + push ax,           modificare II
      lea ax, MesWr
      push ax
      call near ptr _printf ; call far ptr, modificare I
      add sp, 4             ; add sp, 6,    modificare II
      call near ptr _getch  ; call far ptr, modificare I
      retn                  ; retf, modificare I
  _main endp
end