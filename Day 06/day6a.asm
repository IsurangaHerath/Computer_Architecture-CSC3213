.model small
.stack 100

.data
	msg1 db "Enter marks 1: $"
	msg2 db "Enter marks 2: $"
	msg3 db "Enter marks 3: $"
	msg4 db "Average: $"
	msg5 db "pass $"
	msg6 db "Fail $"
	
	m11 db 0
	m12 db 0
	m21 db 0
	m22 db 0
	m31 db 0
	m32 db 0
	
.code
start:
	mov ax,@data
	mov ds,ax
	
	;-----get 1 mark-----

	mov dx, offset msg1
	mov ah,09h
	int 21h 
	
	mov ah,01h
	int 21h
	sub al,48
	mov m11,al
	
	mov ah,01h
	int 21h
	sub al,48
	mov m12,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	;-----get 2 mark-----
	
	mov dx, offset msg2
	mov ah,09h
	int 21h 
	
	mov ah,01h
	int 21h
	sub al,48
	mov m21,al
	
	mov ah,01h
	int 21h
	sub al,48
	mov m22,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	;-----get 3 mark-----
	
	mov dx, offset msg3
	mov ah,09h
	int 21h 
	
	mov ah,01h
	int 21h
	sub al,48
	mov m31,al
	
	mov ah,01h
	int 21h
	sub al,48
	mov m32,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
		
end start