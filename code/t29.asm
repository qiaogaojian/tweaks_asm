assume cs:code,ds:data,ss:stack

data segment
    db          '/:'
data ends

stack segment stack
    db          128 dup(0)
stack ends

code segment

    start:
        mov ax,stack
        mov ss,ax
        mov sp,128

        call init_reg
        call init_data

    loopTime:
        call show_year
        call show_month
        call show_day
        call show_hour
        call show_min
        call show_sec
        jmp  loopTime

        mov ax,4c00h
        int 21h

    init_reg:
        mov ax,0b800h
        mov es,ax
        ret

    init_data:
        mov ax,data
        mov ds,ax
        ret

    show_year:

        mov al,9
        out 70h,al
        in  al,71h

        mov ah,al
        shr ah,1
        shr ah,1
        shr ah,1
        shr ah,1
        and al,00001111b

        add ah,30h
        add al,30h

        mov di,160*10+20*2

        mov es:[di],ah
        mov es:[di+2],al
        mov dx,ds:[0]
        mov es:[di+4],dl

        ret

    show_month:
        mov al,8
        out 70h,al
        in  al,71h

        mov ah,al
        shr ah,1
        shr ah,1
        shr ah,1
        shr ah,1
        and al,00001111b

        add ah,30h
        add al,30h

        mov di,160*10+20*2+6

        mov es:[di],ah
        mov es:[di+2],al
        mov dx,ds:[0]
        mov es:[di+4],dl

        ret

    show_day:

        mov al,7
        out 70h,al
        in  al,71h

        mov ah,al
        shr ah,1
        shr ah,1
        shr ah,1
        shr ah,1
        and al,00001111b

        add ah,30h
        add al,30h

        mov di,160*10+20*2+6*2

        mov es:[di],ah
        mov es:[di+2],al

        ret

    show_hour:

        mov al,4
        out 70h,al
        in  al,71h

        mov ah,al
        shr ah,1
        shr ah,1
        shr ah,1
        shr ah,1
        and al,00001111b

        add ah,30h
        add al,30h

        mov di,160*10+60

        mov es:[di],ah
        mov es:[di+2],al
        mov dx,ds:[1]
        mov es:[di+4],dl

        ret

    show_min:

        mov al,2
        out 70h,al
        in  al,71h

        mov ah,al
        shr ah,1
        shr ah,1
        shr ah,1
        shr ah,1
        and al,00001111b

        add ah,30h
        add al,30h

        mov di,160*10+60+6

        mov es:[di],ah
        mov es:[di+2],al
        mov dx,ds:[1]
        mov es:[di+4],dl

        ret

    show_sec:

        mov al,0
        out 70h,al
        in  al,71h

        mov ah,al
        shr ah,1
        shr ah,1
        shr ah,1
        shr ah,1
        and al,00001111b

        add ah,30h
        add al,30h

        mov di,160*10+60+6*2

        mov es:[di],ah
        mov es:[di+2],al

        ret

code ends

end start