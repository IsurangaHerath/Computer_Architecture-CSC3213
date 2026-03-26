.model small
.stack 100h
.data
    n1 db 2
    n2 db 3
    msg db "Greatest number is $"

.code
main:
    mov ax,@data
    mov ds,ax

    mov al,n1
    mov bl,n2

    cmp al,bl
    jge FG

SG: ; Second number is greater
    mov dx,offset msg
    mov ah,09h
    int 21h

    mov dl,bl
    add dl,48
    mov ah,02h
    int 21h
    jmp EndProg

FG: ; First number is greater or equal
    mov dx,offset msg
    mov ah,09h
    int 21h

    mov dl,al
    add dl,48
    mov ah,02h
    int 21h

EndProg:
    mov ax,4c00h
    int 21h
end main
