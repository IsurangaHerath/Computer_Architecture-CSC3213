;Remember about how to get user input

.model small
.stack 100h
.data
	n1 db 0
	n2 db 0
	
	m1 db "Enter first number: $"
	m2 db "Enter second number: $"
	
	m3 db "Sum is $"
	m4 db "Sub is $"
	
.code
	mov ax,@data
	mov ds,ax
	
	; get input 1
	
	mov ah,09h
	mov dx, offset m1
	int 21h
	
	mov ah,01h
	int 21h
	sub al,48
	mov n1,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	;get input 2
	
	mov ah,09h
	mov dx, offset m2
	int 21h
	
	mov ah,01h
	int 21h
	sub al,48
	mov n2,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	;get sum
	
	mov dx,offset m3
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
	
	;get Sub
	
	mov dx,offset m4
	mov ah,09h
	int 21h
	
	mov dl,n1
	sub dl,n2
	add dl,48
	
	mov ah,02h
	int 21h
	
mov ax,4c00h
int 21h
end