.286
.model small
.stack 100h
.data
    ;========================== breaker data
    a                db 2,?,2 dup('$')
    b                db 2,?,2 dup('$')
    c                db 9
    lenght           dw 50                                                             ;------
    Bidth            dw 10                                                             ; |
    yorigin          dw 190                                                            ;190
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
   
    ;======================================== ;blocks
    startx           dw ?
    starty           dw ?
    mywidth          dw 20
    height           dw 7
    space            dw 3
    rows             db 8
    cols             db 14
    color            db 15                                                      ;11
    end_x            dw 0
    end_y            dw 0
    starts_x         dw 0        ;===========================
                                                                                            ; --------------- ------------------
                                                                                            ;                 |cx 
    starts_y         dw 0
    rl               db 1                                                              ;?
    cc               db 23  
    
    lvl              db 1  
    
    total            db 0                                                          ;?
    ;==========================================
    ;Ball
    dummy            dw ? 
    Xc               DW 160d                                                           ; X of Top Left Corner of the Ball
    Yc               DW 100d                                                           ; Y of Top Left Corner of the Ball
    S                DW 4d                                                             ; Side Length of Ball
    CBall            DW 0d
    ; X OF Center of the Ball (initial zero will be calculated)
    Speed            dw 1bffh

    BackGroundColor  DB 00h
    ballColor        DB 0Fh
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
    letters          db "play$"
    State    db 0
    curX dw 90
    curY dw 55
    lenCur dw 5
    WedCur dw 10
    endCurx dw ?
    endCurY dw ?
    curs_color db 3
    ;================================================== send
    value db ? 
    type1 db ?
    ;================================================== secound player
    sec_breac_X dw 120
    sec_breac_Y dw 5
    sec_breac_endx dw 140
    sec_breac_endy dw 10
    sec_breac_len dw 20
    sec_breac_width dw 5
    sec_breac_yOrg dw 5
sec_breaker_color db 5
    
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
draw_curser proc

                     mov  cx,curX
                     mov  dx,curY  
                     add dx,WedCur
                     add cx,lenCur
                     mov endCurx,cx
                     mov endCurY,dx
                     sub cx,lenCur
                     sub dx,WedCur
                     d_cur1:                                         ;[]
    ;call draw_line_H

                     mov  al,curs_color                   ;Pixel color
                     mov  ah,0ch
                  
    d_cur2:            
                     int  10h
                     inc  cx
                     cmp  cx,endCurx
                     jnz  d_cur2
                     inc  dx
                     mov  cx,curX
                     cmp  dx,endCurY
                     jnz  d_cur1

ret
draw_curser endp
draw_menu proc
 call draw_curser
 call Draw_p


 ret
draw_menu endp
Draw_p PROC

                     mov  cx,125
                     mov  dx,50
    d_p1:            
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_p2:                                         ;|
       
                     int  10h
                     inc  dx
                     cmp  dx,70
                     jnz  d_p2
                     inc  cx
                     mov  dx,50
                     cmp  cx,130
                     jnz  d_p1
                     
                     mov  cx,130
                     mov  dx,50

    ;
    d_p3:                                         ;[]
    ;call draw_line_H

                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                  
    d_p4:            
                     int  10h
                     inc  cx
                     cmp  cx,140
                     jnz  d_p4
                     inc  dx
                     mov  cx,130
                     cmp  dx,60
                     jnz  d_p3

                     mov  l,30

                     mov  cx,127
                     mov  dx ,52

    d_p5:                                         ;[]
    ;call draw_line_H

                     mov  al,0                  ;Pixel color
                     mov  ah,0ch
                  
    d_p6:            
                     int  10h
                     inc  cx
                     cmp  cx,138
                     jnz  d_p6
                     inc  dx
                     mov  cx,127
                     cmp  dx,58
                     jnz  d_p5

    ;ret
Draw_p endp

