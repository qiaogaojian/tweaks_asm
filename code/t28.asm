assume cs:code

code segment

    main:
        mov al,100
        mov bl,10
        mul bl

        mov ax,4c00h
        int 21h

code ends

end main