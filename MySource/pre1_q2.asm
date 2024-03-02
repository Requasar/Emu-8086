name "preliminary1_question3" ;Alperen Enes Efe 21947201

org 100h

MOV AL, 01101110b ;Moves 6Ah to AL. We have 4 zeros.
MOV CX,8d         ;Moves 8d to CX for loop parameter.

count: TEST AL,10000000b  ;Tests LSB.
       JNZ zero           ;Jump the zero labelsss if ZF is 0.
       INC AH             ;Increaments AH to find the number of zeros.
zero: SHL AL,1            ;When LSB are in the match shifts lefts for 1 bit.

loop count                ;Works until CX equals to zero.


ret




