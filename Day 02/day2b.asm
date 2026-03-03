;Get user input

.model small
.stack 100h

.data
    msg db "Enter a character: $"
	n1 db 0
	
.code

    mov ax, @data
    mov ds, ax

    ; Display message
    mov ah, 09h
    mov dx, offset msg
    int 21h

    ; Take input
	mov dl,n1
    mov ah, 01h
    int 21h      ; character stored in AL

    mov ax,4c00h
    int 21h
end
