;Arithmetic operators

.model small
.stack 100h

.data
n1 db 4
n2 db 2

msg1 db "Number 01: $"
msg2 db "Number 02: $"

msg_add db "Addition of num1 and num2: $"
msg_sub db "Subtraction of num1 and num2: $"
msg_mul db "Multiplication of num1 and num2: $"
msg_div db "Division of num1 and num2: $"

.code
	start:

	mov ax,@data
	mov ds,ax
	

	;number 1 print
	mov dx,offset msg1
	mov ah,09h
	int 21h

	mov dl,n1
	add dl,48
	mov ah,02h
	int 21h

	mov dl,10
	mov ah,02h
	int 21h
	

	;number 2 print
	mov dx,offset msg2
	mov ah,09h
	int 21h

	mov dl,n2
	add dl,48
	mov ah,02h
	int 21h

	mov dl,10
	mov ah,02h
	int 21h
	

	;addition print
	mov dx,offset msg_add
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
	

	;subtraction print
	mov dx,offset msg_sub
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
	

	;multiplication print
	mov dx,offset msg_mul
	mov ah,09h
	int 21h

	mov al,n1
	mul n2
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h

	mov dl,10
	mov ah,02h
	int 21h
	

	;division print
	mov dx,offset msg_div
	mov ah,09h
	int 21h

	mov al,n1
	mov ah,0  		; imp
	div n2
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h

	mov ax,4c00h
	int 21h
	end start
	
		
;Output

;Number 01: 4
;Number 02: 2
;Addition of num1 and num2: 6
;Subtraction of num1 and num2: 2
;Multiplication of num1 and num2: 8
;Division of num1 and num2: 2