#start=Traffic_Lights.exe#        
data segment
stop_all          dw     0000001001001001b

situation        dw      0000001100001100b
s1               dw      0000010010010010b
s2               dw      0000100001100001b
s3               dw      0000100001100001b
s4               dw      0000010010010010b
sit_end = $

data ends

code segment
    assume sc:code, ds:data, ss:stack
start:mov ax,data
      mov ds,ax


mov ax, stop_all
out 4, ax


mov si, offset situation


next:
mov ax, [si]
out 4, ax

mov bx,0fh
    repeat:mov cx,5fH
    back:loop back
    dec bx
    jnz repeat




add si, 2 ; next situation
cmp si, sit_end
jb  next
mov si, offset situation
jmp next    

code ends
end start
