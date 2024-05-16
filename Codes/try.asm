data segment
list db 06h,09h,39h,04h,20h
n1 db 04h
result db 1 dup(0)
data ends
code segment
assume cs:code,ds:data
start:
 mov ax,data
 mov ds,ax
 lea si,list
 mov cl,n1
 mov al,00h
 mov al,[si]
 inc si
back:
 cmp al,[si]
 jnc next
 mov al,[si]
next:
 inc si
 dec cl
 jnz back
 mov result,al
 hlt
 code ends
 end start