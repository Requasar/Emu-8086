;Program to track mouse movement and draw a simple box as mouse cursor

.model small
.stack 100h

.data
msg1 db 'Press left mouse button to draw',0dh,0ah,'$'

.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,0 ;reset mouse
    int 33h

    mov ax,1 ;show mouse cursor
    int 33h

    mov ah,2 ;get mouse position
    int 33h

    mov [oldX],cx ;save old x position of mouse
    mov [oldY],dx ;save old y position of mouse

    mov ah,0 
    int 10h

    lea dx,msg1 
    mov ah,09h
    int 21h

detect_mouse:
    mov ax,3 ;get mouse status
    int 33h

    test bx,1 
    jz detect_mouse 

draw_box:
    call draw_cursor ;draw box at current mouse position

exit:
    mov ah,4ch ;exit program
    int 21h

draw_cursor proc near
    mov ax,0b800h ;set video segment address (text mode)
    mov es,ax

    xor cx,cx ;initialize cx register to zero (cx will be used as counter)

draw_row:
    push cx ;save cx register value on stack (to use it later)

    xor dx,dx ;initialize dx register to zero (dx will be used as counter)

draw_pixel:
    mov al,'+' 
    mov ah,0ch 
    mov di,dx ;calculate offset in video memory (di = y * 160 + x * 2)
    shl dx,1
    add di,dx
    add di,cx
    add di,cx


mov bh,b.[oldY] 
shr bh,1 
sub bx,cx  

mov bl,b.[oldX] ;old x position of mouse (in pixels)
shr bl,1 
sub bx,dx ;subtract dx register value from half width (to get leftmost column of box)

mov [bx],di ;save offset in video memory for current pixel position

inc dx ;increment dx register value (to get next pixel position in row)

cmp dx,bx ;compare dx register value with bx register value (to check if last pixel in row)

jne draw_pixel ;if not last pixel then draw next pixel

pop cx ;restore cx register value from stack (to use it later)

inc cx ;increment cx register value (to get next row)

cmp cx,bx ;compare cx register value with bh register value (to check if last row)

jne draw_row ;if not last row then draw next row

mov [oldX],bx ;save new x position of mouse for next iteration
mov b.[oldY],bh ;save new y position of mouse for next iteration

ret
draw_cursor endp

;.data?
oldX dw ?
oldY dw ?

end main
