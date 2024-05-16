data segment
    msg1 db "Name",'$'
    msg2 db 09,"Vedant",10,13,'$'
data ends

stack segment
    dw 100 dup(0)
    stack_top label word
stack ends

code segment
    assume sc:code, ds:data, ss:stack
start:mov ax,data
      mov ds,ax
      all:mov ah,09
      lea dx,msg1
      int 21h
      call delay

      
      mov ah,09
      lea dx,msg2
      int 21h 
      call delay    
      
      jmp all
        
 delay proc near 
    mov bx,0fh
    repeat:mov cx,0fH
    back:loop back
    dec bx
    jnz repeat
    ret
    delay endp
    
    mov ah,4ch
    int 21h
    code ends
    end start
  