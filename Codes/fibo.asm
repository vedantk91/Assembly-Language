data segment
     
    fibo db 20 dup(0)  
   
data ends


code segment
    assume cs: code,ds:data
start: mov ax,0710h
       mov ds,ax   
       mov cl,0Ah
       mov si,00000h
       mov al,00 
       mov bl,01
       stosb
       mov [si],bl
       back:inc si    
       mov al,[si-2]
       add al,[si-1]
       mov [si],al
       loop back  
       
       
       
      
      mov ah,4ch
      int 21h
      code ends
end start

