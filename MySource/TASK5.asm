name "Task 5- ACII Alperen Enes Efe 21947201"
  
ORG 100h

mov ax,0800h
mov ds,ax

mov AL,02h
mov Ah,01h
mov [0000h],ax ;We are adding digit by digit to memory
push AX        ;I push the values to use later

mov al,09h
mov ah,04h
mov [0002h],ax

PUSH AX

mov al,07h
mov ah,02h
mov [0004h],ax 

PUSH AX

mov al,00h
mov ah,01h
mov [0006h],ax

PUSH AX

mov ax,0802h
mov ds,ax ;We are changing our adress to 0802:0000 

POP AX    ;We are getting the value that we store but we first get 0001h
add AL,30h
add AH,30h ;we are converting our hexadecimal digit to ASCII by adding 30h
mov [0006h],ax ; With POP command we start to get our data from top so
POP AX         ;I am going to write ASCII codes right to left
add AL,30h
add AH,30h
mov [0004h],ax
POP AX
add AL,30h
add AH,30h
mov [0002h],ax
POP AX
add AL,30h
add AH,30h
mov [0000h],ax
ret   