assume cs:code

code segment

dw          0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H   ;dw 命令把字型数据加载到内存 cs 地址段

start:      mov bx,cs
            mov ds,bx

            mov ax,0
            mov si,0
            mov cx,8

copyWord:   add ax,ds:[si]
            add si,2
            loop copyWord

            int 21H

code ends

end start