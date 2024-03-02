name "Prework 4 Question 4 Alperen Enes Efe 21947201"

org 100h
.DATA

Lenght_Square DW 5 ;Lenght of Square Box 

first DB "Click to draw a square.",0Dh,0Ah, 24h
CenterX DW 0
CenterY DW 0


.CODE
mov al,12H      ;video mode
mov ah,0H
int 10H
int 10H
mov DX,OFFSET first
mov AH,9H
int 21H         ;Input String
 

Loop1:
            call Mouse
            call Square
            jmp Loop1
            int 20H
            ret

Square PROC
            MOV CX,CenterX
            MOV DX,CenterY
            MOV AL,10 
            MOV AH,0CH
            INT 10H 
            MOV BX,Lenght_Square
            SHR BX,1 
            SUB CX,BX
            SUB DX,BX
            MOV BX,Lenght_Square  

F:
            MOV AL,11
            MOV AH,0CH
            INT 10H
            INC CX
            DEC BX
            JNZ F
            MOV BX,Lenght_Square

S:
            MOV AL,12
            MOV AH,0CH
            INT 10H
            INC DX
            DEC BX
            JNZ S
            MOV BX,Lenght_Square
            
T:
            MOV AL,13
            MOV AH,0CH
            INT 10H
            DEC CX
            DEC BX
            JNZ T
            MOV BX,Lenght_Square

Fr:
            MOV AL,14
            MOV AH,0CH
            INT 10H
            DEC DX
            DEC BX
            JNZ Fr
ret
Square ENDP  

Mouse PROC
MOV AX,0
INT 33H
MOV AX,1
INT 33H
MouseInput:
MOV AX,3
INT 33H
CMP BX,1 ;comparing input BX with Left Click
JE Left_Click
CMP BX,2 ;comparing input BX with Right Click
JMP MouseInput
Left_Click:
SHR CX,1
MOV CenterX,CX
MOV CenterY,DX
ret
Mouse ENDP