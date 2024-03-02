name "preliminary1_question1"; Alperen Enes Efe 21947201

org 100h

mov ah, 147d  ; 147 decimal moved to AH register.
mov al, 109d  ; 109 decimal moved to AL register.

add al,ah     ; AH added to al.
              ;Reulst is 256d, 100h, 100000000b.
              ;We have 1 in the MSB and other 8 bit is 0
              ;Our Carry flag and zero flag is 1.    

ret  ; It finishes the code.




                                                                     