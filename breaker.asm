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
    CBreaker         dw ?
    buttonpressed    db ?
    breakersmothness dw 5
    negativebs       dw -5
    firstQ           dw ?
    thirdQ           dw ?
   
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
    ;==========================================
    ;Ball
    Xc               DW 160d                                                           ; X of Top Left Corner of the Ball
    Yc               DW 100d                                                           ; Y of Top Left Corner of the Ball
    S                DW 4d                                                             ; Side Length of Ball
    CBall            DW 0d
    ; X OF Center of the Ball (initial zero will be calculated)
    Speed            dw 1bffh

    BackGroundColor  DB 00h
    Flag             DB 0                                                              ;Flag to clear the ball in its previous location

    WindowWidth      DW 320d
    WindowHeight     DW 200d

    ; ShiftX DW  0d
    ShiftX           DW 5d
    ShiftY           DW 2d
    DefaultShiftX    DW 5d

    PrevTime         DB 0
    ChangeShiftlow   dw 1
    ChangeShiftHigh  dw 3
    ;=================================================================== menu
    l                dw 30
    lorg             dw 50
    w                dw 9
    worg             dw 20
    letters db      "play$"
    
.CODE
DrawPixel PROC
                     mov  cx,AX                   ;Column
                     mov  dx,BX                   ;Row

                     CMP  Flag , 1
                     JZ   ClearBall

    ; Colour my Pixel
                     mov  al , 0Fh                ;Pixel color
                     JMP  Next

    ClearBall:       
                     MOV  al , BackGroundColor    ;Pixel color become (black) like my background color
    Next:            
                     mov  ah , 0ch                ;Draw Pixel Command
                     INT  10h
                     RET
DrawPixel ENDP

GetTime PROC
    ; CH = hour (0-23) CL = minutes (0-59) DH = seconds (0-59) DL = hundredths (0-99)
                     MOV  AH , 2Ch
                     int  21h
                     RET
GetTime ENDP

