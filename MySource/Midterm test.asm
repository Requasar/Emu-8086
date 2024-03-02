name "Task 4- Avarage value of schools number digits Alperen Enes Efe 21947201"
  
ORG 100h


mynumber DB 2h,1h,9h,4h,7h,2h,0h,1h ;Here I save my numbers data in mynumber
ADD DL, mynumber[0]   ;mynumber[0] is equal to 2h and I add it to DX
ADD DL, mynumber[1]   ;mynumber[1] is equal to 1h and I add it to DX
ADD DL, mynumber[2]   ;mynumber[2] is equal to 9h and I add it to DX
ADD DL, mynumber[3]   ;mynumber[3] is equal to 4h and I add it to DX
ADD DL, mynumber[4]   ;mynumber[0] is equal to 2h and I add it to DX
ADD DL, mynumber[5]   ;mynumber[1] is equal to 1h and I add it to DX
ADD DL, mynumber[6]   ;mynumber[2] is equal to 9h and I add it to DX
ADD DL, mynumber[7]   ;mynumber[3] is equal to 4h and I add it to DX
ADD DL, mynumber[8]   ;mynumber[3] is equal to 4h and I add it to DX

mov ax,0800h ;Here I make bx 0800h to make our adress 0800:0000 
mov ds,ax    ;Adress changes to 0800:0000
 
MOV [0010h],DX  ;we put our result DX 2+1+9+4+7+2+0+1=26h=1AH to 0800:0010


mov AX,DX   ;We move our result into AX 
mov CL,9h   ;There are 9 numbers
div CL      ;With Div command Quatient goes to AL remainder goes to AH
mov BH,AL   ;Our Quotient goes to BH, Quatient->  26/9= 2
mov BL,AH   ;Our remainder goes to BL Remainder-> 26-(9*2)= 8

HLT