Draw_l proc
                     mov  cx,145
                     mov  dx,50
    d_l1:            
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_l2:                                         ;|
       
                     int  10h
                     inc  dx
                     cmp  dx,70
                     jnz  d_l2
                     inc  cx
                     mov  dx,50
                     cmp  cx,150
                     jnz  d_l1
                     
                     mov  cx,145
                     mov  dx,66
    d_l3:            
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_l4:                                         ;_
       
                     int  10h
                     inc  cx
                     cmp  cx,157
                     jnz  d_l4
                     inc  dx
                     mov  cx,145
                     cmp  dx,70
                     jnz  d_l3
    ;ret
Draw_l endp
Draw_a proc
                      mov  cx,160d
                     mov  dx,54d

    d_a1:                                         ;[]
    ;call draw_line_H

                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                  
    d_a2:            
                     int  10h
                     inc  cx
                     cmp  cx,175
                     jnz  d_a2
                     inc  dx
                     mov  cx,160
                     cmp  dx,70
                     jnz  d_a1

                     mov  cx,164
                     mov  dx,63

    d_a3:                                         ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_a4:            
                     int  10h
                     inc  cx
                     cmp  cx,172
                     jnz  d_a3
                     inc  dx
                     mov  cx,164
                     cmp  dx,67
                     jnz  d_a4

                     mov  cx,160
                     mov  dx,58

    d_a5:                                         ;[]
    ;call draw_line_H

                     mov  al,00h                  ;Pixel color
                     mov  ah,0ch
                  
    d_a6:            
                     int  10h
                     inc  cx
                     cmp  cx,172
                     jnz  d_a5
                     inc  dx
                     mov  cx,160
                     cmp  dx,60
                     jnz  d_a6

    ;ret
Draw_a endp

Draw_y proc
                     mov  cx,180
                     mov  dx,50
    d_y1:                                         ;[]
    ;call draw_line_H

                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                  
    d_y2:            
                     int  10h
                     inc  cx
                     cmp  cx,193
                     jnz  d_y2
                     inc  dx
                     mov  cx,180
                     cmp  dx,60
                     jnz  d_y1

                     mov  cx,182
                     mov  dx,50
    d_y3:                                         ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_y4:            
                     int  10h
                     inc  cx
                     cmp  cx,191
                     jnz  d_y3
                     inc  dx
                     mov  cx,182
                     cmp  dx,57
                     jnz  d_y4

                     mov  cx,191
                     mov  dx,50
    d_y5:            
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_y6:                                         ;|
       
                     int  10h
                     inc  dx
                     cmp  dx,70
                     jnz  d_y6
                     inc  cx
                     mov  dx,50
                     cmp  cx,193
                     jnz  d_y5

                     mov  cx,184
                     mov  dx,67
    d_y7:            
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_y8:                                         ;_
       
                     int  10h
                     inc  cx
                     cmp  cx,193
                     jnz  d_y8
                     inc  dx
                     mov  cx,184
                     cmp  dx,70
                     jnz  d_y7

    ;ret
Draw_y endp

Draw_s proc
                     mov  cx,110
                     mov  dx,80

    d_s1:                                         ;[]
    ;call draw_line_H

                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                  
    d_s2:            
                     int  10h
                     inc  cx
                     cmp  cx,125
                     jnz  d_s2
                     inc  dx
                     mov  cx,110
                     cmp  dx,100
                     jnz  d_s1

                     mov  cx,114
                     mov  dx,82
    d_s3:                                         ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_s4:            
                     int  10h
                     inc  cx
                     cmp  cx,125
                     jnz  d_s4
                     inc  dx
                     mov  cx,114
                     cmp  dx,87
                     jnz  d_s3


                     mov  cx,110
                     mov  dx,92
    d_s5:                                         ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_s6:            
                     int  10h
                     inc  cx
                     cmp  cx,121
                     jnz  d_s6
                     inc  dx
                     mov  cx,110
                     cmp  dx,97
                     jnz  d_s5

    ;ret
