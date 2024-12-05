.model SMALL
.data
      a                db 2,?,2 dup('$')
      b                db 2,?,2 dup('$')
      c                db 9
      lenght           dw 50
      Bidth            dw 10
      yorigin          dw 190
      x                dw 120
      y                dw 190
      breaker          db 5
      endx             dw 170
      endy             dw 195
      buttonpressed    db ?
      breakersmothness dw 20
      negativebs       dw -20
.CODE

MAIN PROC
      ; Initialize data segment
                 MOV AX, @DATA
                 MOV DS, AX
         
                 mov ch,50
                 mov cl,10


                 MOV BH,1
                 mov ah,0
                 mov al,13h
                 int 10h
      loopmain:  
                 mov ax, 0A000h               ; VGA memory segment
                 mov es, ax                   ; Point ES to VGA memory
                 mov di, 190*320              ; Offset for the last quarter (row 150)
                 mov al, 4Fh                  ; Desired color (e.g., purple in palette 13h)
                 mov cx, 1600                 ; Number of pixels to repaint (50 rows * 320 pixels)
                 rep stosb
              
       
      loop1:     
         
                 mov cx,x                     ;Column
                 mov dx,y                     ;Row
                 mov al,5                     ;Pixel color
                 mov ah,0ch                   ;Draw Pixel Command
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
                 mov dx,breakersmothness
                 mov ah,1                     ;  make it int 16/0
                 int 16h
                 mov buttonpressed,ah

                 mov ah,0                     ;  make it int 16/0
                 int 16h
                 
                 cmp ah,4Dh
                 jz  movr
                 cmp ah,4Bh
      ;jnz loop2
                 mov dx,negativebs

      movr:      
                 mov ax ,endx
                 add ax,dx
                 mov endx,ax
                 cmp ax,320
                 ja  rightbound
                 cmp ax,lenght
                 ja  inbound
                 mov ax,lenght
                 mov x,0
                 mov endx,ax
                 jmp cont
      rightbound:
                 mov ax,lenght
                 mov bx,320
                 sub bx,ax
                 mov endx,320

      inbound:   
                 mov ax,endx
                 mov bx,lenght
                 sub ax,bx
                 mov x,ax
               
      cont:      jmp loopmain


MAIN ENDP
END MAIN
