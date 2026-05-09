.model small
.stack 100h
.data
	msg1 db "Enter the value for n :$"
	msg2 db "Enter the value for r :$"
	msg3 db "nPr Value is : $"
	n db ?
	n1 db ?
	n2 db ?
	r db ?
	a db ?
	b db ?
	rem db ?
	rem2 db ?
.code
	mov ax,@data
	mov ds,ax
	
	
	
	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	call ReadInt
	mov n,al
	
	call newLine
	
	mov dx,offset msg2
	mov ah,09h
	int 21h
	
	call ReadInt
	mov r,al
	
	call newLine
	
	
	
	mov dx,offset msg3
	mov ah,09h
	int 21h
	
	call nPr
	call printNo
	
mov ax,4c00h
int 21h
	

	proc ReadInt
		mov ah,01h
		int 21h
		sub al,48
		mov n1,al
		
		Read:
			mov ah,01h
			int 21h
			cmp al,0dh
			je Exit
			sub al,48
			mov n2,al
		
			mov al,n1
			mov bl,10
			mul bl
			add al,n2
			mov n1,al
			
		jmp Read
		Exit:
		
		mov al,n1
		
		ret
		endp
		
	proc newLine
		mov dl,0ah
		mov ah,02h
		int 21h
	ret
	endp	


	proc factorial
		mov cl,al
		mov al,1
		
		start1:
			mov bl,cl
			mul bl
		loop start1	
	
	ret
	endp
	
	
	proc nPr
		mov al,n
		call factorial
		mov a,al
		
		mov al,n
		
		sub al,r
		call factorial
		mov b,al
		
		mov al,a
		mov ah,00
		div b
	ret
	endp
	
	proc printNo
		
			mov ah,00
			mov bl,100
			div bl
			mov rem,ah
			
			mov dl,al
			add dl,48
			mov ah,02h
			int 21h
			
			mov ah,00
			
			mov al,rem
			mov bl,10
			div bl
			mov rem2,ah
			
			mov dl,al
			add dl,48
			mov ah,02h
			int 21h
			
			mov dl,rem2
			add dl,48
			mov ah,02h
			int 21h
			
	ret
	endp
	
	
	
end 	