MovBall PROC
    ; CheckTime:
    ;  CALL GetTime
    ;  CMP  PrevTime , DL
    ;JNZ  TranslateBall
    ;JMP  CheckTime

    TranslateBall:   

    ;  MOV  PrevTime , DL

                     MOV  Flag , 1
                     CALL DrawBall

                     MOV  AX , ShiftX
                     ADD  Xc , AX

                     MOV  AX , WindowWidth
                     SUB  AX , 1
                     SUB  AX , S

                     CMP  Xc , AX
                     JG   NegX

                     CMP  Xc , 0
                     JL   NegX

                     JMP  ToY

    NegX:            
                     NEG  ShiftX
                     MOV  AX , ShiftX
                     ADD  Xc , AX

    ToY:             

                     MOV  AX , ShiftY
                     ADD  Yc , AX

    ;check collison With Breaker
    ; if(
    ; Xc <    x + lenght &&
    ; Xc + S >    x &&
    ; Yc < y + Bidth &&
    ; Yc + S > y
    ; )

                     MOV  AX , x
                     ADD  AX , lenght
                     CMP  Xc , AX
                     Jb   cont55
                     jmp  NotCollision
    cont55:          
                     
                     MOV  AX ,Xc
                     ADD  AX , S
                     CMP  AX , x
                     JG   ch1
                     jmp  NotCollision
    ch1:             

                     MOV  AX , y
                     ADD  AX , Bidth
                     CMP  Yc ,AX
                     Jb   ch2
                     jmp  NotCollision
    ch2:             
                     MOV  AX ,Yc
                     ADD  AX , S
                     CMP  AX , y
                     JG   ch3
                     jmp  NotCollision
    ch3:             

    ;Collison exists
                     
                     call CenterBreaker
                     mov  ax, ShiftX
                     cmp  ax,0
                     ja   firstquarter
                     NEG  ChangeShiftlow
                     NEG  ChangeShiftHigh
    firstquarter:                                 ;here i increment by 3 as top decrease the slope of the ball
                     mov  ax,Xc
                     cmp  ax,firstQ
                     ja   secQ
                     MOV  AX,ShiftX
                      
                     add  ax,ChangeShiftHigh
                     add  Speed,200h
                     mov  ShiftX,ax
                     call draw_breaker
                     JMP  neutralizeshift
    secQ:                                         ;its close to the center so i inc by 1 only
                     mov  ax,Xc
                     cmp  ax,CBreaker
                     ja   thirdQuarter
                     mov  ax,ShiftX
                     add  ax,ChangeShiftlow
                     add  Speed,100h
                     mov  ShiftX,ax
                     call draw_breaker
                     JMP  neutralizeshift
    thirdQuarter:                                 ;third same as sec
                     mov  ax,Xc
                     cmp  ax, thirdQ
                     ja   lastq
                     mov  ax,ShiftX
                     add  ax,ChangeShiftlow
                     add  Speed,200h
                     mov  ShiftX,ax
                     call draw_breaker
                     JMP  neutralizeshift
    lastq:                                        ;last part of the breaker same as the first
                     MOV  AX,ShiftX
                     add  ax,ChangeShiftHigh
                     add  Speed,100h
                     mov  ShiftX,ax
                     call draw_breaker

    neutralizeshift: 

                     cmp  ShiftX,0
                     ja   NegY
                     NEG  ChangeShiftlow
                     NEG  ChangeShiftHigh


                     JMP  NegY
                     
    ; Yc=Yc-(Yc+S-y))
    ; Yc = y-S
    ;  MOV  AX , y
    ;  SUB  AX , S
                     
                     
    ;  MOV  Yc , AX
                
                    


    NotCollision:    

  




                     MOV  AX , WindowHeight
                     SUB  AX , 1
                     SUB  AX , S

                     CMP  Yc , AX
                     JG   ResetPosition
    ;  JG   NegY

                     CMP  Yc , 0

                     JL   NegY










    ;JMP ToDraw
    ;check collison With Boxes

    ; interrupt to compare colors
    ; mov ah,0Dh
    ; mov cx,[X]
    ; mov dx,[Y]
    ; int 10H ; AL = COLOR
    ; cmp al, BackGroundColor
    ; Jz ToDraw
    ; Collision exists


    ; TRY TO GET ANY CORNER OF THE BOX TO GET THE  Y OF THE TOP LEFT CORNER OF THE BOX
    ; MOVE LEFT OR RIGHT UNTIL OUT OF BOUDARY OF SCREEN OR UNTILL FOUND BACKGROUND COLOR & SIMILARY UP OR DOWN THEN YOU WILL GET CORNER OF THE BOX
    ; THEN YOU CAN SIMPLY DRAW IT AGAIN WITH BACKGROUND COLOR


    ; if(
    ; Yc > BoxY + BoxHeight ||
    ; Yc < BoxY
    ; )
    ; NEG  ShiftY
    ; JMP ToDraw
    ; NEG  ShiftX
    ; JMP ToDraw


                     JMP  ToDraw

    NegY:            


                     NEG  ShiftY
                     MOV  AX , ShiftY
                     ADD  Yc , AX


                     JMP  ToDraw
    ResetPosition:   
                     CALL RestartBall



    ToDraw:          

                     MOV  Flag , 0


                     CALL DrawBall

                     
    ;================================================================
          






    ;JMP  CheckTime
    ;  MOV  AX , DefaultShiftX
    ;  MOV  ShiftX , AX
                     RET
MovBall ENDP

Draw_p PROC

                    mov  cx,150
                     mov  dx,50
    d_p1:             
                    mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_p2:              
                     int  10h
                     inc  dx
                     cmp  dx,70
                     jnz  d_p2
                     inc  cx
                     mov  dx,50
                     cmp  cx,155
                     jnz  d_p1
                     
                     mov  cx,150
                     mov  dx,50


    l221:             
                     ;call draw_line_H
                     add  dx,180
                     mov  cx,0
                    ; call draw_line_H
                     sub  dx,180
                     inc  dx
                     mov  cx,0
                     cmp  dx,20
                     jnz  l221

                     mov  l,30

                   
Draw_p endp



DrawBall PROC

                     MOV  CX ,0
    OuterLoop:       

                     MOV  DX ,0
    InnerLoop:       
                     MOV  AX , Xc
                     MOV  BX , Yc
                     ADD  AX , CX
                     ADD  BX , DX
                     push CX
                     PUSH DX
                     CALL DrawPixel
                     pop  DX
                     POP  CX

                     inc  DX
                     CMP  DX , S
                     JNZ  InnerLoop

                     inc  cx
                     CMP  CX , S
                     JNZ  OuterLoop


                     RET
DrawBall ENDP


