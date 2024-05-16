data segment
clear dw 0Ah dup(0)
data ends


code segment
    assume cs: code,ds:data
start: mov ax,0710h
MOV DS, AX             
MOV ES, AX
MOV AL, 05
MOV DI, 00001H   
MOV 00001H,05h
MOV CX, 0FH
CLD
AGAIN: STOSB
LOOP AGAIN
end start 
code ends