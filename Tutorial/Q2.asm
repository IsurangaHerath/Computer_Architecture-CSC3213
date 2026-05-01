;read a number without printing it

.model small
.stack 100h
.data
	msg db "Enter a Number : $"
	a db ?
	b db ?
	r1 db 0
	r2 db 0
	
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	 call readInt
	
	
	mov ax,4c00h
	int 21h	
	
	proc readInt
		mov ah,01h
		int 21h
		sub al,48
		mov a,al
			read :
				mov ah,01h
				int 21h
				cmp al,0dh
				je exit
				
				sub al,48
				mov b,al
				
				mov al,a
				mov bl,10
				mul bl
				add al,b
				
				mov a,al
				jmp read
				
				exit:
				mov al,a
	ret
	endp
	
	
	endnd