name "Experiment 4 Alperen Enes Efe21947201"

.model small
.stack 100h

.data
    msg1 db 'Enter S for square or T for triangle:', '$'
    msg2 db 'Enter height of shape:', '$'
    msg3 db 'It is not a valid input', '$'

.code
main proc
    mov ax, @data
    mov ds, ax

    call get_shape_type 

    mov ah, 4ch 
    int 21h

main endp


get_shape_type proc
    mov ah, 9 
    lea dx, msg1
    int 21h

    mov ah, 1 ;get character from user
    int 21h

    cmp al, 's' ;if s or S then print square
    je print_square

    cmp al, 't' ;if t or T then print triangle
    je print_triangle

    lea dx, msg3 ;if invalid,error message 
    mov ah, 9
    int 21h

    call get_shape_type ;ask again if invalid input

get_shape_type endp

print_square proc
    mov ah, 9 ;display message 
    lea dx, msg2
    int 21h

    mov ah, 1 ;get height of square from user
    int 21h
    
    sub al,'0' ;convert ascii value to decimal value
    
    mov bl, al ;store height in bl register

    mov cx, 0 ;initialize counter to zero
    mov dx,0
    mov ax,0
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H    
    MOV Cl,bl
    ;MOV BX,5
        
    L1:
    PUSH CX
    MOV Cl,bl
       
    L2:
     MOV AH,2
     MOV DL,'*'
     INT 21H
       
     LOOP L2
     
     MOV AH,2
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H
          
    POP CX                   
       LOOP L1
    EXIT:
    MOV AH,4CH
    INT 21H
    


print_square endp 

 
print_triangle proc 
mov ah,9 
lea dx,msg2 
int 21h 

mov ah,1 
int 21h 

sub al,'0' ;convert ascii value to decimal value
    
mov bl,al 

mov cx,bx 

mov bx,cx

MOV BX,1

MOV AH,2
MOV DL,10
INT 21H
MOV DL,13
INT 21H    
   
Li1:
    PUSH CX
    MOV AH,2
    MOV DL,32
Li2:
    INT 21H
    LOOP Li2         
    MOV CX,BX        
    MOV DL,'*' 
Li3:
   INT 21H
   LOOP Li3
   
   MOV AH,2
   MOV DL,10
   INT 21H
   MOV DL,13
   INT 21H
   
   INC BX ;to make triangle we should increase bx 2 times   
   INC BX       
   POP CX   
   LOOP Li1            

    MOV AH,4CH
    INT 21H 

jmp exit_triangle 


invalid_input: 
mov ah,9 
lea dx,msg3 
int 21h 
call get_shape_type 


exit_triangle: 
ret 


print_triangle endp 


end main 