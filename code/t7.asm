assume cs:code

code segment

            mov bx,0
            mov cx,16

copyData:   mov ax,0ffffH
            mov ds,ax
            mov dl,ds:[bx]

            mov ax,0020H
            mov ds,ax
            mov ds:[bx],dl

            inc bx
            loop copyData

code ends

end