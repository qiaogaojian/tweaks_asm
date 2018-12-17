assume cs:code,ds:data,ss:stack

data segment
    db      '1975','1976','1977','1978','1979','1980','1981','1982','1983'
    db      '1984','1985','1986','1987','1988','1989','1990','1991','1992'
    db      '1993','1994','1995'

    dd      16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
    dd      345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000

    dw      3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
    dw      11542,14430,15257,17800
data ends

table segment
    db      21 dup('year summ ne ?? ')
table ends

stack segment stack
    db 128 dup(0)
stack ends

code segment

    start:
        mov ax,stack
        mov ss,ax
        mov sp,128

        ; 输入指针
        mov ax,data
        mov ds,ax

        ; 输出指针
        mov ax,table
        mov es,ax

        ; 外层迭代器
        mov cx,21
        mov bx,0
        mov si,0
        outer:
            push cx
            ; 内层迭代器
            mov cx,4
            mov di,0
            inner:
                ; year
                mov dl,ds:[si]
                mov es:[bx+di],dl
                ; income
                mov dl,ds:[si+84]
                mov es:[bx+di+5],dl

                add si,1
                add di,1
                loop inner
            add bx,16
            pop cx
            loop outer


        mov cx,21
        mov bx,0
        mov si,0
        outers:
            push cx
            ; 内层迭代器
            mov cx,2
            mov di,0
            inners:
                ; emploee
                mov dl,ds:[si+168]
                mov es:[bx+di+10],dl

                add si,1
                add di,1
                loop inners
            add bx,16
            pop cx
            loop outers

        mov cx,21
        mov si,0
        mov di,0
        divs:
            mov ax,ds:[si+84]
            mov dx,ds:[si+86]

            mov bx,es:[di+10]
            div bx
            mov es:[di+13],ax

            add si,4
            add di,16
            loop divs

        mov ax,4c00h
        int 21h

code ends

end start