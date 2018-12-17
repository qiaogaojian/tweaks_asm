assume cs:code

a segment
    db      1,2,3,4,5,6,7,8
a ends

b segment
    db      1,2,3,4,5,6,7,8
b ends

c segment
    db      0,0,0,0,0,0,0,0
c ends

code segment
                ; 初始化迭代器
    start:      mov cx,8
                mov bx,0
                ; 初始化输出地址
                mov ax,c
                mov es,ax
                ; 初始化累加临时变量
        addLoop:mov dx,0
                ; 初始化输入a
                mov ax,a
                mov ds,ax
                add dl,ds:[bx]
                ; 初始化输入b
                mov ax,b
                mov ds,ax
                add dl,ds:[bx]

                mov es:[bx],dl
                loop addLoop

                mov ax,4c00H
                int 21H
code ends

end start