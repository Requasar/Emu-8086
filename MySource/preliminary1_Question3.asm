name "preliminary1_question3" ; Alperen Enes Efe 21947201

org 100h

MOV AL, 01101110b ;Moves 6Ah to AL. We have 3 zeros.
MOV CX,8d         ;Moves 8d to CX for loop paramter.

count: TEST AL,10000000b ; It's for LSB.  
       JNZ zero          ;Jumps to zero label if ZF is 0.
       INC AH            ;Increaments AH to find the number of zeros.
zero: SHL AL,1           ;When LSB's are in match shifts lefts for 1 bit.

loop count               ;loops until CX become zero.

ret  ;it finishes the code.