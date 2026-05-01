; Print even numbers from 2 to 9
.model small
.stack 100h
.data
msg db 'Even Number: $'
newline db 13, 10, '$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov cl, 9        ; Loop from 1 to 10
    mov bl, 1         ; Start number from 1

next_num:        
    mov al, bl       
    mov ah, 00
	mov dl,2
    div dl 
    cmp ah,0	
    jnz not_even      ; If not zero, it's odd — skip printing

    ; ----------- Print "Even Number: " ----------
    mov dx, offset msg
    mov ah, 09h
    int 21h

    ; ----------- Convert number to ASCII and print ----------
    
    mov al, bl        
    add al, 48       
    mov dl, al
    mov ah, 02h      
    int 21h

    ; ----------- Print Newline ------------
    mov dx, offset newline
    mov ah, 09h
    int 21h

not_even:
    inc bl            
    loop next_num

    ; ----------- Exit ------------
    mov ax, 4c00h
    int 21h
end main
