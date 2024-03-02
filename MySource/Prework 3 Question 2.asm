name "Prework 3 Question 1 Alperen Enes Efe 21947201"

org 100h
MAIN PROC FAR
    
        MOV AX, 00C5BH  ;our value
        ROR AX,4
        CMP AL,0H 
        JA check  ;checks 2 '0' nibbles
        CALL exchange
        JMP finish 
        
check:
        CALL rotate
finish:
        int 20h

MAIN ENDP

exchange PROC 
            
        ROL AX,4
        ROR AL, 4 ;inverting AL
        ROR AH, 4 ;inverting AH
        XCHG AL , AH
ret

ENDP first
rotate PROC 
    
        ROL AX,4
        ROR AX, 4 ;rotating AX to right by one nibble
        XCHG AL, BL ;exchancing AL and BL since MOV command is forbidden
        ROR AX,4
        ROL AH,4
        ROR AL,4
        ROL BX,4
        OR AX,BX ;adding BX and AX
ret

ENDP rotate