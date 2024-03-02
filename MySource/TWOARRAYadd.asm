name "add-2,Modify Add_two_arrays Alperen Enes Efe 21947201 "

; this example calculates the sum of a vector with
; another vector and saves result in third vector.

; you can see the result if you click the "vars" button.
; set elements for vec1, vec2 and vec3 to 4 and show as "signed".

org 100h
 
jmp start     ;Here I jumped to define vectors outside of code

vec1 dw 25, 75, 100         ;Here we make our 1x3 vectors
vec2 dw -75, 100, -150
vec3 dw 250, -50, 125

start:

lea si, vec1             ;We store our vectors adress's with lea
lea bx, vec2
lea di, vec3

mov cx, 3                ;We expect sum[200,125,75] -> for hexa[C8,7D,4B]

sum:       
    mov ax, [si]         ;We take ax to add our vectors together
    add ax, [bx]
    add ax, [di]
    mov [si], ax
   
    add si, 2            ;We increaes by 2 to sum first value with first
    add bx, 2            ;Then second with second after that third with third
    add di, 2
   
    loop sum
    


ret



