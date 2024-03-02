name "Task 8- 3 Digits Alperen Enes Efe 21947201"
  
ORG 100h

mov AH,219d
mov BX, 472d   ; This needs 12 bit so i store it BX not H or L
mov AL, 01d 


first:  cmp AL,255
        jae overflow 
        add DL, AL    ; we add 219 to DX 
                      

second: cmp BX,255    ; 472 is greater than 255 so overflow happens
        jae overflow  ; we jump to overflow part and program halts.
        add DX, BX    ; we add 472 to DL

third:  mov AH,0
        mov BX,100d
        mul BX
        cmp AX,255          
        jae overflow        
        add DL, AL 




mov ax,0800h
mov ds,ax           ;Let say there is no overflow:
mov [0000h], DX     ;We store our result which is 219+472+100= 791 = 317 in hexa
       
mov AX,DX
mov CL,3d           ; we are dividing by 3 because there are 3 numbers
div CL
mov BH, AL          ; our Quotient goes to BH, 691/3 = 263 = 107 in hexadecimal
mov BL, AH          ; our Remainder goes to BL, 791-(263*3) = 2 =2 in hexa form

overflow:

HLT  