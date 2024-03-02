name " Question C Mouse and button Check Alperen Enes Efe 21947201"
org 100h
jmp start
number1 db 21h,94h,72h,01h
msg0: db   "MouseLeftKeyClick",0Dh,0Ah,24h
msg: db "Code for Homework 3, hit N key for your number, or click mouse left key to display MouseLeftKeyClick", 0Dh,0Ah, 24h
msg1: db "21947201",0Dh,0Ah,24h
start:  mov dx, msg
        mov ah, 09h 
        int 21h      ;with msg and int 21h we write Code For Homework 3 string        
Button_check:  
               mov ax,3
               mov bx,0        ;Clearing data for mouse information
               mov cx,0
               mov dx,0
               int 33h
               mov ax,0
                               
               mov dl,255      
               mov ah,6        ;Command for int 21, program doesn't stop
               int 21h         
               cmp al, 78      ;78 is decimal expression of N 
               je number       ;If we click N it'is jumps to number function to print number
               
               mov dl,255      
               mov ah,6        ;Thanks to this part when we click N program stops
               int 21h         ;
               cmp bl, 1       ;78 decimal expression of N 
               je mouse_click       ;If we click N it'is jumps to number function                                        
check_esc_key:
               mov dl, 255
               mov ah, 6
               int 21h
               cmp al, 27       ;esc button's decimal expression
               jne Button_check
               jmp finish              
number:        mov dx, msg1
               mov ah, 09h 
               int 21h                        
               mov bx,0740h      ;To change adress
               mov ds,bx
               mov ax,msg1
               mov al,32h       ;my school number
               mov ah,31h       ;for memory view
               mov [0000h],ax 
               mov al,39h
               mov ah,34h
               mov [0002h],ax
               mov al,37h
               mov ah,32h
               mov [0004h],ax 
               mov al,30h
               mov ah,31h
               mov [0006h],ax
               mov bx,0700h      ;I Change adress again because It gives                                  
               mov ds,bx          ;an error when I try to type the same because of loop.     
               JMP Button_check    ;This part make code loop after printing school number                       
mouse_click:   mov dx, msg0 ; Shows MouseLeftKeyClick'de message
               mov ah, 09h 
               int 21h
               mov bx,0740h      ;To change adress
               mov ds,bx
               mov [0010h], 'M'             ;mouse left click string writing in memory
               mov [0011h], 'o'
               mov [0012h], 'u'
               mov [0013h], 's'
               mov [0014h], 'e'
               mov [0015h], 'L'
               mov [0016h], 'e'
               mov [0017h], 'f'
               mov [0018h], 't'
               mov [0019h], 'C'
               mov [001Ah], 'l'
               mov [001Bh], 'i'
               mov [001Ch], 'c'
               mov [001Dh], 'k'
               mov bx,0700h      ;I Change adress again because It gives                                  
               mov ds,bx
               jmp Button_check               
finish:               
ret 