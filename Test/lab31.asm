.model small
.stack 100
.data 
 V1 DD 145A789Fh
 V2 DD 92457ABCh
 rez DD ?
.code
mov AX,@data
mov DS,AX
mov AX,word ptr [V1]
ADD AX, word ptr [v2]
mov word ptr [rez],AX
mov AX, word ptr [V1+2]
ADC AX, word ptr [V2+2]
mov word ptr [rez+2],AX
mov AH , 4CH
int 21h
end