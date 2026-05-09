; Program to print square numbers from 1 to 100

.model small
.stack 100h
.data
msg db 'square numbers from 1 to 100: $'
newline db 10, '$'
r db 0 
r1 db 0
r2 db 0    

.code
main:
    mov ax, @data
    mov ds, ax

    mov dx, offset msg
    mov ah, 09h
    int 21h

   mov dx, offset newline
    mov ah, 09h
    int 21h
	
    mov cl, 10         
    mov bl, 1         

next_num:
    mov al, bl         
    mul bl             


  cmp al,10
  jl digone
  jge digit
     
digone:
mov dl,al
add dl,48
mov ah,02h
int 21h
jmp move	

digit:
cmp al,100
je digit3

mov dl,10
mov ah,00
div dl
mov r,ah
mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,r
add dl,48
mov ah,02h
int 21h
jmp move

digit3:
mov dl,100
mov ah,00
div dl
mov r1,ah
mov dl,al
add dl,48
mov ah,02h
int 21h

mov al,r1
mov dl,10
mov ah,00
div dl
mov r2,ah

mov dl,al
add dl,48
mov ah,02h
int 21h


mov dl,r2
add dl,48
mov ah,02h
int 21h
jmp move

move:
   
    mov dx, offset newline
    mov ah, 09h
    int 21h

    inc bl
    loop next_num

    
    mov ax, 4C00h
    int 21h

end main