Draw_s endp
Draw_c proc
                     mov  cx,130
                     mov  dx,84
    d_c1:                                         ;[]
    ;call draw_line_H

                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                  
    d_c2:            
                     int  10h
                     inc  cx
                     cmp  cx,145
                     jnz  d_c2
                     inc  dx
                     mov  cx,130
                     cmp  dx,100
                     jnz  d_c1
                     mov  cx,133
                     mov  dx,87

    d_c3:                                         ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_c4:            
                     int  10h
                     inc  cx
                     cmp  cx,145
                     jnz  d_c4
                     inc  dx
                     mov  cx,133
                     cmp  dx,97
                     jnz  d_c3
    ;ret
Draw_c endp

Draw_o proc
                     mov  cx,150
                     mov  dx,84
    d_o1:                                         ;[]
    ;call draw_line_H

                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                  
    d_o2:            
                     int  10h
                     inc  cx
                     cmp  cx,165
                     jnz  d_o2
                     inc  dx
                     mov  cx,150
                     cmp  dx,100
                     jnz  d_o1
                     mov  cx,153
                     mov  dx,87

    d_o3:                                         ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_o4:            
                     int  10h
                     inc  cx
                     cmp  cx,162
                     jnz  d_o4
                     inc  dx
                     mov  cx,153
                     cmp  dx,97
                     jnz  d_o3
    ;ret
Draw_o endp


Draw_r proc
                     mov  cx,170d
                     mov  dx,84d
    d_r1:            
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_r2:                                         ;|
       
                     int  10h
                     inc  dx
                     cmp  dx,100
                     jnz  d_r2
                     inc  cx
                     mov  dx,84
                     cmp  cx,174
                     jnz  d_r1
                     mov  cx,170d
                     mov  dx,88d

    d_r3:            
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_r4:                                         ;_
       
                     int  10h
                     inc  cx
                     cmp  cx,181
                     jnz  d_r4
                     inc  dx
                     mov  cx,170
                     cmp  dx,92
                     jnz  d_r3
    ;ret
Draw_r endp
Draw_e proc
                     mov  cx,187
                     mov  dx,84
    d_e1:                                         ;[]
    ;call draw_line_H

                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                  
    d_e2:            
                     int  10h
                     inc  cx
                     cmp  cx,203
                     jnz  d_e2
                     inc  dx
                     mov  cx,187
                     cmp  dx,100
                     jnz  d_e1
                     mov  cx,190d
                     mov  dx,87

    d_e3:                                         ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_e4:            
                     int  10h
                     inc  cx
                     cmp  cx,199
                     jnz  d_e4
                     inc  dx
                     mov  cx,190
                     cmp  dx,92
                     jnz  d_e3

                     mov  cx,190d
                     mov  dx,94d

                     
    d_e5:                                         ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_e6:            
                     int  10h
                     inc  cx
                     cmp  cx,203
                     jnz  d_e6
                     inc  dx
                     mov  cx,190
                     cmp  dx,98
                     jnz  d_e5
    ;ret
Draw_e endp
Draw_c2 proc
                     mov  cx,130d
                     mov  dx,110d
                   
    d_c21:                                        ;[]
    ;call draw_line_H

                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                  
    d_c22:           
                     int  10h
                     inc  cx
                     cmp  cx,150
                     jnz  d_c22
                     inc  dx
                     mov  cx,130
                     cmp  dx,130
                     jnz  d_c21

                     mov  cx,133
                     mov  dx,113

    d_c23:                                        ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_c24:           
                     int  10h
                     inc  cx
                     cmp  cx,150
                     jnz  d_c24
                     inc  dx
                     mov  cx,133
                     cmp  dx,127
                     jnz  d_c23
    ;ret
Draw_c2 endp

