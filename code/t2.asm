assume cs:code

code segment

    mov ax,ds:[0]
    mov bl,ds:[0]
    mov ax,4c00H
    int 21H

code ends

end