mov ah,0
mov al,12h
int 10h
int 10h

mov ah,0ch
mov al, 10
mov cx,30
mov dx,50
int 10h

mov bl,70 

fline:
int 10h
inc cx
dec bl
jnz fline

mov bl,40
secline:
int 10h
inc dx
dec bl
jnz secline 

mov bl,70
trdline:
int 10h
dec cx
dec bl
jnz trdline

mov bl,40
fourthline:
int 10h
dec dx
dec bl
jnz fourthline


mov cx,130
mov dx,80
int 10h 

mov bl,70
fline2:
int 10h
inc cx
dec bl
jnz fline2

mov bl,40
secline2:
int 10h
inc dx
dec bl
jnz secline2 

mov bl,70
trdline2:
int 10h
dec cx
dec bl
jnz trdline2

mov bl,40
fourthline2:
int 10h
dec dx
dec bl
jnz fourthline2 

