name "Experiment 4 Alperen Enes Efe 21947201"

org 100h
.DATA

Lenght_Square DW 5 ;Lenght of Square Box 

first DB "You clicked left rectangle.",0Dh,0Ah, 24h
sec db "You clicked right rectangle", 0dh,0AH,24h


.CODE
mov al,12H      ;video mode
mov ah,0
int 10H
int 10H


Rectangle:        ;with this part I draw rectangles
    mov ah,0ch
    mov al, 10
    mov cx,30
    mov dx,50
    int 10h
    
    mov bl,70
fline:
    int 10h
    inc cx
    dec bl
    jnz fline

mov bl,40
secline:
int 10h
inc dx
dec bl
jnz secline 

mov bl,70
trdline:
int 10h
dec cx
dec bl
jnz trdline

mov bl,40
fourthline:
int 10h
dec dx
dec bl
jnz fourthline

                   ;after this part I draw second rectangle
mov cx,130
mov dx,80
int 10h 

mov bl,70
fline2:
int 10h
inc cx
dec bl
jnz fline2

mov bl,40
secline2:
int 10h
inc dx
dec bl
jnz secline2 

mov bl,70
trdline2:
int 10h
dec cx
dec bl
jnz trdline2

mov bl,40
fourthline2:
int 10h
dec dx
dec bl
jnz fourthline2
 

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
JMP MouseInput
Left_Click:         ;that means mouse clicked left 



mov bx,3CH
cmp cx,bx                     ;left side of first rectangle
jl second_check

mov bx,0c8h                    ;right side of first rectangle
cmp cx,bx
jg second_check

mov bx,032h                     ;top side of first rectangle
cmp dx,bx
jl second_check

mov bx,59h                     ;bottom side of first rectangle
cmp dx,bx
jg second_check
                        
mov dx, offset first    ;if there is no problem for clicking in first rectangle
mov ah, 09h             ;it gives information about it
int 21h

second_check:
mov bx, 0h              ;to use checking I clear bx
mov bx,0104h            ;left side of second rectangle
cmp cx,bx
jl finish

mov bx,0190H            ;right side of second rectangle
cmp cx,bx
jg finish

mov bx,50h
cmp dx,bx               ;top side of second rectangle
jl finish

mov bx,77h
cmp dx,bx               ;bottom side of second rectangle
jg finish

mov dx, offset sec              ;if everything is okay for second rectangle it prints
mov ah, 09h              ;you clicked second rectangle
int 21h                         
finish:
ret
Mouse ENDP