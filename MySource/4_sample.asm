name "pre_q1" ; Alperen Enes Efe 21947201

org 100h

MOV AH, 200d ;200 decimal moved to AH register
MOV AL, 56d  ;56 decimal moved to AL register

ADD AL,AH  ;AH and AL added then moved to AL register.
            ;Result is 256d or 100h or 100000000b.
            ;We have 1 in the MSB and other 8 bit is zero. So carry flag and the zero flag is 1.


ret




