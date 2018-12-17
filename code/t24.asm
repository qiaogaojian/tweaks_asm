assume cs:code

data segment
    db      'hello world     '
    db      00000010b
    db      00100100b
    db      01110001b
data ends

stack segment stack
    db 128 dup(0)
stack ends

code segment

    start:
        mov ax,stack
        mov ss,ax
        mov sp,128

        jmp show_text

    next:
        mov ax,4c00h
        int 21h
    show_text:
        mov bx,data
        mov ds,bx

        mov bx,0b800h
        mov es,bx
        mov di,160*12+30*2

        mov cx,3
        mov bx,16

    showHello:
        push cx
        push di
        mov cx,16
        mov si,0

        mov dh,ds:[bx]
    showString:
        mov dl,ds:[si]
        mov es:[di],dx

        add di,2
        inc si
        loop showString

        pop di
        pop cx
        add di,160
        inc bx
        loop showHello

code ends

end start