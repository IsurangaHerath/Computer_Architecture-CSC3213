.model small
.stack 100h
.data
	n1 db 65
	n2 db 97
	s1 db "    $"
	lower db 0
	input1 db ?
	msg1 db "Uppercase Alphabet $" 
	msg2 db "Lowercase Alphabet $"
	msg3 db "Enter a character : $"
	msg4 db "This is an Uppercase Letter !!! $"
	msg5 db "This is a Lowercase Letter !!!$"
	msg6 db "Wrong Input !!! $"
	msg7 db "The Lowercase Letter  of your input is : $"
	msg8 db "The Uppercase Letter  of your input is : $"
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	mov dl,0ah
	mov ah,02h
	int 21h
	int 21h
	
	
	mov cl,26
			start:
				mov dl,n1
				
				mov ah,02h
				int 21h
				
				mov dx,offset s1
				mov ah,09h
				int 21h
				
				inc n1
				
			loop start
			
	call newLine
	call newLine
	
	mov dx,offset msg2
	call print_str
	
	call newLine
	
	mov cl,26
			start2:
				mov dl,n2
				
				mov ah,02h
				int 21h
				
				mov dx,offset s1
				call print_str
				
				inc n2
				
			loop start2
			
	call newLine
	call newLine

	mov dx,offset msg3
	call print_str

	mov ah,01h
	int 21h
	
	mov input1,al
	cmp input1,65
	
	jge  check1
	jl   check3
	
	check1:
		cmp input1,90
		jg  check2
		call newLine
		mov dx,offset msg4
		call print_str
		
		call newLine
		
		mov dx,offset msg7
		call print_str
		
			 sub input1,48
			 mov dl,input1
			 add dl,32
			 call print_int
			
		jmp endnn
		
	check2:
		cmp input1,97
		jge check4
		jl check3
		
		
	check4:	
		cmp input1,122
		jg check3
		call newLine
		mov dx,offset msg5
		call print_str
		
		call newLine
		
		mov dx,offset msg8
		call print_str
		
			 sub input1,48
			 mov dl,input1
			 sub dl,32
			call print_int
			
		jmp endnn
	check3:
		call newLine
		mov dx,offset msg6
		call print_str
		jmp endnn
		
		endnn:
		
mov ax,4c00h
int 21h
 proc newLine
	mov dl,10
	mov  ah,02h
	int 21h
 ret
 endp
 
 proc print_int
	add dl,48
	mov ah,02h
	int 21h
 ret
 endp
 
  proc print_str
	mov ah,09h
	int 21h
 ret
 endp
end	



Uppercase Alphabet
A    B    C    D    E    F    G    H    I    J    K    L    M    N    O    P    Q    R    S    T    U    V    W    X    Y    Z

Lowercase Alphabet
a    b    c    d    e    f    g    h    i    j    k    l    m    n    o    p    q    r    s    t    u    v    w    x    y    z

Enter a character : A

This is an Uppercase Letter !!!
The Lowercase Letter  of your input is : a