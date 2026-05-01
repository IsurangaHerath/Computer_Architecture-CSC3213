;Print numbers from 5 to 1 using a loop.
.model small
.stack 100h
.data
    s db ' $'      

.code
main:
    mov ax, @data     
    mov ds, ax

    mov cl, 5          ; loop 5 times
    mov bl, 5          ; starting number (1)

print_loop:
    mov ah, 02h        
    mov dl, bl
    add dl, 48        
    int 21h            

    mov dx, offset s
    mov ah, 09h        
    int 21h            

    dec bl            
    loop print_loop   

    mov ax, 4c00h
    int 21h
end main
