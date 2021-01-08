.model small
.data
 sir db 'A B C D E F G H I J'

.code
program:

mov ax,@data
mov ds,ax
mov es,ax
cld ;std

mov al,'I'
lea di,sir
mov cx,100
mov ah, 100

repnz scasb
sub ah, cl
  sfarsit:
	mov ah, 4Ch    ; functia DOS de iesire din program
	int 21h
;...

end program