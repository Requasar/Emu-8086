name "Prework 2 Question 2 Alperen Enes Efe 21947201"

.MODEL SMALL
.DATA

somewords db "resistor inductor diodes conductor",0Ah,0Dh,'$'
.CODE

MAIN PROC FAR        
    MOV AX, offset data
    MOV DS,AX 
    MOV AX, 00H            ;clearing operation
    mov cx,0h
    mov si, offset somewords

char: 

        MOV AL,[SI] ;takes chars one by one from somewords
        inc si
        inc cx
        cmp al,24h ; checking end of the string char
        jne char
        sub si,cx
        dec cx
        mov ah,09h ;for int21h operation
        mov dx, offset somewords
        int 21h
        mov dx,cx      ;storing the data

selectionP:
            mov al,[si]          ;takes chars to al
            push ax
            inc si
            dec cx
            jnz selectionP
            mov cx,dx
            sub si,cx 
            
selectionL:
            pop ax
            mov [si],al
            inc si
            dec cx
            jnz selectionL
            mov dx, offset somewords
            mov ah,09h
            int 21h
end main