set fileName=%1
TASM %fileName%.asm/zi/la
TLINK %fileName%.obj/v
%fileName%.exe