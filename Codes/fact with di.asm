data segment
    A db 05h   
    fact dw 4 dup(0)
data ends


code segment
    assume cs: code,ds:data
start: mov ax,data
       mov ds,ax
       mov es,ax 
       mov di,00001h
       mov ah,00  
       mov al,A
       X:dec A  
       mov cl,A
       cmp cl,01
       jz stop 
       mul A
       jmp X
       stop: stosb
       mov ah,4ch
      int 21h
      code ends
end start