Draw_h proc
                     mov  cx,155d
                     mov  dx,110d


    d_h1:            
                     mov  al, 5                   ;Pixel color
                     mov  ah,0ch
                     
    d_h2:                                         ;|
       
                     int  10h
                     inc  dx
                     cmp  dx,130
                     jnz  d_h2
                     inc  cx
                     mov  dx,110
                     cmp  cx,160
                     jnz  d_h1
                    
                     mov  cx,155d
                     mov  dx,118
    d_h3:            
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_h4:                                         ;_
       
                     int  10h
                     inc  cx
                     cmp  cx,170
                     jnz  d_h4
                     inc  dx
                     mov  cx,155
                     cmp  dx,123
                     jnz  d_h3
                     mov  cx,165d
                     mov  dx,118d
    d_h5:            
                     mov  al, 5                   ;Pixel color
                     mov  ah,0ch
                     
    d_h6:                                         ;|
       
                     int  10h
                     inc  dx
                     cmp  dx,130
                     jnz  d_h6
                     inc  cx
                     mov  dx,118
                     cmp  cx,170
                     jnz  d_h5

    ;ret
Draw_h endp
Draw_a2 proc
                     mov  cx,175d
                     mov  dx,115d

    d_a21:                                        ;[]
    ;call draw_line_H

                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                  
    d_a22:           
                     int  10h
                     inc  cx
                     cmp  cx,190
                     jnz  d_a22
                     inc  dx
                     mov  cx,175
                     cmp  dx,130
                     jnz  d_a21

                     mov  cx,179
                     mov  dx,123

    d_a23:                                        ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_a24:           
                     int  10h
                     inc  cx
                     cmp  cx,187
                     jnz  d_a23
                     inc  dx
                     mov  cx,179
                     cmp  dx,127
                     jnz  d_a24

                     mov  cx,175
                     mov  dx,117

    d_a25:                                        ;[]
    ;call draw_line_H

                     mov  al,0                    ;Pixel color
                     mov  ah,0ch
                  
    d_a26:           
                     int  10h
                     inc  cx
                     cmp  cx,187
                     jnz  d_a25
                     inc  dx
                     mov  cx,175
                     cmp  dx,120
                     jnz  d_a26

    ;ret
Draw_a2 endp
Draw_t proc
                     mov  cx,200d
                     mov  dx,110d

    d_t1:            
                     mov  al, 5                   ;Pixel color
                     mov  ah,0ch
                     
    d_t2:                                         ;|
       
                     int  10h
                     inc  dx
                     cmp  dx,130
                     jnz  d_t2
                     inc  cx
                     mov  dx,110
                     cmp  cx,204
                     jnz  d_t1

                     mov  cx,195d
                     mov  dx,114
    d_t3:            
                     mov  al,5                    ;Pixel color
                     mov  ah,0ch
                     
    d_t4:                                         ;_
       
                     int  10h
                     inc  cx
                     cmp  cx,210
                     jnz  d_t4
                     inc  dx
                     mov  cx,195
                     cmp  dx,117
                     jnz  d_t3
                     ret
Draw_t endp

send_data proc 


 
    ;========================
            mov dx , 3FDH	; Line Status Register 
            In al , dx 			;Read Line Status
            AND al , 00100000b

trans_data:
;Set port configuration
    mov dx,3fbh
    mov al,00011011b
    out dx,al 

            mov dx , 3F8H		; Transmit data register
            mov al,value
            out dx , al 
            end_send:
ret
send_data endp

recive_data proc
 ;Set port configuration
    mov dx,3fbh
    mov al,00011011b
    out dx,al

    ;Check that Data Ready from UART
    CHK:    mov dx , 3FDH		; Line Status Register
    	    in al , dx 
            AND al , 1
            
            Jnz recive_data_cont     ; if there is not char in uart go check for key pressed
              jmp recive_data_cont2
