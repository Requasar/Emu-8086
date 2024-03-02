name "ELE336 Final Prework Question 1 Alperen Enes Efe 21947201"
org 100h
.DATA
msg0 db 'ELE336 Final Prework Code : Please enter the first letter of your firstname in uppercase', '$'
msg1 db 'You have entered ','$'
button db ?

.CODE
mov al,12H      ;video mode
mov ah,0
int 10H
int 10H

mov ah, 9 
lea dx, msg0
int 21h
     MOV AH,2
     MOV DL,10
     INT 21H
     MOV DL,13
     INT 21H         ;to move next line
Button_check:  
               mov ah, 1 ;get height of square from user
               int 21h              
               cmp al,'a'
               jb upper_case   ;If the input ASCII value less than'a' it is upercase
               sub al,20h      ;converts lowercase to upper case                              
upper_case: 
            MOV [button],AL  ;We store uppercase version to adress button
            MOV AH,2
            MOV DL,10
            INT 21H
            MOV DL,13
            INT 21H 
            mov ah, 9 
            lea dx, msg1
            int 21h
            mov ah,02h
            mov dl,[button]
            int 21h                                                
Loop1:
            call Mouse            
            jmp Loop1
            int 20H
            ret
Mouse PROC
MOV AX,0
INT 33H
MOV AX,1
INT 33H
MouseInput:
MOV AX,3
INT 33H
CMP BX,1            ;comparing input BX with Left Click
JE Left_Click
CMP BX,2            ;comparing input BX with Right Click
JE Left_Click
JMP MouseInput
Left_Click:
Rectangle:        ;with this part I draw rectangles
    mov ah,0ch
    mov al, 10
    mov cx,0100h    ;50x50 rectangle
    mov dx,80h
    int 10h    
    mov bl,50
fline:
    int 10h
    inc cx
    dec bl
    jnz fline

mov bl,50
secline:
int 10h
inc dx
dec bl
jnz secline 

mov bl,50
trdline:
int 10h
dec cx
dec bl
jnz trdline

mov bl,50
fourthline:
int 10h
dec dx
dec bl
jnz fourthline         ;that means mouse clicked left 
triangle:        ;with this part I draw rectangles
    mov ah,0ch
    mov al,15    ;white color
    mov cx,0100h    ;row
    mov dx,00b1h    ;column
    int 10h    
    mov bl,25
firstline:
    int 10h
    inc cx
    dec dx
    dec dx
    dec bl
    jnz firstline
mov bl,25
secondline:
int 10h
    inc cx
    inc dx
    inc dx
    dec bl
jnz secondline
    mov ah,0ch
    mov al,15    ;white color
    mov cx,010dh    ;row
    mov dx,0097h    ;column
    int 10h 
mov bl,24
thirdline:
int 10h
inc cx
dec bl
jnz thirdline
hlt