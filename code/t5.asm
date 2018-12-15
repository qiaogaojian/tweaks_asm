assume cs:code

code segment

            mov ax,0000H
            mov dx,0000H
            mov cx,0010H
            mov bx,0ffffH
            mov ds,bx
            mov si,0
addFunc:    mov al,ds:[si]
            add dx,ax
            inc si
            loop addFunc

            int 21H

code ends

end