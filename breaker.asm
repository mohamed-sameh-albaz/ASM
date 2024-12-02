.model SMALL
.data
      a       db 2,?,2 dup('$')
      b       db 2,?,2 dup('$')
      c       db 9
      lenght  dw 50
      Bidth   dw 10
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
         
               mov cx,x           ;Column
               mov dx,y           ;Row
               mov al,5           ;Pixel color
               mov ah,0ch         ;Draw Pixel Command
      back:    int 10h
               inc cx
           
               cmp cx,endx
               jnz back
               inc dx
               mov y,dx
            
               cmp dx,endy
               jnz loop1

               mov ax,y
               mov bx ,Bidth
               sub ax,bx
            
               mov y,ax


      loop2:   
               mov ah,0
               int 16h
               cmp al,0
               jnz loop2
      movr:    
               mov ax ,endx
               add ax,20
               mov endx,ax
               mov ax,x
               add ax,20
               mov x,ax
               jmp loopmain
      cont:    


MAIN ENDP
END MAIN
