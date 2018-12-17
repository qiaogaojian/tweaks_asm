assume cs:code

data segment
    db      'Welcome To Mams!'
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

                mov cx,16
                mov si,16

     smallCh:   mov dl,es:[si]
                or  dl,00100000B
                mov es:[si],dl
                inc si
                loop smallCh

                int 21H

code ends

end start