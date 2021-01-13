.model small
  public afis_sir
.stack 100
.code
  afis_sir proc far
      push ax
      push si
      push dx
    iar:
      mov dl, [si]
      test dl, dl
      jz ultim
      mov ah, 2h
      int 21h
      inc si
      jmp iar
    ultim:
      pop dx
      pop si
      pop ax
      ret
  afis_sir endp
end
