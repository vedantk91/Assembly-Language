#start=Traffic_Lights.exe#

name "traffic"


mov ax, all_red
out 4, ax


mov si, offset situation


next:
mov ax, [si]
out 4, ax


mov bx,0fh
repeat:mov cx,0ffH
back:loop back



add si, 2 ; next situation
cmp si, sit_end
jb  next
mov si, offset situation
jmp next


situation        dw      0000001100001100b
s1               dw      0000010010010010b
s2               dw      0000100001100001b
s3               dw      0000100001100001b
s4               dw      0000010011010011b
sit_end = $


all_red          dw     0000001001001001b   

