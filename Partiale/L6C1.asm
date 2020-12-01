cseg1 SEGMENT
	proc1 PROC
	proc1 ENDP
cseg1 ENDS
cseg2 SEGMENT
	proc2 PROC
	proc2 ENDP
cseg2 ENDS

dseg1 SEGMENT
	alfa1 db ?
	beta1 db ?
dseg1 ENDS
dseg2 SEGMENT
	alfa2 db ?
	beta2 db ?
dseg2 ENDS

dgroup GROUP dseg1, dseg2
cgroup GROUP cseg, cseg1, cseg2

cseg SEGMENT 
	ASSUME cs:cgroup, ds: dgroup
	; muta adresa de inceput a grupului de date in DS
	mov ax, offset dgroup:alfa1
	mov bx, offset dgroup:beta1
	mov cx, offset dgroup:alfa2
	mov dx, offset dgroup:beta2
	mov ax, dgroup
	mov ds, ax
	start:
		mov al, beta1
		mov bl, beta2
		call proc1
		call proc2
cseg ENDS

END