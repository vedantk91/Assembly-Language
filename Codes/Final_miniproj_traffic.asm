#start=Traffic_Lights.exe#         
name "traffic2"
data segment  
    
stop_all dw 0000001001001001b;0249h

s0 dw 0000001100001100b;030Ch
s1 dw 0000010010010010b;0492h
s2 dw 0000100001100001b;0861h
s3 dw 0000010010010010b;0492h
endofday = $

data ends

code segment 
    
    assume sc:code, ds:data, ss:stack
start:mov ax,data
      mov ds,ax

;starting all red
mov ax, stop_all
out 4, ax 

;situation vertical movement
next:
mov si, offset s0
mov ax, [si]
out 4, ax        

;delay
mov bx,0fh
    repeat:mov cx,5fH
    b:loop b
    dec bx
    jnz repeat

;situation yellow
mov si,offset  s1   
mov ax, [si]
out 4, ax  

;delay
mov bx,0fh
    reps:mov cx,1fH
    bac:loop bac
    dec bx
    jnz reps 
    
;situation horizontal movement               
mov si,offset s2   
mov ax, [si]
out 4, ax


;delay
mov bx,0fh
    repet:mov cx,5fH
    bk:loop bk
    dec bx
    jnz repet    
    
    
;situation yellow    
mov si,offset s3   
mov ax, [si]
out 4, ax

;delay
mov bx,0fh
    r:mov cx,1fH
    a:loop a
    dec bx
    jnz r
    
    
cmp si, endofday
jz  next
mov si, offset s0
jmp next    

code ends
end start