data segment         

    msg1 db 10,13,'ENTER ANY STRING :- $'      
    str db 10H dup('$')   
    strlen db $-str
    msg2 db 10,13,'ENTER ANY CHARACTER :- $'
    msg3 db 10,13,' $'
    msg4 db 10,13,' Sorry, the character is absent in a given string$' 
    msg5 db '  FOUND IN THE GIVEN STRING $' 
    
    count db 00h

data ends

code segment
    assume cs:code, ds=data
start: mov ax,data
       mov ds,ax
       mov es,ax
       
       mov ah,09
       lea dx,msg1
       int 21h

       
       mov ah,0Ah
       lea dx,str
       int 21h   
       
       lea si,str   
       mov cl,1Ah 
       mov dl,00h
       repeat:mov bl,[si]   
       cmp bl,'a'   
       jnz next
       inc dl
       next:inc si
       loop repeat 
       mov count,dl
       mov al,dl
       out 199,al
              
       
       cmp dl,00h
       jnz down
       
       mov ah,09
       lea dx,msg4
       int 21h  
       jmp bye
       
       down:
       
       
       mov ah,09
       lea dx,msg5
       int 21h 
       
     
       mov ah,09
       lea dx,count
       int 21h 
               

       
       

      
       bye:
       mov ah,4ch
       int 21h
code ends
end start
 