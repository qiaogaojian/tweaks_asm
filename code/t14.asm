assume cs:code

a segment
    dw  1,2,3,4,5,6,7,8,0AH,0BH,0CH,0DH,0EH,0FH,0FFH
a ends

b segment
    dw  0,0,0,0,0,0,0,0
b ends

stack segment stack
    dw  0,0,0,0,0,0,0,0
    dw  0,0,0,0,0,0,0,0
stack ends

code segment

    start:
            mov cx,8
            mov bx,0

            mov ax,a
            mov ds,ax

 pushStack: push ds:[bx]

            add bx,2
            loop pushStack

            mov cx,8
            mov bx,0

            mov ax,b
            mov es,ax

   replace: pop dx
            mov es:[bx],dl

            add bx,2
            loop replace

            mov ax,4C00H
            int 21H

code ends

end start