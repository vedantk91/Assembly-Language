data segment
    msg1 db "Enter the string",10,13,'$'
    msg2 db 10,13,"Yes it's a palindrome",10,13,'$'
    msg3 db 10,13,"Sorry, not a Palindrome",10,13,'$'
    msg4 db 10,13,"Reverse of string is",10,13,'$'
    str db 10H dup('$')
    revstr db 10H dup('$')
data ends

code segment
    assume cs:code,ds:data,ss:stack
    start:mov ax,data
          mov ds,ax
          mov es,ax
        
          mov ah,09
          lea dx,msg1
          int 21h
        
          mov ah,0Ah
          lea dx,str
          int 21h
        
          lea si,str
          inc si
          mov cl,[si]
          mov bl,cl
          mov ch,0
          inc si
        
          lea di,revstr
          add di,cx
          dec di
        
     back:cld
          lodsb
          std
          stosb
          loop back
                   
          mov ah,09
          lea dx,msg4
          int 21h         
                   
          mov ah,09
          lea dx,revstr
          int 21h
        
          lea si,str
          inc si
          inc si
          lea di,revstr
          mov cl,bl
          mov ch,0
        
          cld
          repe 
          cmpsb
          jnz no
        
          mov ah,09
          lea dx, msg2
          int 21h
          jmp skip
        
       no:mov ah,09
          lea dx,msg3
          int 21h
        
     skip:mov ah,4ch
          int 21h
          code ends
    end start
end
