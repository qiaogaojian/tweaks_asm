assume cs:code

code segment

    mov ax,2000H
    mov ds,ax
    mov bx,1000H
    mov ax,ds:[bx]
    inc bx          ;inc 表示 自增 1
    inc bx

    mov ds:[bx],ax
    inc bx
    inc bx

    mov ds:[bx],ax
    inc bx

    mov ds:[bx],al
    inc bx
    mov ds:[bx],al

code ends

end