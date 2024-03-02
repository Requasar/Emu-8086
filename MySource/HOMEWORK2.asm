name "Question B TASK 1 Convert angle to radiant Alperen Enes Efe 21947201"  

number db 0d, 1d

mov al,number     ;I wrote this part because program doesn't see first assigment
mov al,number[1]  ; Here we give our degree to AL to compare with 57
mov bx,0700h      ;we change our adress to 0700:0000
mov ds,bx

first:  cmp al, 57
        jae Five_digit  ;if al less then 57 we will work for 4 digit then jump to end
        mov bx,30h
        mov [0010h],bx  ; for 4 digit our radian less than zero so ones digit=0 
        mov bx, 31416d  ; pi times 10^4 to get 3 digit after decimal point
        mul bx
        mov cx,180d
        div cx
        
Four_digit: mov dx,0
            mov bx,1000
            div bx
            add AL,30h ;here we find ascii version of first digit after decimal point
            mov [0012h],AL
            mov ax,dx
            mov dx,0
            mov bx,100
            div bx
            add AL, 30h ;here we find ascii version of 2'nd digit after decimal point
            mov [0013h],AL
            mov ax,dx
            mov dx,0
            mov bx,10
            div bx
            add AL, 30h   ;here we find ascii version of 3'rd digit after decimal point
            mov [0014h],AL
            jmp show_schoolnumber  ;our code for 4 digit ends here

Five_digit: mov bx,31h            ;if our number has 5 digit we come here
            mov [0010h],bx
            mov bx, 31416d     
            mul bx                       
            mov cx, 180d               
            div cx                    
            sub ax, 10000d       ;with these sub command our number is 4 digit
            jmp Four_digit       ;and it can go Four_Digit Function

show_schoolnumber:  mov AL,30h       ; my numbers right most 2 digit is 01
                    mov AH,31h 
                    mov [0000h],AL
                    mov [0001h],AH  
                    mov [0011h],'.'
hlt
