name "PARTD" ;336 Pre Work Part D Alperen Enes Efe 21947201
org 100h
jmp start1
msg: db   "336preworkPartD string was processed, press a key to exit",0Dh,0Ah,24h        
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
               cmp al, 82      ;82 is decimal expression of R 
               je r_click      ;If we click R it jumps to r_click function 
               
               mov dl,255      
               mov ah,6        
               int 21h         
               cmp bl, 1        
               je mouse_click  ;If we click mouse it jumps to mouseclick function                                        
               
               mov dl,255      
               mov ah,6        
               int 21h         
               cmp bl, 2       ;for right click 
               je mouse_click
               
               mov dl,255      
               mov ah,6       
               int 21h         
               cmp bl, 3       ;for right and left click simultaneously 
               je mouse_click               
check_esc_key:
               mov dl, 255
               mov ah, 6
               int 21h
               cmp al, 27       ;esc button's decimal expression
               jne Button_check
               jmp finish              
r_click:       
               mov bx,0900h      ;To change adress
               mov ds,bx     
               mov [0010h], 'D'        
               mov [0011h], 't'
               mov [0012h], 'r'
               mov [0013h], 'a'
               mov [0014h], 'P'
               mov [0015h], 'k'
               mov [0016h], 'r'
               mov [0017h], 'o'
               mov [0018h], 'w'
               mov [0019h], 'e'
               mov [001Ah], 'r'
               mov [001Bh], 'p'
               mov [001Ch], '6'
               mov [001Dh], '3'
               mov [001Eh], '3'
               mov bx,0700h      ;I Change adress again because It gives                                  
               mov ds,bx
               jmp Button_check                          

start1:        ;mov dx, msg0 ; Shows MouseLeftKeyClick'de message
              ; mov ah, 09h 
               ;int 21h
               mov bx,0900h      ;To change adress
               mov ds,bx
               mov [0000h], '3'             ;mouse left click string writing in memory
               mov [0001h], '3'
               mov [0002h], '6'
               mov [0003h], 'p'
               mov [0004h], 'r'
               mov [0005h], 'e'
               mov [0006h], 'w'
               mov [0007h], 'o'
               mov [0008h], 'r'
               mov [0009h], 'k'
               mov [000Ah], 'P'
               mov [000Bh], 'a'
               mov [000Ch], 'r'
               mov [000Dh], 't'
               mov [000Eh], 'D'
               mov bx,0700h      ;I Change adress again because It gives                                  
               mov ds,bx
               jmp Button_check

mouse_click:   mov dx, msg    ;to pring our message I use 21h
               mov ah, 09h 
               int 21h
               mov ax,0
               mov ah,00h   
               int 16h      ;with this code we want input from keyboard and ASCII goes AL          

finish:               
ret 