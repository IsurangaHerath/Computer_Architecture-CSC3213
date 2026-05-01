.model small
.stack 100h
.data
	msg1 db "Enter the Number : $"
	msg2 db "Factorial Value is : $"
	a db ?
	b db ?
	n1 db ?
	n2 db 0
	n3 db 0
	n4 db 0
	
.code
	mov ax,@data
	mov ds,ax

	call readInt
	call printNo
	
	mov ax,4c00h
	int 21h	
	
	proc readInt
		mov dx,offset msg1
		mov ah,09h
		int 21h
		
		mov ah,01h
		int 21h
		sub al,48
	ret
	endp

	proc printNo
		mov cl,al
		mov al,1
		
			aaaa:
				mov bl,cl
				mul bl
			loop aaaa
			
		mov n1,al
		
		mov dl,10
		mov ah,02h
		int 21h
		
		mov dx,offset msg2
		mov ah,09h
		int 21h

		mov ah,00
		mov al,n1
		mov bl,10
		div bl
		mov n2,ah
		
		mov ah,00
		div bl
		mov n3,ah
		
		mov ah,00
		div bl
		mov n4,ah
		
		mov dl,n4
		call print
		
		mov dl,n3
		call print
		
		mov dl,n2
		call print
	ret
	endp
	
	proc print
	   add dl,48
		mov ah,02h
		int 21h
		ret
	end