recive_data_cont:

 
    ;If Ready read the VALUE in Receive data register
            mov dx , 03F8H
            in al , dx 
            mov value , al    
            ; add value to sec_curser_X
            pusha
            ; clear breaker then re-draw
            
            mov sec_breaker_color,0
            call draw_breaker2
            
            mov sec_breaker_color,5
            ;=========================
            mov cx,sec_breac_X
            mov bl,value
            and bl,128
            jnz negative
            mov dh,0
            jmp cont_rec1
            negative:
            mov dh,0ffh
            cont_rec1:
            mov dl,value
            add cx,dx
            mov sec_breac_X,cx
            add cx,sec_breac_len
            mov sec_breac_endx,cx
         
            popa
call draw_breaker2
recive_data_cont2:

ret
recive_data ENDP

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


; initinalize COM
    ;Set Divisor Latch Access Bit
    mov dx,3fbh 			; Line Control Register
    mov al,10000000b		;Set Divisor Latch Access Bit
    out dx,al				;Out it
    ;Set LSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f8h			
    mov al,01h			
    out dx,al

    ;Set MSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f9h
    mov al,00h
    out dx,al


jmp play
    Menu: 
    call draw_menu           
    mov ah,0
 int 16h
 cmp ah,48h
 jnz mov_down

 mov ax,curY
 cmp ax,55
 jb Menu

 mov curs_color,0
 call draw_curser
  mov curs_color,3
  mov ax,curY
   sub ax,30
 mov curY,ax
 call draw_curser
 dec State
 mov_down:
 cmp ah,80
 jnz Menu
 mov ax,curY
 cmp ax,110
 jg Menu
 
  mov curs_color,0
 call draw_curser
  mov curs_color,3
  mov ax,curY
  add ax,30
 mov curY,ax
 call draw_curser
 inc State
 jmp  Menu
    play:            
           




    ;p
   

    ;===========================
    ; Set BackGround Color
                     MOV  AH , 0Bh
                     MOV  BH , 00h
                     MOV  BL , BackGroundColor    ; BackGround Color
                     int  10h


    ;  CALL RestartBall
  


    ;======================================
    ;;;;;;;;;;;;choose level;;;;;;;;;;;;;;;;;
    ;======================================
    mov lvl,2
    cmp lvl,1
    jnz cmpAgain
    mov rows,10
    mov cols,14
    mov starts_x,0
    mov starts_y,0
    jmp choice_done
    cmpAgain:
    cmp lvl,2
    jnz lvl3 
    mov rows,7
    mov cols,14
    mov starts_x,0
    mov starts_y,50
    jmp choice_done
    lvl3:
    mov starts_x,46
    mov starts_y,0
    mov rows,10
    mov cols,10
    choice_done:
    ;=======================================
                     call draw_grid_loop

                     call draw_breaker

                     call draw_breaker2
                    ;  CALL DrawBall              ;check the upper pixel of the ball is not as the background ;;;;;;;;;;;;;;;

                     mov  cx,0
    game:            
                     cmp  cx,09ffh
                     jnz  Draw_break2
                     CALL MovBall
                     mov  cx,0
                     pusha
                   call checkCollisionBlocks
                   popa
    Draw_break2:     
                      pusha
                     mov dx,5
                     mov dx,0
                     mov dl,-5
                     
                     call Mov_Breaker
                     popa
                     pusha
                     call recive_data
                     popa
                     inc  cx
                     jmp  game

    end1:            

MAIN ENDP

Mov_Breaker proc

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
                     jnz cont2
    ;jnz loop2
                     mov  dx,negativebs
                     mov  rl,0                    ;;;;;;;;;;
    movr:       

        pusha
    
    mov value, dl                ;;;;;;;;;;;;;;;;;;;send shift value
    call send_data
   
    popa     
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


                     ret
