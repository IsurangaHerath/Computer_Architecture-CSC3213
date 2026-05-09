.model small
.stack 100h
.data
  msg db "Hello world $"
  n db 5
.code

start:
  mov ax,@data
  mov ds,ax
  
  ;using the count register cl and moving n to cl
  
  mov cl,n
  lstart: ;label
  mov dx,offset msg ;to print the cl we are moving cl to dl (need to print the message then copy paste)
  
  mov ah,09h
  int 21h
  
  loop lstart ; looping back to start
  
  mov ax,4c00h
  int 21h
  
  end start