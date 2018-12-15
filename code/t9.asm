assume cs:code

code segment

            mov ax,20H
            mov ds,ax

            mov cx,40H
            mov bx,0

copyData:   mov al,bl
            mov ds:[bx],al
            inc bx
            loop copyData

            int 21H

code ends

end