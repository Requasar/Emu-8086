name "Experiment 1"; Alperen Enes Efe 21947201

org 100h
      
   
	  MOV BX,2d
	  MOV BL,10D 
	  
	  MOV AX, 0110110100011100b ;16 bit input 
	  MOV CX, 16d

	  
testing:   div BX     ;AX'i bx'e boluyoruz
           JNB adres  ; Kalan yoksa  B=0 ve adrese jump.
           JB adres1  ; Varsa adres1'e jump
           INC BX
           CMP AX,BX
                    
adres: mov DX FFFFh	   
adres1: mov DX,AX	   
	 	   
loop testing

ret                                            