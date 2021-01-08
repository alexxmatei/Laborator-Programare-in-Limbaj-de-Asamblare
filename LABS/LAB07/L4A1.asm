.model small
.stack 512
.data
	tab_proc  dw proc_1
	          dw proc_2
			  dw proc_3
	tab_procf dd procf_1
	          dd procf_2
			  dd procf_3
	intra     dw etich1
	          dw etich2
			  dw etich3
	inter     dd etif1
			  dd etif2
.code
	proc_1 proc
		push dx
		pop dx
		ret
	proc_1 endp
	
	proc_2 proc
		push dx
		pop dx
		ret
	proc_2 endp
	
	proc_3 proc
		push dx
		pop dx
		ret
	proc_3 endp
	
	procf_1 proc far
		push dx
		pop dx
		ret
	procf_1 endp
	
	procf_2 proc far
		push dx
		pop dx
		ret
	procf_2 endp
	
	procf_3 proc far
		push dx
		pop dx
		ret
	procf_3 endp
	
	; muta adresa segmentului de date in DS
	initializare:
		mov ax, @data
		mov ds, ax
	start:
		mov si, 0
		jmp inter[si]
	etif2 label far
		jmp intra
	proced: 
		lea bx, proc_1
		call bx
		call tab_proc
		mov si, 2
		call tab_proc[si]
		lea bx, tab_proc
		call word ptr [bx]
		mov si, 4
		call word ptr [bx][si]
		call tab_procf
		mov si, 4
		call tab_procf[si]
		lea bx, tab_procf
		call dword ptr [bx]
		mov si, 4
		call dword ptr [bx][si]
		jmp sfarsit
	etich1: 
		mov si, 2
		jmp intra[si]
	etich3 label near
		jmp proced
	etich2 label near
		lea bx, intra
		jmp word ptr [bx + 4]
	etif1 label far
		lea bx, inter
		mov si, 4
		jmp dword ptr [bx][si]
	; iesire din program
	sfarsit:
		mov ah, 4ch     ; functia DOS de iesire in sistemul de operare
		int 21h
end initializare