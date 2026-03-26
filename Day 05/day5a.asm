.model small
.stack 100h
.data
	msg1 db "Enter a number : $"
	msg2 db "Hi",10,"$"
	msg3 db "Bye",10,"$"
	
.code
	start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	cmp al,5
	
	mov dl,10
	mov ah,02h
	int 21h
	
	je Lb1yes
	jne Lb1no
	
	Lb1yes:
		mov dx,offset msg2
		mov ah,09h
		int 21h
		jmp Endnn
		
	Lb1no:
		mov dx,offset msg3
		mov ah,09h
		int 21h
		
	Endnn:
		mov ax,4c00h
		int 21h
	end start