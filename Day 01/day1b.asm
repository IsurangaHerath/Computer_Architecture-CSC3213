; Print integer and string together

.model small
.stack 100h

.data
n1 db 2
msg db "number $"

.code
	start:
	mov ax,@data
	mov ds,ax

	mov dl,n1
	add dl,48
	mov ah,02h
	int 21h

	mov dx,offset msg
	mov ah,09h
	int 21h

	mov ax,4c00h
	int 21h
	end start