RestartBall PROC
                     MOV  AX , WindowWidth
                     MOV  BX , 2
                     MOV  DX , 0
                     DIV  BX

                     MOV  Xc , AX

                     MOV  AX , WindowHeight
                     MOV  BX , 2
                     MOV  DX , 0
                     DIV  BX

                     MOV  Yc , AX

                     MOV  ShiftX , 0

                     RET
RestartBall ENDP



CenterBall PROC

                     MOV  AX , S
                     MOV  BX , 2
                     MOV  DX , 0
                     DIV  BX

                     MOV  BX , Xc
                     ADD  BX , AX
                     MOV  CBall , BX
                     RET
CenterBall ENDP

CenterBreaker PROC

                     MOV  AX , lenght
                     MOV  BX , 2
                     MOV  DX , 0
                     DIV  BX

                     MOV  BX , x
                     ADD  BX , AX
                     MOV  CBreaker , BX
                     mov  ax, lenght
                     mov  bx,2
                     shr  ax,2
                     
                     mov  bx ,x
                     add  bx,AX
                     mov  firstQ,bx
                     add  bx,ax
                     add  bx,ax
                     mov  thirdQ,bx

                     RET
CenterBreaker ENDP

draw_line_v proc
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    l1:              
                     int  10h
                     inc  dx
                     cmp  dx,200
                     jnz  l1
                     ret
draw_line_v endp

draw_line_H proc
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     mov  bx,dx
                     add  bx,l
    l12:             
                     int  10h
                     inc  cx
                     cmp  cx,320
                     jnz  l12
                     ret
draw_line_H endp



    ;===========================
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

    Menu:            
    ; play word
    play:            




    ;p
    call Draw_p

                     jmp  menu

    ;===========================
    ; Set BackGround Color
                     MOV  AH , 0Bh
                     MOV  BH , 00h
                     MOV  BL , BackGroundColor    ; BackGround Color
                     int  10h


    ;  CALL RestartBall
  


    ;======================================
                     call draw_grid_loop

                     call draw_breaker
                    

                     mov  cx,0
    game:            
                     cmp  cx,1bffh
                     jnz  loop2
                     CALL MovBall
                     mov  cx,0
                  
    loop2:           
                     mov  dx,breakersmothness
                     mov  ah,1
                     int  16h
                     JZ   cont2
                     mov  buttonpressed,ah

                     mov  ah,0                    ;  make it int 16/0
                     int  16h
                     mov  rl,1                    ;;;;;;;;;;
                     cmp  ah,4Dh
                     jz   movr
                     cmp  ah,4Bh
    ;jnz loop2
                     mov  dx,negativebs
                     mov  rl,0                    ;;;;;;;;;;
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
                   
                     jmp  cont3
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
           
               
    cont3:           
    
                     cmp  rl,0
                     jnz  drawR
                     call draw_breakerL
                     jmp  cont2
    drawR:           
                     call draw_breakerR
    cont2:           

                     inc  cx
                     jmp  game

    

MAIN ENDP


draw_breakerR proc

                     mov  bx,x
                     sub  bx,breakersmothness
                     mov  startx,bx
                     mov  bx,y
                     mov  starty,bx
                     call clrbreaker_shift
    loop1R:          



                     mov  bx,endx
                     sub  bx,breakersmothness
                     mov  cx,bx
                     dec  cx                      ;Column
                     mov  dx,y                    ;Row
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch                  ;Draw Pixel Command
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
                     add  bx,lenght
                     mov  startx,bx
                     mov  bx,y
                     mov  starty,bx

                     call clrbreaker_shift
                     mov  bx,x
                     add  bx,breakersmothness
    loop1L:          
                     
                     mov  cx,x                    ;Column
                     mov  dx,y                    ;Row
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch                  ;Draw Pixel Command
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
                    
                     mov  cx,x                    ;Column
                     mov  dx,y                    ;Row
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch                  ;Draw Pixel Command
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
          
          
                     mov  dx,starty               ;set start height
                     mov  cx,startx               ;set start width
       
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
       
                     mov  dx,starty               ;set start height
                     dec  dx
                     mov  cx,startx               ;set start width
      
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
                     cmp  dx,194                  ;there was a hight greater than the hight so i changed the number
                     jnz  clr_block
                     ret
clrbreaker_shift endp
    ;===================================================================

END MAIN
