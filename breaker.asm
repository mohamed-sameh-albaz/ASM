.model SMALL
.data
    a    db 2,?,2 dup('$')
    b    db 2,?,2 dup('$')
    c    db 9
.CODE

MAIN PROC
    ; Initialize data segment
         MOV AX, @DATA
         MOV DS, AX


MAIN ENDP
END MAIN
