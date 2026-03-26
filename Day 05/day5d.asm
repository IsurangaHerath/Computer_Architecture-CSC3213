.model small
.stack 100h
.data
	msg db '* $'

.code
	start:
	mov ax,@data
	mov ds,ax
	
	mov cl,5
	
	starp:
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	loop starp
	
	mov ax,4c00h
	int 21h
	
	end start