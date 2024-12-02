.model SMALL
.data
      a       db 2,?,2 dup('$')
      b       db 2,?,2 dup('$')
      c       db 9
      lenght  dw 50
      Bidth   dw 10
      yorigin dw 180
      x       dw 120
      y       dw 180
      breaker db 5
      endx    dw 170
      endy    dw 190
.CODE

MAIN PROC
      ; Initialize data segment
                 MOV AX, @DATA
                 MOV DS, AX
         
                 mov ch,50
                 mov cl,10
      loopmain:  
                 MOV BH,1
                 mov ah,0
                 mov al,13h
                 int 10h
          
       
      loop1:     
         
                 mov cx,x            ;Column
                 mov dx,y            ;Row
                 mov al,5            ;Pixel color
                 mov ah,0ch          ;Draw Pixel Command
      back:      int 10h
                 inc cx
           
                 cmp cx,endx
                 jnz back
                 inc dx
                 mov y,dx
            
                 cmp dx,endy
                 jnz loop1

                 mov ax,yorigin
                 mov y,ax
            
               


      loop2:     
                 mov dx,20
                 mov ah,0
                 int 16h
                 cmp ah,4Dh
                 jz  movr
                 cmp ah,4Bh
                 jnz loop2
                 mov dx,-20
      movr:      
             
           
                 mov ax ,endx
                 add ax,dx
                 mov endx,ax
                 cmp ax,319
                 ja  rightbound
                 cmp ax,lenght
                 ja  inbound
                 mov ax,lenght
                 mov x,0
                 mov endx,ax
                 jmp cont
      rightbound:
                 mov ax,lenght
                 mov bx,319
                 sub bx,ax
                 mov endx,319

      inbound:   
                 mov ax,endx
                 mov bx,lenght
                 sub ax,bx
                 mov x,ax
               
      cont:      jmp loopmain


MAIN ENDP
END MAIN
