assume cs:code,ds:data

data segment
    db      '1. ibm          '
    db      '2. dec          '
    db      '3. des          '
    db      '4. vax          '
data ends

code segment

    start:
        mov cx,4
        mov bx,0

        mov ax,data
        mov ds,ax
        mov es,ax
        outer:
            push cx
            mov si,3
            mov cx,3
            inner:  mov dl,ds:[bx+si]
                    and dl,11011111B
                    mov ds:[bx+si],dl
                    inc si
                    loop inner
            add bx,16
            pop cx
            loop outer

            mov ah,4ch
            int 21h
code ends

end start