Mov_Breaker endp

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
                     mov  cl ,rows
                     push starts_x
    grid_loop:       
    ;change color
                     pop starts_x
                    
                     cmp lvl,3
                     jnz normal 
                     cmp cl,2
                     jbe rock
                     mov color,4
                     jmp done_color
                     rock:
                     mov color,8
                     jmp done_color


                     normal:
                     cmp color,12
                     jnz firstc1
                     mov color,9
                     jmp secondc1
                     firstc1:
                     mov color,12
                     secondc1:
                    
                     
                     done_color:
                     mov  dl,cols
                     push starts_x

    line_loop:       
                     mov  bx,starts_x 
                     mov  startx,bx
                     mov  bx,starts_y
                     mov  starty,bx
                     push cx
                     push dx
                     call myblock
                     inc total
                     pop  dx
                     pop  cx
                     add starts_x,23
                     dec  dl
                     jnz  line_loop
                     add starts_y,10
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

draw_breaker2 proc

                     mov  ax ,sec_breac_endx ;endx    
                     cmp  ax,320
                     ja   rightbound_sec
                     cmp  ax,sec_breac_len
                     ja   inbound_sec
                     mov  ax,sec_breac_len
                     mov  sec_breac_X,0
                     mov  sec_breac_endx,ax
                   
                     jmp  cont3_sec
    rightbound_sec:      
                     mov  ax,sec_breac_len;lenght
                     mov  bx,320
                     sub  bx,ax
                     mov sec_breac_X,bx
                     mov  sec_breac_endx,320
    inbound_sec:         
                     mov  ax,sec_breac_endx;endx
                     mov  bx,sec_breac_len;lenght
                     sub  ax,bx
                     mov  sec_breac_X,ax
        cont3_sec:

    loop12:           
                    
                     mov  cx,sec_breac_X                   ;Column
                     mov  dx,sec_breac_Y                    ;Row
                     mov  al,sec_breaker_color                    ;Pixel color
                     mov  ah,0ch                  ;Draw Pixel Command
    back2:            int  10h
                     inc  cx
           
                     cmp  cx,sec_breac_endx
                     jnz  back2
                     inc  dx
                     mov  sec_breac_Y,dx
            
                     cmp  dx,sec_breac_endy
                     jnz  loop12

                     mov  ax,sec_breac_yOrg
                     mov  sec_breac_y,ax
                     ret
draw_breaker2 endp




    ;==============================================================================


myblock proc

    ;=====change color====
                     cmp lvl,3
                     jz no_cc 
                     cmp color,9
                     jnz firstc
                     mov color,12
                     jmp secondc
                     firstc:
                     mov color,9
                     secondc:
                   
          
                     no_cc:
                   

;;;;;;;;;;;;;;;;;power up
                      cmp lvl,1
                      jnz start_draw
                      cmp total,33
                      jnz start_draw
                        mov color,10
                     





                 start_draw:
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



clearMyBlock proc

                    mov color, 0          
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
    clearBlock:           
                     inc  dx
                     mov  cx,startx
                     mov  al,color
                     mov  ah,0ch
    clearLine:            
                     int  10h
                     inc  cx
                     cmp  cx,end_x
                     jnz  line
                     cmp  dx,end_y
                     jnz  block
                     ret
clearMyBlock endp

; detect the background color if not black so there is collision
; xc -> div 23 get the divisor and mul with 23 to get block start x 
; Yc -> div 10 get the divisor and mul with 10 to get block start y
; 

detectBlockStartPoints proc

mov ax, xc      ; xc of the ball
mov cx, mywidth ; block width 
add cx, space   ;div by block length and space in between => cx = 23 for our eg.
mov dx, 0
div cx          ;  AX = AX/CX and DX=AX % CX   
mul cx          ; mul with the block width and space in between => now ax contain the startx for the block

mov startx, ax          ; startx has the right posit

mov ax, yc      ; xc of the ball
mov cx, height ; block width 
add cx, space   ;div by block length and space in between => cx = 10 for our eg.
mov dx, 0
div cx          ;  AX = AX/CX and DX=AX % CX   
mul cx          ; mul with the block width and space in between => now ax contain the startx for the block

