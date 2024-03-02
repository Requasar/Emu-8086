name "preliminary1_question2"; Alperen Enes Efe 21947201

org 100h

MOV AL, 11111101b   ; There is zero at second bit.
MOV CX, 8d          ; CX is 8d because we want to loop 8 times.

count: INC AH       ;Increamenting AH by 1 for counting.
       TEST AL,00000001b; Test LSB's for AL register and 1d.
       JZ finish    ; If zero flag is 1 finishes the count loop.
       SHR AL,1     ; Shifts AL 1 bit to match the 1d.
       
loop count   ; It counts until CS equals to 0

finish: ret  ; It finishes the code.




                                                                     