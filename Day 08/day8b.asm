.model small
.stack 100h

.data
    msgA    db "Grade: A",13,10,"$"
    msgB    db "Grade: B",13,10,"$"
    msgC    db "Grade: C",13,10,"$"
    msgD    db "Grade: D",13,10,"$"
    msgF    db "Grade: Fail",13,10,"$"
    markm    db "Enter the Marks:$"
	mh db 0
	mt db 0
	mo db 0
	m1 db 0
	mark db 0

.code
start:
    mov ax, @data
    mov ds, ax
	
 ;read marks
  mov dx,offset markm 
  mov ah,09h
  int 21h
  
  mov ah,01h
  int 21h
  sub al,48
  
  mov mh,al
  
  mov ah,01h
  int 21h
  sub al,48
  
  mov mt,al
  
  mov ah,01h
  int 21h
  sub al,48
  
  mov mo,al
  
  mov al,mh
  mov bl,100
  mul bl
  mov m1,al
  mov al,mt
  mov bl,10
  mul bl
  add al,m1
  add al,mo

  mov mark,al
  
  
  mov dl,10
  mov ah,02h
  int 21h   
 
    mov al,mark
    cmp al, 90
    jae gradeA          ; If mark ≥ 90

    cmp al, 75
    jae gradeB          ; If mark ≥ 75

    cmp al, 60
    jae gradeC          ; If mark ≥ 60

    cmp al, 50
    jae gradeD          ; If mark ≥ 50

    ; Else, mark < 50
    mov dx, offset msgF
    mov ah, 09h
    int 21h
    jmp endd

gradeA:
    mov dx, offset msgA
    mov ah, 09h
    int 21h
    jmp endd

gradeB:
    mov dx, offset msgB
    mov ah, 09h
    int 21h
    jmp endd

gradeC:
    mov dx, offset msgC
    mov ah, 09h
    int 21h
    jmp endd

gradeD:
    mov dx, offset msgD
    mov ah, 09h
    int 21h
    jmp endd

endd:
    mov ax, 4C00h
    int 21h

end start
