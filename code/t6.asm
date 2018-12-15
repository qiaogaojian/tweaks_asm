assume cs:code

code segment

            mov bx,0ffffH
            mov ds,bx
            mov si,0FH
            mov cx,10H
            mov sp,10H

pushData:   mov al,ds:[si]
            push ax
            sub si,1
            loop pushData

            mov cx,10H
            mov bx,0H;
            mov ds,bx
            mov si,200H

popData:    pop ax
            mov ds:[si],al
            inc si
            loop popData

            int 21H

code ends

end