mov starty, ax          ; startx has the right posit

    ret
detectBlockStartPoints endp


checkCollisionBlocks proc 
; upper collision

mov cx, xc          ; cx -> the upper left corner of the ball 
mov dx, Yc          
sub dx, 1           ; check for just the upper pixel of the ball if not background then it is a block

mov ax, S           ; set ax to the ball size
mov dummy, ax
repBallSize:
cmp dummy, 0       ; compare till the ball size to check if there is collision with the upper pixel of the ball in each side pixel
jnz label2
jmp exitCheckColl
label2:

mov bh, 0               ; page number
mov ah, 0DH             ; get background color into al
int 10h                 ; get 
inc cx
cmp al, BackGroundColor ; if the current pixel color not same as the background loop till end of ball width
jnz colorBlockBackground
dec dummy
jnz repBallSize
jnz label3
jmp exitCheckColl
label3:

colorBlockBackground:

push ax
push bx
push cx
push dx
call detectBlockStartPoints       ; set the values of startx, starty to prepare the block to hide
pop dx
pop cx
pop bx
pop ax

push ax
push bx
push cx
push dx
call clearMyBlock               ; color the block in position startx, starty with background color 
pop dx
pop cx
pop bx
pop ax

upperBLockCollision:
; NEG  ShiftX
NEG  Shifty
jmp repBallSize


; down block
mov cx, xc          ; cx -> the upper left corner of the ball 
mov dx, Yc          
add dx, 1           ; check for just the upper pixel of the ball if not background then it is a block
mov ax, S           ; set ax to the ball size
mov dummy, ax
repDownBallSize:
cmp dummy, 0       ; compare till the ball size to check if there is collision with the upper pixel of the ball in each side pixel
jz exitCheckColl
mov bh, 0               ; page number
mov ah, 0DH             ; get background color into al
int 10h                 ; get 
inc cx
cmp al, BackGroundColor ; if the current pixel color not same as the background loop till end of ball width
jnz colorDownBlockBackground
dec dummy
jnz repDownBallSize
jz exitCheckColl
colorDownBlockBackground:
push ax
push bx
push cx
push dx
call detectBlockStartPoints       ; set the values of startx, starty to prepare the block to hide
pop dx
pop cx
pop bx
pop ax

push ax
push bx
push cx
push dx
call clearMyBlock               ; color the block in position startx, starty with background color 
pop dx
pop cx
pop bx
pop ax

downBLockCollision:
; NEG  ShiftX
NEG  Shifty
jmp repDownBallSize

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; side collision

mov cx, xc          ; cx -> the upper left corner of the ball 
mov dx, Yc          
add dx, 1           ; check for just the upper pixel of the ball if not background then it is a block
mov ax, S           ; set ax to the ball size
mov dummy, ax
repRightSideBallSize:
cmp dummy, 0       ; compare till the ball size to check if there is collision with the upper pixel of the ball in each side pixel
jz exitCheckColl
mov bh, 0               ; page number
mov ah, 0DH             ; get background color into al
int 10h                 ; get 
inc cx
cmp al, BackGroundColor ; if the current pixel color not same as the background loop till end of ball width
jnz colorRightSideBlockBackground
dec dummy
jnz repRightSideBallSize
jz exitCheckColl
colorRightSideBlockBackground:
push ax
push bx
push cx
push dx
call detectBlockStartPoints       ; set the values of startx, starty to prepare the block to hide
pop dx
pop cx
pop bx
pop ax
; sub startx, 20
push ax
push bx
push cx
push dx
call clearMyBlock               ; color the block in position startx, starty with background color 
pop dx
pop cx
pop bx
pop ax

rightSideBLockCollision:
; NEG  ShiftX
NEG  Shifty
jmp repRightSideBallSize




    exitCheckColl:
    ret
checkCollisionBlocks endp

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
