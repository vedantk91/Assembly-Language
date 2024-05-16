data segment    
    firstno db 4
    secondno db 4
data ends

code segment
 assume sc:code, ds:data, ss:stack
start:mov ax,data
 mov ds,ax
 mov ah,firstno   
 inc ah
 mov firstno,ah
 mov bx,09h       
 cmp ax,bx
 jz next
 add ax,bx
 next:      

 
 

 
 mov ah,4ch
 int 21h
 code ends
 end start
                    
                    


