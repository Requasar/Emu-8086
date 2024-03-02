name "Exp 2-3  Alperen Enes Efe 21947201"

org 100h

POINTS DB 57,46,58,48,93,63,67,74,70,40,89,99,72,98,43,90,73,95,65,87,71,76,95,60,54,60,100,58,77,86,69,85,57,59,98,75,50,67,95,96,85,62,52,80,54,100,74,54,44,54,73,51,48,100,75,48,99,99,81,88,53,100,82,80,40,95,90,77,44,46,72,41,82,45,50,57,90,43,82,58,55,46,77,98,56,92,82,93,62,60,'$' 


;99 kisi 40 ile 100 arasý notlar 36 bitiyor

.code
main proc
        mov ax,@data ; initialize DS register
        mov ds,ax

        mov si,offset POINTS ; move offset of POINTS into SI
        xor bx,bx ; clear BX register
        
mov cx,0
mov cl,99
loop_start1:
            lodsb  
              
                  ; I create different checks to calculate
        CMP AL,95 ;to find our exam result numbers
        Jg A1
        A01: 
        dec cx
        cmp cx,0
        jmp loop_start1
push bx
mov bx, 0
        
mov cx,0
mov cl,99
loop_start2:  
        
        CMP AL,90 
        Jg A2
        A02:
        dec cx
        cmp cx,0
        jmp loop_start2

push bx
mov bx, 0
        
mov cx,0
mov cl,99 
loop_start3:        
        
        CMP AL,85 
        Jg A3
        A03:
        dec cx
        cmp cx,0
        jmp loop_start3
        
mov cx,0
mov cl,99 
        
loop_start4:        
        CMP AL,80 
        Jg B1
        B01:
        dec cx
        cmp cx,0
        jmp loop_start4
        
mov cx,0
mov cl,99 
        
loop_start5:
        
        CMP AL,75 
        Jg B2
        B02:
        dec cx
        cmp cx,0
        jmp loop_start5
        
mov cx,0
mov cl,99 
        
loop_start6:        
        
        CMP AL,70 
        Jg B3
        B03:
        dec cx
        cmp cx,0
        jmp loop_start6
        
mov cx,0
mov cl,99 
        
loop_start7:        
        CMP AL,65 
        Jg C1
        C01:
        dec cx
        cmp cx,0
        jmp loop_start7
        
mov cx,0
mov cl,99 
        
loop_start8:       
        
        CMP AL,60 
        Jg C2
        C02: 
        dec cx
        cmp cx,0
        jmp loop_start8
        
mov cx,0
mov cl,99 

loop_start9:        
        
        CMP AL,55 
        Jg C3
        C03:
        dec cx
        cmp cx,0
        jmp loop_start9
        
mov cx,0
mov cl,99 
        
loop_start10:        
        CMP AL,50 
        Jg D
        D01:
        dec cx
        cmp cx,0
        jmp loop_start10
        
mov cx,0
mov cl,99 
        
loop_start11:        
        CMP AL,54 
        Jg F3
        dec cx
        cmp cx,0
        jmp loop_start11
        
mov cx,0
mov cl,99

jmp finish 

 F3:
        jmp finish

    A1:
        inc bx          ;with the upper loops here i found how many
        jmp A01         ;how much A1 or A2 there
                        ;and with push and pull values
    A2:                 ;we store that how many A1 is there
        inc bx
        jmp A02

    A3:
        inc bx
        jmp A03

    B1:
        inc bx
        jmp B01

    B2:
        inc bx
        jmp B02

    B3:
        inc bx
        jmp B03

    C1:
        inc bx
        jmp C01

    C2:
        inc bx
        jmp C02

    C3:
        inc bx
        jmp C03

    D:
        inc bx
        jmp D01
      
finish:        
         
mov bx,0
pop bx         

mov dx, bx       ;with pop we started to get our values at the top
mov ah, 09h
lea dx,msg0 
int 21h

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg1 
int 21h

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg2 
int 21h

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg3 
int 21h

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg4 
int 21h

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg5 
int 21h

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg6 
int 21h

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg7 
int 21h 

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg8 
int 21h

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg9 
int 21h

mov bx,0
pop bx

mov dx, bx
mov ah, 09h
lea dx,msg10 
int 21h
                


ENDP rotate

msg0: db   "A1",0Dh,0Ah,24h
msg1: db   "A2",0Dh,0Ah,24h
msg2: db   "A3",0Dh,0Ah,24h
msg3: db   "B1",0Dh,0Ah,24h
msg4: db   "B2",0Dh,0Ah,24h
msg5: db   "B3",0Dh,0Ah,24h
msg6: db   "C1",0Dh,0Ah,24h
msg7: db   "C2",0Dh,0Ah,24h
msg8: db   "C3",0Dh,0Ah,24h
msg9: db   "D",0Dh,0Ah,24h
msg10: db   "F3",0Dh,0Ah,24h
