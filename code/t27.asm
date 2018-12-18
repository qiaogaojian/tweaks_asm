assume cs:code

code segment

    start:
            call func1
            mov  bx,0bh
            call func2
            mov  dx,0dh

            mov ax,4c00h
            int 21h
    func1:
            mov ax,0ah
            ret

    func2:
            mov cx,0ch
            ret

            mov dx,0dh

            int 21h

code ends

end start