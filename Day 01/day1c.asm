;Break line

.model small
.stack 100h

.data
msg db "Hello",10,"world $" ;10 mean new line
;msg db "Hello",10,"hi $"    Hillo

.code
start:
	mov ax,@data
	mov ds,ax

	mov dx,offset msg
	mov ah,09h
	int 21h

	mov ax,4c00h
	int 21h
	end start
