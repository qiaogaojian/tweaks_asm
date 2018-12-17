assume cs:code,ds:data

data segment
    db          '1. file         '
    db          '2. edit         '
    db          '3. search       '
    db          '4. view         '
    db          '5. options      '
    db          '6. help         '
data ends

code segment

    start:      mov cx,6
                mov bx,0
                mov si,3

                mov ax,data
                mov ds,ax

        uper:   mov dl,ds:[bx+si]
                and dl,11011111B
                mov ds:[bx+si],dl
                add bx,16
                loop uper

        int 21H

code ends

end start