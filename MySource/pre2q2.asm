name "Prework 2 Question 2 Alperen Enes Efe 21947201"

.MODEL SMALL
.DATA

somewords db ' resistor inductor diodes conductor',0Ah,0Dh,'$'
.CODE

MAIN PROC FAR        
    MOV AX, offset data
    MOV DS,AX 
    MOV AX, 00H            ;clearing operation
    mov cx,0h
    mov si, offset somewords

char: 

        MOV AL,[SI] ;takes chars one by one from SOMEWORDS
        inc si
        inc cx
        cmp al,24h ; checking end of the string char
        jne char
        sub si,cx
        dec cx
        mov ah,09h ;for int21h operation
        mov dx, offset somewords
        int 21h

selection:
            mov al,[si]
            CMP al,20H ;if space char is selected
            JE convert 
            INC si ;if space char is not selected, dont touch it
            MOV ah,0EH ;print single char in AL
            INT 10H
            DEC cx
            JNZ selection
            JZ end 
            
convert:
            MOV BL,[SI+1] ;passes space key and moves the first chat to BL
            SUB BL,20H ;converts lowercase to uppercase
            MOV [SI+1],BL ;stores it back in BL
            INC SI
            MOV AH,0EH ;displays converted char
            INT 10H
            DEC CX ;contiunes until string ends
            JNZ selection
end:
            MOV AH,4CH
            INT 21H
            MAIN ENDP
end main