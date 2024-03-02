"Alperen Enes Efe 21947201"

org 100h

mov ax, 0800h  ;In this part our adress goes to 0800h
mov ds, ax

mov AL, 21h
mov AH, 94h
mov [0000h], ax ;With this part we wrie ax and it first writes AL then AH
                ;First 2 byte of my number is saved here
mov al, 72h
mov ah, 01h
mov [0002h], ax ;And this part is saves 7201 data in 0002h and 0003h byte memory

ret
