assume cs:code

code segment

            mov ax,0ffffH
            mov ds,ax

            mov bx,20H
            mov es,bx

            mov cx,10H
            mov si,0

copyData:   mov al,ds:[si]
            mov es:[si],al
            inc si
            loop copyData

            int 21H

code ends

end