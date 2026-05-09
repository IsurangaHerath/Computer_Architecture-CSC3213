.model small
.stack 100h
.data
	msg1 db "Enter the number : $"
	h db 0
	t db 0
	o db 0
	n1 db 0
	d db 0
	d1 db 0
	n2 db 0
	msg2 db "The number is a palindrome.$"
	msg3 db "The number is not a palindrome.$"
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

	mov h,al

	mov ah,01h
	int 21h
	sub al,48

	mov t,al

	mov ah,01h
	int 21h
	sub al,48

	mov o,al

	mov al,h
	mov bl,100
	mul bl
	mov n1,al
	mov al,t
	mov bl,10
	mul bl
	add al,n1
	add al,o

	mov d,al
	;reverse
	mov al,o
	mov bl,100
	mul bl
	mov n2,al
	mov al,t
	mov bl,10
	mul bl
	add al,n2
	add al,h

	mov d1,al

	mov dl,10
	mov ah,02h
	int 21h

	mov al,d1
	cmp al,d
	je palindrome

	;else
	mov dx,offset msg3 
	mov ah,09h
	int 21h
	jmp endd

	palindrome:
	mov dx,offset msg2
	mov ah,09h
	int 21h
	jmp endd

	endd:
	mov ax,4c00h
	int 21h
  
end start