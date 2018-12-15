assume cs:code

code segment

            mov ax,0
            mov cx,0
addNumber:  add ax,cx
            loop addNumber

            int 21H

code ends

end