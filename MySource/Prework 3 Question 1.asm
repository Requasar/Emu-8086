name "Prework 3 Question 1 Alperen Enes Efe 21947201"

.MODEL SMALL
.STACK 100H

MAIN PROC
    MOV AX, 1A0Fh    ;Ex1 1 zero
    CALL FIND_OFFSET

    MOV AX, 0B00BH   ;Ex2  2 zero
    CALL FIND_OFFSET

    MOV AX, 0C000H   ;Ex3  3 zero
    CALL FIND_OFFSET

    MOV AX, 00F50H  ;Ex4   2 zero
    CALL FIND_OFFSET

    MOV AX, 0E000H   ; Ex5  3 zero
    CALL FIND_OFFSET

    MOV AH, 4CH ; Exit program
    INT 21H
MAIN ENDP

FIND_OFFSET PROC NEAR
    PUSH AX ; Save AX register value on stack

    MOV CX, 4 ; Loop counter for nibbles 
    XOR BX, BX ; Clearing

Loop0:
    ROL AX, 4 ; Rotate left by 4 bits
    CMP AL, 0 ; Check if low nibble is zero
    JNZ pass ; If not zero, skip incrementing BX register
    INC BX ;

pass:
    LOOP Loop0 ; Repeat for all nibbles
    POP AX ; Restore original value of AX register from stack
    MOV AH, 2H ; Print string function
    INT 21H ; Call interrupt to print message
    MOV AH, 2H ; Print offset function
    MOV DL, BL ; Load offset value into DL register (ASCII)
    ADD DL, 31h ; Converting
    INT 21H     ;print
    MOV DL, '$' ; EOL ($)
    INT 21H ; Call interrupt to print end of line character
RET
FIND_OFFSET ENDP

END MAIN
