assume cs:code

data segment
    db      'welcome to mams!'
    db      '****************'
data ends

stack segment stack
    dw      0,0,0,0,0,0,0,0
    dw      0,0,0,0,0,0,0,0
stack ends

code segment

    start:
                mov ax,stack
                mov ss,ax
                mov sp,32

                mov ax,data
                mov ds,ax
                mov es,ax

                mov si,0
                mov di,16
                mov cx,8

     copyData:  push ds:[si]
                pop  es:[di]
                add si,2
                add di,2
                loop copyData

                int 21H

code ends

end start