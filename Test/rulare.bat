SET fileName=%1
TASM	%fileName%.asm
TASM 	%fileName%.asm /zi /la
TLINK	%fileName%.obj /v
%fileName%.exe
