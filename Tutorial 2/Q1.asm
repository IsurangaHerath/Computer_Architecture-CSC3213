.model small
.stack 100h
.data
	msg1 db "Enter the first number:$"
	msg2 db "Enter the second number:$"
	n1 db ?
	n2 db ?
	msg3 db "sum:$"
	msg4 db "Difference:$"
	msg5 db "Product:$"
	msg6 db "Quotient:$"
	msg7 db "Remainder:$"
	o db 0
	r db 0
	d db 0


.code
	mov ax,@data
	mov ds,ax

	;read first msg1
	mov dx,offset msg1 ;load the msg1 address
	mov ah,09h ;call the string function
	int 21h  ;print msg1

	;Enter the first number
	mov ah,01h  ;call the keyboard function
	int 21h ;show the number

	sub al,48 ;convert the normal number
	mov n1,al ; store the first number into n1 variable

	;next line
	mov dl,10
	mov ah,02h
	int 21h

	;read first msg2
	mov dx,offset msg2  
	mov ah,09h 
	int 21h

	;Enter the second number
	mov ah,01h  
	int 21h 

	sub al,48 ;convert the normal number
	mov n2,al

	mov dl,10
	mov ah,02h
	int 21h

	;add
	mov dx,offset msg3  
	mov ah,09h 
	int 21h

	mov dl,n1
	add dl,n2
	add dl,48

	mov ah,02h
	int 21h

	mov dl,10
	mov ah,02h
	int 21h

	;sub
	mov dx,offset msg4  
	mov ah,09h 
	int 21h

	mov dl,n1
	sub dl,n2
	add dl,48

	mov ah,02h
	int 21h

	mov dl,10
	mov ah,02h
	int 21h

	;mul
	mov dx,offset msg5  
	mov ah,09h 
	int 21h

	mov al,n1
	mul n2
	mov d,al

	cmp al,10
	jg dig2
	jl dig1

	dig1:
	mov dl,d
	add dl,48
	mov ah,02h
	int 21h
	jmp doo

	dig2:
	mov ah,00
	mov al,d
	mov bl,10
	div bl
	mov o,ah


	mov dl,al
	add dl,48
	mov ah,02h
	int 21h

	mov dl,o
	add dl,48
	mov ah,02h
	int 21h
	jmp doo


	doo:
	mov dl,10
	mov ah,02h
	int 21h


	;div
	mov ah,00
	mov al,n1
	div n2
	mov r,ah

	mov dx,offset msg6 
	mov ah,09h 
	int 21h

	mov dl,al
	add dl,48
	mov ah,02h
	int 21h



	mov dl,10
	mov ah,02h
	int 21h


	mov dx,offset msg7  
	mov ah,09h 
	int 21h

	mov dl,r
	add dl,48
	mov ah,02h
	int 21h


	mov ax,4c00h
	int 21h

end
