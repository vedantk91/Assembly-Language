data segment
    a dw 1234h
    b db 11h
    divi dw 2 dup(0)
data ends

code segment
    assume cs: code,ds:data
start:mov ax,data
      mov ds,ax
      
      mov ax,a
      mov bl,b
      div bl
      mov divi,ax
      
      mov ah,4ch
      
      mov divi,ax     
      int 21h
    
    
    
code ends
end start