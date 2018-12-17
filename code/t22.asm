assume cs:code

code segment

    start:
        mov ax,2000h
        mov ds,ax
        mov bx,0

        s:
            mov cl,ds:[bx]
            mov ch,0
            add cx,1
            inc bx
            loop s
        ok: dec bx    ; dec 和 inc 相反  减1
            mov dx,bx

            mov ax,4c00h
            int 21h

code ends

end start