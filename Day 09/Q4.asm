;Sum of first 5 numbers
.model small
.stack 100h
.data
msg db 'Sum = $'
newline db 13,10,'$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov cl, 5      
    mov bl, 1      
    mov al, 0      

sum_loop:
    add al, bl     
    inc bl         
    loop sum_loop  

   
    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov ah,00
    mov bl, 10      
    div bl          
                    
    add al,48     
    mov dl, al
    mov ah, 02h
    int 21h

    mov al, ah      
    add al, 48     
    mov dl, al
    mov ah, 02h
    int 21h

    ; -------- Newline ----------
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h
end main
