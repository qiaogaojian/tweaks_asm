assume cs:code

data segment
    db      'HelloWorld'
    db      '你好世界'
data ends

stack segment stack

stack ends

code segment

    start:

                mov ax,4C00H
                int 21H

code ends

end start