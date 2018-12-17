assume cs:code,ds:data,ss:stack

data segment
    db 256 dup(0)
data ends

stack segment stack
    db 128 dup(0)
stack ends

code segment

    start:
        mov ax,stack
        mov ss,ax
        mov sp,128



        mov ax,4c00h
        int 21h

code ends

end start