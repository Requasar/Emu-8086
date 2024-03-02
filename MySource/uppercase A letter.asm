
mov al,12H      ;video mode
mov ah,0
int 10H
int 10H
triangle:        ;with this part I draw rectangles
    mov ah,0ch
    mov al,15    ;white color
    mov cx,0100h    ;row
    mov dx,00b1h    ;column
    int 10h
    
    mov bl,25
fline:
    int 10h
    inc cx
    dec dx
    dec dx
    dec bl
    jnz fline

mov bl,25
secline:
int 10h
    inc cx
    inc dx
    inc dx
    dec bl
jnz secline

    mov ah,0ch
    mov al,15    ;white color
    mov cx,0109h    ;row
    mov dx,00a0h    ;column
    int 10h 

mov bl,32
trdline:
int 10h
inc cx
dec bl
jnz trdline