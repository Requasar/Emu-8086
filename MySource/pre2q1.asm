name "Prework 2 Alperen Enes Efe 21947201"
org 100h
INDATA DB 10 DUP(?)
OUTDATA DB 10 DUP(?)

.CODE

    MAIN PROC FAR        
    MOV AX, 0800h
    MOV DS,AX 
    MOV AH, 09H
    INT 21H
    MOV DI, OFFSET INDATA ;moves offsets of the indata and outdata
    MOV SI, OFFSET OUTDATA ;to index registers DI,SI

input: 

    MOV AH,01H ;waits until a single char input from keyboard
    INT 21H ;saves input char to AL
    MOV [DI],AL ;send input data to indata
    CMP AL,0DH ;compares if user pressed 'enter'
    JE show ;when pressed enter jumps to display
    XOR AL,20H ;converts uppercase to lowercase and vice versa
    MOV [SI],AL ;moves new chars to outdata
    INC SI
    JMP input

show:
    MOV AL, '$'
    MOV [SI],AL
    MOV AH,09H ;displays second message
    INT 21H
    MOV AH,09H
    MOV DX, OFFSET OUTDATA
    INT 21H
MAIN ENDP