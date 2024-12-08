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
    breakersmothness dw 5
    negativebs       dw -5
    ;========================================
    startx           dw ?
    starty           dw ?
    mywidth          dw 20
    height           dw 7
    space            dw 3
    rows             db 7
    cols             db 14
    color            db 14                                                             ;11
    end_x            dw 0
    end_y            dw 0
    starts_x         dw 0, 23,46, 69, 92,115, 138, 161,184, 207, 230,253 , 276, 299
    starts_y         dw 0, 10, 20, 30, 40, 50, 60,70
    rl               db 1
    cc               db 23

.CODE

MAIN PROC
    ; Initialize data segment
                     MOV  AX, @DATA
                     MOV  DS, AX
         
                     mov  ch,50
                     mov  cl,10


                     MOV  BH,1
                     mov  ah,0
                     mov  al,13h
                     int  10h
    ;======================================
                     call draw_grid_loop
                     call draw_breaker 
    ;======================================

    loopmain:        
    ;      mov ax, 0A000h               ; VGA memory segment
    ;      mov es, ax                   ; Point ES to VGA memory
    ;      mov di, 190*320              ; Offset for the last quarter (row 150)
    ;      mov al, 0fh                  ; Desired color (e.g., purple in palette 13h)
    ;      mov cx, 1600                 ; Number of pixels to repaint (50 rows * 320 pixels)
    ;      rep stosb
    ;=================================================================
                     cmp  rl,1
                     jnz  l
                     
                     mov  bx,x
                     sub  bx,breakersmothness
                     mov  startx,bx
                     mov  bx,y
                     mov  starty,bx
                     jmp  clr
            
    l:               
                     mov  bx,x
                     add  bx,lenght
                     mov  startx,bx
                     mov  bx,y
                     mov  starty,bx
    clr:             
            
                     call clrbreaker_shift
                     
    ;================================================================
   
    loop2:           
                     mov  dx,breakersmothness
                     mov  ah,1
                     int  16h
                     mov  buttonpressed,ah

                     mov  ah,0                   ;  make it int 16/0
                     int  16h
                     mov  rl,1                   ;;;;;;;;;;
                     cmp  ah,4Dh
                     jz   movr
                     cmp  ah,4Bh
    ;jnz loop2
                     mov  dx,negativebs
                     mov  rl,0                   ;;;;;;;;;;
    movr:            
                     mov  ax ,endx
                     add  ax,dx
                     mov  endx,ax
                     cmp  ax,320
                     ja   rightbound
                     cmp  ax,lenght
                     ja   inbound
                     mov  ax,lenght
                     mov  x,0
                     mov  endx,ax
                   
                     jmp  cont
    rightbound:      
                     mov  ax,lenght
                     mov  bx,320
                     sub  bx,ax
                     mov  endx,320
    inbound:         
                     mov  ax,endx
                     mov  bx,lenght
                     sub  ax,bx
                     mov  x,ax
           
               
    cont:            
    
                     cmp  rl,0
                     jnz  drawR
                     call draw_breakerL
                     jmp  cont2
    drawR:           
                     call draw_breakerR
    cont2:           
                     jmp  loopmain


MAIN ENDP


draw_breakerR proc
    loop1R:          
                     mov  bx,endx
                     sub  bx,breakersmothness
                     mov  cx,bx                  ;Column
                     mov  dx,y                   ;Row
                     mov  al,5                   ;Pixel color
                     mov  ah,0ch                 ;Draw Pixel Command
    backR:           int  10h
                     inc  cx
           
                     cmp  cx,endx
                     jnz  backR
                     inc  dx
                     mov  y,dx
            
                     cmp  dx,endy
                     jnz  loop1R

                     mov  ax,yorigin
                     mov  y,ax
                     ret
draw_breakerR endp


draw_breakerL proc
                     mov  bx,x
                     add  bx,breakersmothness
    loop1L:          
                     
                     mov  cx,x                   ;Column
                     mov  dx,y                   ;Row
                     mov  al,5                   ;Pixel color
                     mov  ah,0ch                 ;Draw Pixel Command
    backL:           int  10h
                     inc  cx
           
                     cmp  cx,bx
                     jnz  backL
                     inc  dx
                     mov  y,dx
            
                     cmp  dx,endy
                     jnz  loop1L

                     mov  ax,yorigin
                     mov  y,ax
                     ret
draw_breakerL endp



    ;==================================================================
draw_grid_loop proc 

                     mov  cx,0
                     mov  dx,0
                     lea  si,starts_x
                     lea  di,starts_y
                     mov  cl ,rows
    grid_loop:       
    ;change color
                     mov  bl,color
                     sub  cc,bl
                     mov  bl,cc
                     mov  color,bl
                     mov  cc,23
            
                     mov  dl,cols
                     push si
    line_loop:       
                     mov  bx,[si]
                     mov  startx,bx
                     mov  bx,[di]
                     mov  starty,bx
                     push cx
                     push dx
                     call myblock
                     pop  dx
                     pop  cx
                     inc  si
                     inc  si
                     dec  dl
                     jnz  line_loop
                     inc  di
                     inc  di
                     pop  si
                     dec  cl
                     jnz  grid_loop
                     ret
draw_grid_loop endp

draw_breaker proc 
    loop1:           
                    
                     mov  cx,x                   ;Column
                     mov  dx,y                   ;Row
                     mov  al,5                   ;Pixel color
                     mov  ah,0ch                 ;Draw Pixel Command
    back:            int  10h
                     inc  cx
           
                     cmp  cx,endx
                     jnz  back
                     inc  dx
                     mov  y,dx
            
                     cmp  dx,endy
                     jnz  loop1

                     mov  ax,yorigin
                     mov  y,ax
                     ret
draw_breaker endp




    ;==============================================================================

myblock proc

    ;=====change color====
                     mov  bl,color
                     sub  cc,bl
                     mov  bl,cc
                     mov  color,bl
                     mov  cc,23
          
          
                     mov  dx,starty              ;set start height
                     mov  cx,startx              ;set start width
       
    ;set end width
           
                     mov  bx,startx
                     add  bx,mywidth
                     mov  end_x,bx

    ; set end height
           
                     mov  bx,starty
                     add  bx,height
                     mov  end_y,bx
    block:           
                     inc  dx
                     mov  cx,startx
                     mov  al,color
                     mov  ah,0ch
    line:            
                     int  10h
                     inc  cx
                     cmp  cx,end_x
                     jnz  line
                     cmp  dx,end_y
                     jnz  block
                     ret
myblock endp


    ;==================================================================
clrbreaker_shift proc

          
                     mov  color,0
       
                     mov  dx,starty              ;set start height
                     dec  dx
                     mov  cx,startx              ;set start width
      
    ;set end width
           
                     mov  bx,startx
                     add  bx,breakersmothness
                     mov  end_x,bx

    ; set end height
           
                     mov  bx,starty
                     add  bx,Bidth
                     mov  end_y,bx

    clr_block:       
                     inc  dx
                     mov  cx,startx
                     dec  cx
                     mov  al,color
                     mov  ah,0ch
    clr_line:        
                     int  10h
                     inc  cx
                     cmp  cx,end_x
                     jnz  clr_line
                     cmp  dx,194                 ;there was a hight greater than the hight so i changed the number
                     jnz  clr_block
                     ret
clrbreaker_shift endp

    ;===================================================================





END MAIN
