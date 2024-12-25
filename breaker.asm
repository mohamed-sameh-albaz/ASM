.286
.model small
.stack 100h
.data
    ;========================== breaker data
    determine_breaker_Flag        db 0                                                          ; To know which Breaker will be set
    lenght                        dw 40                                                         ;------
    default_lenght                 dw 40                                                         ;------
    Bidth                         dw 5                                                          ; |
    yorigin                       dw 192                                                        ;190
    defaultyorigin                  dw 192 
    x                             dw 140
    y                             dw 192
    defaultx                     DW 140                                                  
    defaulty                     DW 192    
    breaker_color                 db 5
    default_breaker_color         db 5
    endx                          dw 180
    endy                          dw 197
    defaultendx                     DW 180                                                         
    defaultendy                     DW 197   
    CBreaker                      dw ?
    buttonpressed                 db ?
    breakersmothness              dw 5
    negativebs                    dw -5
    firstQ                        dw ?
    thirdQ                        dw ?
    ;========================== first breaker data
    first_lenght                  dw 40                                                         ;------
    first_Bidth                   dw 5                                                          ; |
    first_yorigin                 dw 192                                                        ;190
    first_defaultyorigin          dw 192 
    first_x                       dw 140
    first_y                       dw 192
    first_defaultx                 dw 140
    first_defaulty                dw 192
    first_breaker                 db 5
    first_endx                    dw 180
    first_endy                    dw 197
    first_defaultendx                 dw 180
    first_defaultendy                dw 197
    first_CBreaker                dw ?
    first_buttonpressed           db ?
    first_breakersmothness        dw 5
    first_negativebs              dw -5
    first_firstQ                  dw ?
    first_thirdQ                  dw ?
    ;========================== second breaker data
    sec_lenght                    dw 40                                                         ;------
    sec_Bidth                     dw 5                                                          ; |
    sec_yorigin                   dw 3                                                          ;190
    sec_defaultyorigin           dw 3 
    sec_x                         dw 140
    sec_y                         dw 3
    sec_defaultx                 dw 140
    sec_defaulty                  dw 5
    sec_breaker                   db 5
    sec_endx                      dw 180
    sec_endy                      dw 8
    sec_defaultendx                 dw 180
    sec_defaultendy                dw 8
    sec_CBreaker                  dw ?
    sec_buttonpressed             db ?
    sec_breakersmothness          dw 5
    sec_negativebs                dw -5
    sec_firstQ                    dw ?
    sec_thirdQ                    dw ?
    sec_breaker_color             db 5


    ;========================== third breaker data
    determine_set_get_mode_4      db 0
    third_lenght                  dw 50                                                         ;------
    third_Bidth                   dw 5                                                          ; |
    third_yorigin                 dw 192                                                        ;190
    third_x                       dw 120
    third_y                       dw 192
    third_defaultx                 dw 120
    third_defaulty                dw 192
    third_breaker                 db 5
    third_endx                    dw 170
    third_endy                    dw 197
    third_defaultendx                 dw 170
    third_defaultendy                dw 197
    third_CBreaker                dw ?
    third_buttonpressed           db ?
    third_breakersmothness        dw 5
    third_negativebs              dw -5
    third_firstQ                  dw ?
    third_thirdQ                  dw ?







    ;======================================== ;blocks
    startx                        dw ?
    starty                        dw ?
    mywidth                       dw 21
    height                        dw 8
    space                         dw 2
    rows                          db 8
    cols                          db 14
    color                         db 15                                                         ;11
    end_x                         dw 0
    end_y                         dw 0
    starts_x                      dw 0                                                          ;===========================
    ; --------------- ------------------
    ;                 |cx
    starts_y                      dw 0
    rl                            db 1
    cc                            db 23
    
    lvl                           db 1
    
    total                         db 0          ; increase breaker length
    total2                        db 0          ; for fire ball powerup
    total3                        db 0          ; decrease breaker lenght
    grey_block                    db 8
    red_block                     db 4
    green_block                   db 10
    greenFlag                     db 0
    cntIncBreaker                 db 100
    defaultIncBreaker             db 100 
    orange_block                  db 0Eh
    fire                          db 0
    cntFire                       db 100
    defaultCntFire                db 100
    ;==========================================     ;Ball
    determineFlag                 db 0                                                          ; To know which ball will be set
    dummy                         dw ?
    upperCollFlag                 db 0
    lowerCollFlag                 db 0
    leftCollFlag                  db 0
    rightCollFlag                 db 0
    Xc                            DW 160d                                                       ; X of Top Left Corner of the Ball
    Yc                            DW 100d                                                        ; Y of Top Left Corner of the Ball
                                              
    S                             DW 4d                                                         ; Side Length of Ball
    CBall                         DW 0d
    ;09ffh                                                       ; X OF Center of the Ball (initial zero will be calculated)
    Speed                         dw 2bffh
    BackGroundColor               DB 00h
    ballColor                     DB 0Fh
    Flag                          DB 0                                                          ;Flag to clear the ball in its previous location
    WindowWidth                   DW 320d
    WindowHeight                  DW 200d
    WindowHeight_start            DW 0                                                          ;
    ; ShiftX DW  0d
    ShiftX                        DW 2d
    ShiftY                        DW 2d
    DefaultShiftX                 DW 2d
    DefaultShiftY                 DW 2d


    PrevTime                      DB 0
    ChangeShiftlow                dw 0
    ChangeShiftHigh               dw 0
    flagBallCollision             db 0
    x_limit                       dw 5
    ;================================================== first player ball
    first_ball_Xc                 DW 160d                                                       ; X of Top Left Corner of the 1St Ball
    first_ball_Yc                 DW 100d                                                        ; Y of Top Left Corner of the 1St Ball
    first_ball_S                  DW 4d                                                         ; Side Length of 1St  Ball
    first_ball_CBall              DW 0d                                                         ; X OF Center of the 1St Ball (initial zero will be calculated)
    first_ball_BackGroundColor    DB 00h
    first_ball_ballColor          DB 0Fh
    first_ball_Flag               DB 0                                                          ;Flag to clear the 1St ball in its previous location

    first_ball_WindowWidth        DW 320d
    first_ball_WindowHeight_start DW 0d                                                         ; start of window height of  first player
    first_ball_WindowHeight_end   DW 200d                                                       ; end of window height of  first player

    ; ShiftX DW  0d

    first_ball_ShiftX             DW 2d
    first_ball_ShiftY             DW -2d
    first_ball_DefaultShiftX      DW 2d
    first_ball_DefaultShiftY      DW -2d

    ; PrevTime         DB 0
    first_ball_ChangeShiftlow     dw 0
    first_ball_ChangeShiftHigh    dw 0
    first_ball_flag_collision     db 0
    ;================================================== second player ball
    sec_ball_Xc                   DW 160d                                                       ; X of Top Left Corner of the 2nd Ball
    sec_ball_Yc                   DW 100d                                                       ; Y of Top Left Corner of the 2nd Ball
    sec_ball_S                    DW 4d                                                         ; Side Length of 2nd  Ball
    sec_ball_CBall                DW 0d                                                         ; X OF Center of the 2nd Ball (initial zero will be calculated)
    sec_ball_BackGroundColor      DB 00h
    sec_ball_ballColor            DB 3h
    sec_ball_Flag                 DB 0                                                          ;Flag to clear the ball in its previous location

    sec_ball_WindowWidth          DW 320d
    sec_ball_WindowHeight_start   DW 0d                                                         ; start of window height of  second player
    sec_ball_WindowHeight_end     DW 200d                                                       ; end of window height of  second player

    ; ShiftX DW  0d
    sec_ball_ShiftX               DW -2d
    sec_ball_ShiftY               DW 2d
    sec_ball_DefaultShiftX        DW -2d
    sec_ball_DefaultShiftY        DW 2d
    ; PrevTime         DB 0
    sec_ball_ChangeShiftlow       dw 0
    sec_ball_ChangeShiftHigh      dw 0
    sec_ball_flag_collision       db 0
    ;=================================================================== menu
    l                             dw 30
    lorg                          dw 50
    w                             dw 9
    worg                          dw 20
    letters                       db "play$"
    State                         db 0
    curX                          dw 90
    curY                          dw 55
    lenCur                        dw 5
    WedCur                        dw 10
    endCurx                       dw ?
    endCurY                       dw ?
    curs_color                    db 12
    mode1                         db "Single Player Easy $"
    mode2                         db "Single Player Hard $"
    mode3                         db "Multi-Player Offline$"
    mode4                         db "Multi-Player Online$"
    mode5                         db "Multi-Player Online colloaboration $"
    option_single                 db  " <<<  Controllers  >>>> $"
    option_multi                 db  "  <<<Player 1 Controllers >>>$"
    option1                       db "Left-Right Arrow$"
    option2                       db "A  -  D   button$"
    message_online                db "Wait for other player press ESC to leave$"
    ;================================================== send
    value                         db ?
    type1                         db ?
    ;================================================== secound player
    ; sec_breac_X dw 120
    ; sec_breac_Y dw 5
    ; sec_breac_endx dw 140
    ; sec_breac_endy dw 10
    ; sec_breac_len dw 20
    ; sec_breac_width dw 5
    ; sec_breac_yOrg dw 5
    ; sec_breaker_color db 5
    ; sec_breaker_center dw ?
    ;================================================== first player
    first_heart                   db 3
    default_heart                 db 3
    first_score                   dw 0
    ;================================================== secound player
    sec_heart                     db 3
    sec_score                     dw 0
    increamentPoints              dw 10
    ;========================================================= mode
    mode                          db 3
    first_player_butt             db 0
    sec_player_butt               db 1
    curr_option                   db 0
    prevmode                     db 9

    right_arrow  db 4DH 
    left_arrow   db 4BH 
    right_butt   db 20H   
    left_butt    db 1EH  
    curr_right   db ?
    curr_left    db ?
    flag_init_port db 0 
    begin_game     db  0
    pause_flag     db 0
    ; mode 0 single player in level 1
    ; mode 1 single player in level 2
    ; mode 2 multiplayer in level 3  same device
    ; mode 3 multiplayer in level 3  send and recieve (2 devices)
    ;=================================================================chat
    ;===================================================================
    checked                       db 0

    messsage                      DB 'reciever on , press esc to end session', 0AH, 0DH, "$"
    messsage2                     DB 'Enter your string', 0AH, 0DH, "$"
    messsage3                     DB 'good by then', 0AH, 0DH, "$"
    messege_send                  db 'to send ',0ah,0dh,"$"

    sendx                         db 0
    sendy                         db 0bh
    recx                          db 0
    recy                          db 1
    InDATA                        db 30,?,30 dup('$')
    emptystr                      db 10,13,'$'
    page1                         db 0

    ;=========================================score
    ;name db 12,?,12 dup('$'),10,13
    player1_str                   db "Player1:   $",13,10
    string_score1                 db "$$$$$$$$$"
    player2_str                   db "Player2:   $",13,10
    string_score2                 db "$$$$$$$$$$",13,10
    who_lost_flage                db ?
;===============================================PowerUps
    incBreakerFlag                DB 0


.CODE

setBreaker1 PROC

                                   cmp   determine_breaker_Flag , 1
                                   jz    sec_breaker_set
    ; first breaker set

                                   MOV   AX   , first_lenght
                                   MOV   lenght        ,AX
                                   MOV   AX ,first_Bidth
                                   MOV   Bidth         ,AX
                                   MOV   AX  ,first_yorigin
                                   MOV   yorigin       ,AX
                                   MOV   AX ,first_x
                                   MOV   x             ,AX
                                   MOV   AX  ,first_y
                                   MOV   y             ,AX

                                   MOV   AX ,first_defaultx
                                   MOV   defaultx             ,AX
                                   MOV   AX  ,first_defaulty
                                   MOV   defaulty             ,AX
                                   MOV   AX  ,first_defaultyorigin
                                   MOV       defaultyorigin    ,AX

                                   MOV   AL   ,first_breaker
                                   MOV   breaker_color       ,AL
                                   MOV   AX  ,first_endx
                                   MOV   endx          ,AX
                                   MOV   AX ,first_endy
                                   MOV   endy          ,AX

                                   MOV   AX  ,first_defaultendx
                                   MOV   defaultendx          ,AX
                                   MOV   AX ,first_defaultendy
                                   MOV   defaultendy          ,AX


                                   MOV   AX   ,first_CBreaker
                                   MOV   CBreaker      ,AX
                                   MOV   AL  ,first_buttonpressed
                                   MOV   buttonpressed ,AL
                                   MOV   AX ,first_breakersmothness
                                   MOV   breakersmothness,AX
                                   MOV   AX  ,first_negativebs
                                   MOV   negativebs    ,AX
                                   MOV   AX  ,first_firstQ
                                   MOV   firstQ        ,AX
                                   MOV   AX  ,first_thirdQ
                                   MOV   thirdQ        ,AX




                                   RET
    sec_breaker_set:               


                                   MOV   AX   , sec_lenght
                                   MOV   lenght        ,AX
                                   MOV   AX ,sec_Bidth
                                   MOV   Bidth         ,AX
                                   MOV   AX  ,sec_yorigin
                                   MOV   yorigin       ,AX
                                   MOV   AX ,sec_x
                                   MOV   x             ,AX
                                   MOV   AX  ,sec_y
                                   MOV   y             ,AX
                                  MOV   AX ,sec_defaultx
                                   MOV   defaultx             ,AX
                                   MOV   AX  ,sec_defaulty
                                   MOV   defaulty             ,AX






                                   MOV   AL   ,sec_breaker
                                   MOV   breaker_color       ,AL
                                   MOV   AX  ,sec_endx
                                   MOV   endx          ,AX
                                   MOV   AX ,sec_endy
                                   MOV   endy          ,AX

                                   MOV   AX  ,sec_defaultendx
                                   MOV   defaultendx          ,AX
                                   MOV   AX ,sec_defaultendy
                                   MOV   defaultendy          ,AX

                                   MOV   AX ,sec_defaultyorigin
                                   MOV   defaultyorigin          ,AX


                                   MOV   AX   ,sec_CBreaker
                                   MOV   CBreaker      ,AX
                                   MOV   AL  ,sec_buttonpressed
                                   MOV   buttonpressed ,AL
                                   MOV   AX ,sec_breakersmothness
                                   MOV   breakersmothness,AX
                                   MOV   AX  ,sec_negativebs
                                   MOV   negativebs    ,AX
                                   MOV   AX  ,sec_firstQ
                                   MOV   firstQ        ,AX
                                   MOV   AX  ,sec_thirdQ
                                   MOV   thirdQ        ,AX

                                   RET
setBreaker1 ENDP




setBreaker2 PROC

                                   cmp   determine_breaker_Flag , 1
                                   jz    sec_breaker_set2
    ; first breaker set
                                   MOV   AX   , lenght
                                   MOV   first_lenght        ,AX
                                   MOV   AX ,Bidth
                                   MOV   first_Bidth      ,AX
    
                                   MOV   AX  ,yorigin
                                   MOV   first_yorigin     ,AX
                                   MOV   AX ,x
                                   MOV   first_x          ,AX
                                   MOV   AX  ,y
                                   MOV   first_y          ,AX


                                   MOV   AX , defaultx            
                                  MOV  first_defaultx  ,AX

                                   MOV   AX  , defaulty           
                                   MOV  first_defaulty   ,AX

                                   MOV   AX  , defaultyorigin           
                                   MOV  first_defaultyorigin   ,AX


                                   MOV   AL   ,breaker_color
                                   MOV   first_breaker    ,AL
                                   MOV   AX  ,endx
                                   MOV   first_endx     ,AX
                                   MOV   AX ,endy
                                   MOV   first_endy      ,AX

                               MOV   AX , defaultendx            
                                  MOV  first_defaultendx  ,AX

                                   MOV   AX  , defaultendy           
                                   MOV  first_defaultendy   ,AX







                                   MOV   AX   ,CBreaker
                                   MOV   first_CBreaker   ,AX
                                   MOV   AL  ,buttonpressed
                                   MOV   first_buttonpressed ,AL
                                   MOV   AX ,breakersmothness
                                   MOV   first_breakersmothness,AX
                                   MOV   AX  ,  negativebs
                                   MOV   first_negativebs ,AX
                                   MOV   AX  ,firstQ
                                   MOV   first_firstQ    ,AX
                                   MOV   AX  ,thirdQ
                                   MOV   first_thirdQ    ,AX


                                   RET
    sec_breaker_set2:              
                                   MOV   AX   , lenght
                                   MOV   sec_lenght        ,AX
                                   MOV   AX ,Bidth
                                   MOV   sec_Bidth      ,AX
    
                                   MOV   AX  ,yorigin
                                   MOV   sec_yorigin     ,AX
                                   MOV   AX ,x
                                   MOV   sec_x          ,AX
                                   MOV   AX  ,y
                                   MOV   sec_y          ,AX

                               MOV   AX , defaultx            
                                  MOV  sec_defaultx  ,AX

                                   MOV   AX  , defaulty           
                                   MOV  sec_defaulty   ,AX

                                   MOV   AX  , defaultyorigin           
                                   MOV  sec_defaultyorigin   ,AX

                                   MOV   AL   ,breaker_color
                                   MOV   sec_breaker    ,AL
                                   MOV   AX  ,endx
                                   MOV   sec_endx     ,AX
                                   MOV   AX ,endy
                                   MOV   sec_endy      ,AX

                               MOV   AX , defaultendx            
                                  MOV  sec_defaultendx  ,AX

                                   MOV   AX  , defaultendy           
                                   MOV  sec_defaultendy   ,AX




                                   MOV   AX   ,CBreaker
                                   MOV   sec_CBreaker   ,AX
                                   MOV   AL  ,buttonpressed
                                   MOV   sec_buttonpressed ,AL
                                   MOV   AX ,breakersmothness
                                   MOV   sec_breakersmothness,AX
                                   MOV   AX  ,  negativebs
                                   MOV   sec_negativebs ,AX
                                   MOV   AX  ,firstQ
                                   MOV   sec_firstQ    ,AX
                                   MOV   AX  ,thirdQ
                                   MOV   sec_thirdQ    ,AX

                                   RET
setBreaker2 ENDP








setBreaker3 PROC


                                                   cmp    determine_set_get_mode_4  , 1
                                   jz    sec_breaker_set_3


                                   MOV   AX   , third_lenght
                                   MOV   sec_lenght        ,AX
                                   MOV   AX ,third_Bidth
                                   MOV   sec_Bidth         ,AX
                                   MOV   AX  ,third_yorigin
                                   MOV   sec_yorigin       ,AX
                                   MOV   AX ,third_x
                                   MOV   sec_x             ,AX
                                   MOV   AX  ,third_y
                                   MOV   sec_y             ,AX
                                ;   MOV   AX ,third_defaultx
                                ;    MOV   sec_defaultx             ,AX
                                ;    MOV   AX  ,third_defaulty
                                ;    MOV   sec_defaulty             ,AX






                                   MOV   AL   ,third_breaker
                                   MOV   sec_breaker       ,AL
                                   MOV   AX  ,third_endx
                                   MOV   sec_endx          ,AX
                                   MOV   AX ,third_endy
                                   MOV   sec_endy          ,AX

                                ;    MOV   AX  ,third_defaultendx
                                ;    MOV   sec_defaultendx          ,AX
                                ;    MOV   AX ,third_defaultendy
                                ;    MOV   sec_defaultendy          ,AX




                                   MOV   AX   ,third_CBreaker
                                   MOV   sec_CBreaker      ,AX
                                   MOV   AL  ,third_buttonpressed
                                   MOV   sec_buttonpressed ,AL
                                   MOV   AX ,third_breakersmothness
                                   MOV   sec_breakersmothness,AX
                                   MOV   AX  ,third_negativebs
                                   MOV   sec_negativebs    ,AX
                                   MOV   AX  ,third_firstQ
                                   MOV   sec_firstQ        ,AX
                                   MOV   AX  ,third_thirdQ
                                   MOV   sec_thirdQ        ,AX

                                   RET



  sec_breaker_set_3: 

                                   MOV   AX   , sec_lenght
                                   MOV   third_lenght        ,AX
                                   MOV   AX ,sec_Bidth
                                   MOV   third_Bidth      ,AX
    
                                   MOV   AX  ,sec_yorigin
                                   MOV   third_yorigin     ,AX
                                   MOV   AX ,sec_x
                                   MOV   third_x          ,AX
                                   MOV   AX  ,sec_y
                                   MOV   third_y          ,AX

                            ;    MOV   AX , sec_defaultx            
                            ;       MOV  third_defaultx  ,AX

                            ;        MOV   AX  , sec_defaulty           
                            ;        MOV  third_defaulty   ,AX


                                   MOV   AL   ,sec_breaker
                                   MOV   third_breaker    ,AL
                                   MOV   AX  ,sec_endx
                                   MOV   third_endx     ,AX
                                   MOV   AX ,sec_endy
                                   MOV   third_endy      ,AX

                            ;    MOV   AX , sec_defaultendx            
                            ;       MOV  third_defaultendx  ,AX

                            ;        MOV   AX  , sec_defaultendy           
                            ;        MOV  third_defaultendy   ,AX




                                   MOV   AX   ,sec_CBreaker
                                   MOV   third_CBreaker   ,AX
                                   MOV   AL  ,sec_buttonpressed
                                   MOV   third_buttonpressed ,AL
                                   MOV   AX ,sec_breakersmothness
                                   MOV   third_breakersmothness,AX
                                   MOV   AX  ,  sec_negativebs
                                   MOV   third_negativebs ,AX
                                   MOV   AX  ,sec_firstQ
                                   MOV   third_firstQ    ,AX
                                   MOV   AX  ,sec_thirdQ
                                   MOV   third_thirdQ    ,AX

                                   RET




setBreaker3 ENDP













setBall1 PROC
                                   cmp   determineFlag , 1
                                   jz    sec_ball_set
    ; first Ball set

                                   MOV   AX  ,first_ball_Xc
                                   MOV   Xc , AX
                                   MOV   AX ,  first_ball_Yc
                                   MOV   Yc  , AX
                                   MOV   AX ,first_ball_S
                                   MOV   S       , AX
                                   MOV   AX ,first_ball_CBall
                                   MOV   CBall     , AX
                                   MOV   Al , first_ball_BackGroundColor
                                   MOV   BackGroundColor  , Al
                                   MOV   Al , first_ball_ballColor
                                   MOV   ballColor  , Al
                                   MOV   Al , first_ball_Flag
                                   MOV   Flag   , Al
                                   MOV   AX , first_ball_WindowWidth
                                   MOV   WindowWidth    , AX
                                   MOV   AX , first_ball_WindowHeight_start
                                   MOV   WindowHeight_start  , AX

                                   MOV   AX , first_ball_WindowHeight_end
                                   MOV   WindowHeight  , AX

                                   MOV   AX , first_ball_ShiftX
                                   MOV   ShiftX    , AX
                                   MOV   AX ,first_ball_ShiftY
                                   MOV   ShiftY , AX
                                   MOV   AX ,first_ball_DefaultShiftX
                                   MOV   DefaultShiftX    , AX

                                   MOV   AX ,first_ball_DefaultShiftY
                                   MOV   DefaultShiftY    , AX
                                   MOV   AX ,first_ball_ChangeShiftlow
                                   MOV   ChangeShiftlow  , AX
                                   MOV   AX ,first_ball_ChangeShiftHigh
                                   MOV   ChangeShiftHigh , AX
                                   MOV   AL ,   first_ball_flag_collision
                                   MOV   flagBallCollision, AL



                                   RET
    sec_ball_set:                  

                                   MOV   AX  ,sec_ball_Xc
                                   MOV   Xc , AX
                                   MOV   AX ,  sec_ball_Yc
                                   MOV   Yc  , AX
                                   MOV   AX ,sec_ball_S
                                   MOV   S       , AX
                                   MOV   AX ,sec_ball_CBall
                                   MOV   CBall     , AX
                                   MOV   Al , sec_ball_BackGroundColor
                                   MOV   BackGroundColor  , Al
                                   MOV   Al , sec_ball_ballColor
                                   MOV   ballColor  , Al
                                   MOV   Al , sec_ball_Flag
                                   MOV   Flag   , Al
                                   MOV   AX , sec_ball_WindowWidth
                                   MOV   WindowWidth    , AX
                                   MOV   AX , sec_ball_WindowHeight_start
                                   MOV   WindowHeight_start  , AX

                                   MOV   AX , sec_ball_WindowHeight_end
                                   MOV   WindowHeight  , AX

                                   MOV   AX , sec_ball_ShiftX
                                   MOV   ShiftX    , AX
                                   MOV   AX ,sec_ball_ShiftY
                                   MOV   ShiftY , AX
                                   MOV   AX ,sec_ball_DefaultShiftX
                                   MOV   DefaultShiftX    , AX

                                   MOV   AX ,sec_ball_DefaultShiftY
                                   MOV   DefaultShiftY    , AX

                                   MOV   AX ,sec_ball_ChangeShiftlow
                                   MOV   ChangeShiftlow  , AX
                                   MOV   AX ,sec_ball_ChangeShiftHigh
                                   MOV   ChangeShiftHigh , AX
                                   MOV   AL ,   sec_ball_flag_collision
                                   MOV   flagBallCollision, AL
                                   RET
setBall1 ENDP


setBall2 PROC
                                   cmp   determineFlag , 1
                                   jz    sec_ball_set2
    ; first Ball set
                                   MOV   AX  , Xc
                                   MOV   first_ball_Xc   , AX
                                   MOV   AX , Yc
                                   MOV   first_ball_Yc     , AX
                                   MOV   AX , S
                                   MOV   first_ball_S   , AX
                                   MOV   AX , CBall
                                   MOV   first_ball_CBall     , AX
                                   MOV   Al ,  BackGroundColor
                                   MOV   first_ball_BackGroundColor   , Al
                                   MOV   Al , ballColor
                                   MOV   first_ball_ballColor      , Al
                                   MOV   Al , Flag
                                   MOV   first_ball_Flag    , Al
                                   MOV   AX , WindowWidth
                                   MOV   first_ball_WindowWidth  , AX
                                   MOV   AX , WindowHeight_start
                                   MOV   first_ball_WindowHeight_start   , AX

                                   MOV   AX , WindowHeight
                                   MOV   first_ball_WindowHeight_end    , AX

                                   MOV   AX , ShiftX
                                   MOV   first_ball_ShiftX   , AX
                                   MOV   AX , ShiftY
                                   MOV   first_ball_ShiftY , AX
                                   MOV   AX , DefaultShiftX
                                   MOV   first_ball_DefaultShiftX   , AX
                                   MOV   AX , DefaultShiftY
                                   MOV   first_ball_DefaultShiftY   , AX
                                   MOV   AX , ChangeShiftlow
                                   MOV   first_ball_ChangeShiftlow  , AX
                                   MOV   AX , ChangeShiftHigh
                                   MOV   first_ball_ChangeShiftHigh  , AX
                                   MOV   AL ,   flagBallCollision
                                   MOV   first_ball_flag_collision  , AL

                                   RET
    sec_ball_set2:                 
                                   MOV   AX  , Xc
                                   MOV   sec_ball_Xc   , AX
                                   MOV   AX , Yc
                                   MOV   sec_ball_Yc     , AX
                                   MOV   AX , S
                                   MOV   sec_ball_S   , AX
                                   MOV   AX , CBall
                                   MOV   sec_ball_CBall     , AX
                                   MOV   Al ,  BackGroundColor
                                   MOV   sec_ball_BackGroundColor   , Al
                                   MOV   Al , ballColor
                                   MOV   sec_ball_ballColor      , Al
                                   MOV   Al , Flag
                                   MOV   sec_ball_Flag    , Al
                                   MOV   AX , WindowWidth
                                   MOV   sec_ball_WindowWidth  , AX
                                   MOV   AX , WindowHeight_start
                                   MOV   sec_ball_WindowHeight_start   , AX

                                   MOV   AX , WindowHeight
                                   MOV   sec_ball_WindowHeight_end    , AX

                                   MOV   AX , ShiftX
                                   MOV   sec_ball_ShiftX   , AX
                                   MOV   AX , ShiftY
                                   MOV   sec_ball_ShiftY , AX
                                   MOV   AX , DefaultShiftX
                                   MOV   sec_ball_DefaultShiftX   , AX

                                   MOV   AX , DefaultShiftY
                                   MOV   sec_ball_DefaultShiftY   , AX

                                   MOV   AX , ChangeShiftlow
                                   MOV   sec_ball_ChangeShiftlow  , AX
                                   MOV   AX , ChangeShiftHigh
                                   MOV   sec_ball_ChangeShiftHigh  , AX
                                   MOV   AL ,   flagBallCollision
                                   MOV   sec_ball_flag_collision  , AL

                                   RET
setBall2 ENDP






DrawPixel PROC
                                   mov   cx,AX                                   ;Column
                                   mov   dx,BX                                   ;Row

                                   CMP   Flag , 1
                                   JZ    ClearBall

    ; Colour my Pixel
                                   mov   al , ballColor                          ;Pixel color
                                   JMP   Next

    ClearBall:                     
                                   MOV   al , BackGroundColor                    ;Pixel color become (black) like my background color
    Next:                          
                                   mov   ah , 0ch                                ;Draw Pixel Command
                                   INT   10h
                                   RET
DrawPixel ENDP

GetTime PROC
    ; CH = hour (0-23) CL = minutes (0-59) DH = seconds (0-59) DL = hundredths (0-99)
                                   MOV   AH , 2Ch
                                   int   21h
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

                                   MOV   Flag , 1
                                   CALL  DrawBall
    ; CALL draw_breaker
    ; CALL draw_breaker2_single
                                   mov   determine_breaker_Flag ,0
                                   CALL  setBreaker1
                                   call  draw_breaker
                                   CALL  setBreaker2
                                   CMP   mode ,1
                                   JLE   singl_mode_2
                                   mov   determine_breaker_Flag ,1
                                   CALL  setBreaker1
                                   call  draw_breaker
                                   CALL  setBreaker2
    singl_mode_2:                  

                                   MOV   AX , ShiftX
                                   ADD   Xc , AX

                                   MOV   AX , WindowWidth
                                   SUB   AX , 1
                                   SUB   AX , S

                                   CMP   Xc , AX
                                   JG    NegX

                                   CMP   Xc , 0
                                   JL    NegX

                                   JMP   ToY

    NegX:                          
                                   NEG   ShiftX
                                   MOV   AX , ShiftX
                                   ADD   Xc , AX
    ;    JMP ToDraw

    ToY:                           

                                   MOV   AX , ShiftY
                                   ADD   Yc , AX

    ;check collison With First Breaker
    ; if(
    ; Xc <    x + lenght &&
    ; Xc + S >    x &&
    ; Yc < y + Bidth &&
    ; Yc + S > y
    
    ; )
                                   mov   determine_breaker_Flag ,0
                                   CALL  setBreaker1
    ;                                MOV   AX , WindowHeight_start
    ;                                CMP   Yc , AX
    ;                                JL    rel_jmp_down_collision_2
    ;                                JMP   cont_down_2
    ; rel_jmp_down_collision_2:
    ;                                JMP   ToY
    cont_down_2:                   
                                   MOV   AX , x
                                   ADD   AX , lenght
                                   CMP   Xc , AX
                                   Jb    cont55
                                   jmp   check_second_breaker_collision
    cont55:                        
                     
                                   MOV   AX ,Xc
                                   ADD   AX , S
                                   CMP   AX , x
                                   JG    ch1
                                   jmp   check_second_breaker_collision
    ch1:                           

                                   MOV   AX , y
                                   ADD   AX , Bidth
                                   CMP   Yc ,AX
                                   Jb    ch2
                                   jmp   check_second_breaker_collision
    ch2:                           
                                   MOV   AX ,Yc
                                   ADD   AX , S
                                   CMP   AX , y
                                   JGe    ch3
                                   jmp   check_second_breaker_collision
    ch3:                           

    ;first_Breaker_Collison exists

                                   mov   determine_breaker_Flag ,0
                                   CALL  setBreaker1
                                   pusha
                                   call  CenterBreaker
                                   popa
                                   CALL  setBreaker2
                                   mov   ax, ShiftX
                                   cmp   ax,0
                                   ja    firstquarter
    ;  NEG  ChangeShiftlow
    ;  NEG  ChangeShiftHigh
    
    firstquarter:                  
                                    cmp mode , 4 
                                    jz rel_neutral1

                                   mov   ax,Shiftx                               ;here i increment by 3 as top decrease the slope of the ball
                                   cmp   ax,x_limit
                                   Jl    cont1_firstq
                                   
                                    rel_neutral1 :
                                   jmp   neutralizeshift
    cont1_firstq:                  
                                   mov   bx,x_limit
                                   neg   bx
                                   cmp   ax,bx
                                   jg    cont2_firstq
    
                                   jmp   neutralizeshift
    cont2_firstq:                  
                                   mov   ax,Xc
                                   cmp   ax,firstQ
                                   ja    secQ
                                   MOV   AX,ShiftX
                                   cmp   ax,0
                                   jb    fristq_cont
                                   
                                   add   ax,ChangeShiftHigh
                    
                                   jmp   fristq_cont2
    fristq_cont:                   
                    
                                   sub   ax,ChangeShiftHigh
    fristq_cont2:                  
                                   mov   ShiftX,ax
 
                                   JMP   neutralizeshift
    secQ:                                                                        ;its close to the center so i inc by 1 only
                                   mov   ax,Xc
                                   cmp   ax,CBreaker
                                   ja    thirdQuarter
                                   mov   ax,ShiftX
                                   add   ax,ChangeShiftlow
                    
                                   mov   ShiftX,ax

                                   JMP   neutralizeshift
    thirdQuarter:                                                                ;third same as sec
                                   mov   ax,Xc
                                   cmp   ax, thirdQ
                                   ja    lastq
                                   mov   ax,ShiftX
                                   add   ax,ChangeShiftlow
                    
                                   mov   ShiftX,ax

                                   JMP   neutralizeshift
    lastq:                                                                       ;last part of the breaker same as the first
                                   MOV   AX,ShiftX
                                   cmp   ax,0
                                   ja    lastq_cont
                                   add   ax,ChangeShiftHigh
    ;NEG ax
                                   mov   ShiftX,ax
                                   jmp   neutralizeshift
    lastq_cont:                    
                                   sub   ax,ChangeShiftHigh
                                   mov   ShiftX,ax
                                ;    cmp mode , 4 
                                ;    jne neutralizeshift
                                   NEG   ShiftX
    neutralizeshift:               
                                   mov   determine_breaker_Flag ,0
                                   CALL  setBreaker1
                                   pusha
                                   call  draw_breaker
                                   popa
                                   CALL  setBreaker2
                                   cmp   ShiftX,0
                                   JMP   NegY
                     
    ; Yc=Yc-(Yc+S-y))
    ; Yc = y-S
    ;  MOV  AX , y
    ;  SUB  AX , S
                     
                     
    ;  MOV  Yc , AX
                
                    




  
    check_second_breaker_collision:

                                   CMP   mode ,1
                                   JLE   rel_jmp_mode
                                   JMP   rel_jmp_mode2
    rel_jmp_mode:                  
                                   JMP   singl_mode_3
    rel_jmp_mode2:                 
    ;check collison With Breaker
    ; if(
    ; Xc <    x + lenght &&
    ; Xc + S >    x &&
    ; Yc < y + Bidth &&
    ; Yc + S > y
    ; )
                                   mov   determine_breaker_Flag ,1
                                   CALL  setBreaker1
                                   MOV   AX , x
                                   ADD   AX , lenght
                                   CMP   Xc , AX
                                   Jb    cont55_2
                                   jmp   NotCollision
    cont55_2:                      
                     
                                   MOV   AX ,Xc
                                   ADD   AX , S
                                   CMP   AX , x
                                   JG    ch1_2
                                   jmp   NotCollision
    ch1_2:                         

                                   MOV   AX ,y
                                   ADD   AX , Bidth
                                   CMP   Yc ,AX
                                   Jb    ch2_2
                                   jmp   NotCollision
    ch2_2:                         
                                   MOV   AX ,Yc
                                   ADD   AX , S
                                   CMP   AX ,y
                                   JGe    ch3_2
                                   jmp   NotCollision
    ch3_2:                         

    ; sec_breac_X
    ; sec_breac_Y
    ; sec_breac_endx
    ; sec_breac_endy
    ; sec_breac_len
    ; sec_breac_width
    ; sec_breac_yOrg
    ; sec_breaker_color



    ;second_Breaker_Collison exists
                                   mov   determine_breaker_Flag ,1
                                   CALL  setBreaker1
                                   pusha
                                   call  CenterBreaker
                                   popa
                                   CALL  setBreaker2
                                   mov   ax, ShiftX
                                   cmp   ax,0
                                   ja    firstquarter_2
    ;  NEG  ChangeShiftlow
    ;  NEG  ChangeShiftHigh
firstquarter_2:                                                        
                                    cmp mode , 4
                                    jz rel_neutral2                                           ;here i increment by 3 as top decrease the slope of the ball
                                   mov   ax,Shiftx                               ;here i increment by 3 as top decrease the slope of the ball
                                   cmp   ax,x_limit
                                   
                                   Jl    cont1_firstq2
                                    rel_neutral2:
                                   jmp   neutralizeshift_2
    cont1_firstq2:                 
                                   mov   bx,x_limit
                                   neg   bx
                                   cmp   ax,bx
                                   jg    cont2_firstq2
    
                                   jmp   neutralizeshift_2
    cont2_firstq2:                 
                                   mov   ax,Xc
                                   cmp   ax,firstQ
                                   ja    secQ_2
                                   MOV   AX,ShiftX
                                   cmp   ax,0
                                   jb    fristq_cont_2
                                   add   ax,ChangeShiftHigh
                    
                                   jmp   fristq_cont2_2
    fristq_cont_2:                 
                    
                                   sub   ax,ChangeShiftHigh
    fristq_cont2_2:                
                                   mov   ShiftX,ax
 
                                   JMP   neutralizeshift_2
    secQ_2:                                                                      ;its close to the center so i inc by 1 only
                                   mov   ax,Xc
                                   cmp   ax,CBreaker
                                   ja    thirdQuarter_2
                                   mov   ax,ShiftX
                                   add   ax,ChangeShiftlow
                    
                                   mov   ShiftX,ax

                                   JMP   neutralizeshift_2
    thirdQuarter_2:                                                              ;third same as sec
                                   mov   ax,Xc
                                   cmp   ax, thirdQ
                                   ja    lastq_2
                                   mov   ax,ShiftX
                                   add   ax,ChangeShiftlow
                    
                                   mov   ShiftX,ax

                                   JMP   neutralizeshift_2
    lastq_2:                                                                     ;last part of the breaker same as the first
                                   MOV   AX,ShiftX
                                   cmp   ax,0
                                   ja    lastq_cont_2
                                   add   ax,ChangeShiftHigh
    ;NEG ax
                                   mov   ShiftX,ax
                                   jmp   neutralizeshift_2
    lastq_cont_2:                  
                                   sub   ax,ChangeShiftHigh
                                   mov   ShiftX,ax
                                     NEG   ShiftX
    neutralizeshift_2:             
                                   mov   determine_breaker_Flag ,1
                                   CALL  setBreaker1
                                   pusha
                                   call  draw_breaker
                                   popa
                                   CALL  setBreaker2
                                   cmp   ShiftX,0
                                   JMP   NegY






    singl_mode_3:                  
    NotCollision:                  
                                   cmp   determineFlag,1
                                   jz    sec_ball_collision
                                   MOV   AX , WindowHeight
                                   SUB   AX , 1
                                   SUB   AX , S

                                   CMP   Yc , AX

                                   JG    ResetPosition
    ;  JG   NegY
                                   MOV   AX , WindowHeight_start
                                   CMP   Yc , AX

                                   JL    NegY

                                   JMP   ToDraw

    sec_ball_collision:            


                                   MOV   AX , WindowHeight
                                   SUB   AX , 1
                                   SUB   AX , S

                                   CMP   Yc , AX

                                   JG    NegY
    ;  JG   NegY
                                   MOV   AX , WindowHeight_start
                                   CMP   Yc , AX

                                   JL    ResetPosition



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


                                   JMP   ToDraw

    NegY:                          


                                   NEG   ShiftY
                                   MOV   AX , ShiftY
                                   ADD   Yc , AX
                                   mov   determine_breaker_Flag ,0
                                   CALL  setBreaker1
                                   call  draw_breaker
                                   CALL  setBreaker2
    ; CALL draw_breaker
    ; CALL draw_breaker2_single
                                   CMP   mode ,1
                                   JLE   singl_mode_4
                                   mov   determine_breaker_Flag ,1
                                   CALL  setBreaker1
                                   call  draw_breaker
                                   CALL  setBreaker2
    singl_mode_4:                  

                                   JMP   ToDraw
    ResetPosition:                 
    ;  MOV  AX , DefaultShiftX
    ;  MOV  ShiftX , AX
    ;  MOV  AX , DefaultShiftY
    ;  MOV  ShiftY , AX
                                  MOV begin_game ,1 
                                   CALL  RestartBall
                                 



    ToDraw:                        

                                   MOV   Flag , 0


                                   CALL  DrawBall

                     
    ;================================================================
          






    ;JMP  CheckTime
    ;  MOV  AX , DefaultShiftX
    ;  MOV  ShiftX , AX
                                   RET
MovBall ENDP

draw_curser proc
                                   mov   cx,curX
                                   mov   dx,curY
                                   add   dx,WedCur
                                   add   cx,lenCur
                                   mov   endCurx,cx
                                   mov   endCurY,dx
                                   sub   cx,lenCur
                                   sub   dx,WedCur
    d_cur1:                                                                      ;[]
    ;call draw_line_H

                                   mov   al,curs_color                           ;Pixel color
                                   mov   ah,0ch
                  
    d_cur2:                        
                                   int   10h
                                   inc   cx
                                   cmp   cx,endCurx
                                   jnz   d_cur2
                                   inc   dx
                                   mov   cx,curX
                                   cmp   dx,endCurY
                                   jnz   d_cur1

                                   ret
draw_curser endp
draw_menu proc
                                   call  draw_curser
                                   call  Draw_p


                                   ret
draw_menu endp
Draw_p PROC

                                   mov   cx,125
                                   mov   dx,50
    d_p1:                          
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    d_p2:                                                                        ;|
       
                                   int   10h
                                   inc   dx
                                   cmp   dx,70
                                   jnz   d_p2
                                   inc   cx
                                   mov   dx,50
                                   cmp   cx,130
                                   jnz   d_p1
                     
                                   mov   cx,130
                                   mov   dx,50

    ;
    d_p3:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_p4:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,140
                                   jnz   d_p4
                                   inc   dx
                                   mov   cx,130
                                   cmp   dx,60
                                   jnz   d_p3

                                   mov   l,30

                                   mov   cx,127
                                   mov   dx ,52

    d_p5:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_p6:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,138
                                   jnz   d_p6
                                   inc   dx
                                   mov   cx,127
                                   cmp   dx,58
                                   jnz   d_p5

    ;ret
Draw_p endp

Draw_l proc
                                   mov   cx,145
                                   mov   dx,50
    d_l1:                          
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    d_l2:                                                                        ;|
       
                                   int   10h
                                   inc   dx
                                   cmp   dx,70
                                   jnz   d_l2
                                   inc   cx
                                   mov   dx,50
                                   cmp   cx,150
                                   jnz   d_l1
                     
                                   mov   cx,145
                                   mov   dx,66
    d_l3:                          
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    d_l4:                                                                        ;_
       
                                   int   10h
                                   inc   cx
                                   cmp   cx,157
                                   jnz   d_l4
                                   inc   dx
                                   mov   cx,145
                                   cmp   dx,70
                                   jnz   d_l3
    ;ret
Draw_l endp
Draw_a proc
                                   mov   cx,160d
                                   mov   dx,54d

    d_a1:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_a2:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,175
                                   jnz   d_a2
                                   inc   dx
                                   mov   cx,160
                                   cmp   dx,70
                                   jnz   d_a1

                                   mov   cx,164
                                   mov   dx,63

    d_a3:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_a4:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,172
                                   jnz   d_a3
                                   inc   dx
                                   mov   cx,164
                                   cmp   dx,67
                                   jnz   d_a4

                                   mov   cx,160
                                   mov   dx,58

    d_a5:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,00h                                  ;Pixel color
                                   mov   ah,0ch
                  
    d_a6:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,172
                                   jnz   d_a5
                                   inc   dx
                                   mov   cx,160
                                   cmp   dx,60
                                   jnz   d_a6

    ;ret
Draw_a endp

Draw_y proc
                                   mov   cx,180
                                   mov   dx,50
    d_y1:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_y2:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,193
                                   jnz   d_y2
                                   inc   dx
                                   mov   cx,180
                                   cmp   dx,60
                                   jnz   d_y1

                                   mov   cx,182
                                   mov   dx,50
    d_y3:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_y4:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,191
                                   jnz   d_y3
                                   inc   dx
                                   mov   cx,182
                                   cmp   dx,57
                                   jnz   d_y4

                                   mov   cx,191
                                   mov   dx,50
    d_y5:                          
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    d_y6:                                                                        ;|
       
                                   int   10h
                                   inc   dx
                                   cmp   dx,70
                                   jnz   d_y6
                                   inc   cx
                                   mov   dx,50
                                   cmp   cx,193
                                   jnz   d_y5

                                   mov   cx,184
                                   mov   dx,67
    d_y7:                          
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    d_y8:                                                                        ;_
       
                                   int   10h
                                   inc   cx
                                   cmp   cx,193
                                   jnz   d_y8
                                   inc   dx
                                   mov   cx,184
                                   cmp   dx,70
                                   jnz   d_y7

    ;ret
Draw_y endp

Draw_s proc
                                   mov   cx,110
                                   mov   dx,80

    d_s1:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_s2:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,125
                                   jnz   d_s2
                                   inc   dx
                                   mov   cx,110
                                   cmp   dx,100
                                   jnz   d_s1

                                   mov   cx,114
                                   mov   dx,82
    d_s3:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_s4:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,125
                                   jnz   d_s4
                                   inc   dx
                                   mov   cx,114
                                   cmp   dx,87
                                   jnz   d_s3


                                   mov   cx,110
                                   mov   dx,92
    d_s5:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_s6:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,121
                                   jnz   d_s6
                                   inc   dx
                                   mov   cx,110
                                   cmp   dx,97
                                   jnz   d_s5

    ;ret
Draw_s endp
Draw_c proc
                                   mov   cx,130
                                   mov   dx,84
    d_c1:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_c2:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,145
                                   jnz   d_c2
                                   inc   dx
                                   mov   cx,130
                                   cmp   dx,100
                                   jnz   d_c1
                                   mov   cx,133
                                   mov   dx,87

    d_c3:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_c4:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,145
                                   jnz   d_c4
                                   inc   dx
                                   mov   cx,133
                                   cmp   dx,97
                                   jnz   d_c3
    ;ret
Draw_c endp

Draw_o proc
                                   mov   cx,150
                                   mov   dx,84
    d_o1:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_o2:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,165
                                   jnz   d_o2
                                   inc   dx
                                   mov   cx,150
                                   cmp   dx,100
                                   jnz   d_o1
                                   mov   cx,153
                                   mov   dx,87

    d_o3:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_o4:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,162
                                   jnz   d_o4
                                   inc   dx
                                   mov   cx,153
                                   cmp   dx,97
                                   jnz   d_o3
    ;ret
Draw_o endp


Draw_r proc
                                   mov   cx,170d
                                   mov   dx,84d
    d_r1:                          
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    d_r2:                                                                        ;|
       
                                   int   10h
                                   inc   dx
                                   cmp   dx,100
                                   jnz   d_r2
                                   inc   cx
                                   mov   dx,84
                                   cmp   cx,174
                                   jnz   d_r1
                                   mov   cx,170d
                                   mov   dx,88d

    d_r3:                          
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    d_r4:                                                                        ;_
       
                                   int   10h
                                   inc   cx
                                   cmp   cx,181
                                   jnz   d_r4
                                   inc   dx
                                   mov   cx,170
                                   cmp   dx,92
                                   jnz   d_r3
    ;ret
Draw_r endp
Draw_e proc
                                   mov   cx,187
                                   mov   dx,84
    d_e1:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_e2:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,203
                                   jnz   d_e2
                                   inc   dx
                                   mov   cx,187
                                   cmp   dx,100
                                   jnz   d_e1
                                   mov   cx,190d
                                   mov   dx,87

    d_e3:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_e4:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,199
                                   jnz   d_e4
                                   inc   dx
                                   mov   cx,190
                                   cmp   dx,92
                                   jnz   d_e3

                                   mov   cx,190d
                                   mov   dx,94d

                     
    d_e5:                                                                        ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_e6:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,203
                                   jnz   d_e6
                                   inc   dx
                                   mov   cx,190
                                   cmp   dx,98
                                   jnz   d_e5
    ;ret
Draw_e endp
Draw_c2 proc
                                   mov   cx,130d
                                   mov   dx,110d
                   
    d_c21:                                                                       ;[]
    ;call draw_line_H

                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_c22:                         
                                   int   10h
                                   inc   cx
                                   cmp   cx,150
                                   jnz   d_c22
                                   inc   dx
                                   mov   cx,130
                                   cmp   dx,130
                                   jnz   d_c21

                                   mov   cx,133
                                   mov   dx,113

    d_c23:                                                                       ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_c24:                         
                                   int   10h
                                   inc   cx
                                   cmp   cx,150
                                   jnz   d_c24
                                   inc   dx
                                   mov   cx,133
                                   cmp   dx,127
                                   jnz   d_c23
    ;ret
Draw_c2 endp

Draw_h proc
                                   mov   cx,155d
                                   mov   dx,110d


    d_h1:                          
                                   mov   al, 5                                   ;Pixel color
                                   mov   ah,0ch
                     
    d_h2:                                                                        ;|
       
                                   int   10h
                                   inc   dx
                                   cmp   dx,130
                                   jnz   d_h2
                                   inc   cx
                                   mov   dx,110
                                   cmp   cx,160
                                   jnz   d_h1
                    
                                   mov   cx,155d
                                   mov   dx,118
    d_h3:                          
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    d_h4:                                                                        ;_
       
                                   int   10h
                                   inc   cx
                                   cmp   cx,170
                                   jnz   d_h4
                                   inc   dx
                                   mov   cx,155
                                   cmp   dx,123
                                   jnz   d_h3
                                   mov   cx,165d
                                   mov   dx,118d
    d_h5:                          
                                   mov   al, 5                                   ;Pixel color
                                   mov   ah,0ch
                     
    d_h6:                                                                        ;|
       
                                   int   10h
                                   inc   dx
                                   cmp   dx,130
                                   jnz   d_h6
                                   inc   cx
                                   mov   dx,118
                                   cmp   cx,170
                                   jnz   d_h5

    ;ret
Draw_h endp
Draw_a2 proc
                                   mov   cx,175d
                                   mov   dx,115d

    d_a21:                                                                       ;[]
    ;call draw_line_H

                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_a22:                         
                                   int   10h
                                   inc   cx
                                   cmp   cx,190
                                   jnz   d_a22
                                   inc   dx
                                   mov   cx,175
                                   cmp   dx,130
                                   jnz   d_a21

                                   mov   cx,179
                                   mov   dx,123

    d_a23:                                                                       ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_a24:                         
                                   int   10h
                                   inc   cx
                                   cmp   cx,187
                                   jnz   d_a23
                                   inc   dx
                                   mov   cx,179
                                   cmp   dx,127
                                   jnz   d_a24

                                   mov   cx,175
                                   mov   dx,117

    d_a25:                                                                       ;[]
    ;call draw_line_H

                                   mov   al,0                                    ;Pixel color
                                   mov   ah,0ch
                  
    d_a26:                         
                                   int   10h
                                   inc   cx
                                   cmp   cx,187
                                   jnz   d_a25
                                   inc   dx
                                   mov   cx,175
                                   cmp   dx,120
                                   jnz   d_a26

    ;ret
Draw_a2 endp
Draw_t proc
                                   mov   cx,200d
                                   mov   dx,110d

    d_t1:                          
                                   mov   al, 5                                   ;Pixel color
                                   mov   ah,0ch
                     
    d_t2:                                                                        ;|
       
                                   int   10h
                                   inc   dx
                                   cmp   dx,130
                                   jnz   d_t2
                                   inc   cx
                                   mov   dx,110
                                   cmp   cx,204
                                   jnz   d_t1

                                   mov   cx,195d
                                   mov   dx,114
    d_t3:                          
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    d_t4:                                                                        ;_
       
                                   int   10h
                                   inc   cx
                                   cmp   cx,210
                                   jnz   d_t4
                                   inc   dx
                                   mov   cx,195
                                   cmp   dx,117
                                   jnz   d_t3
                                   ret
Draw_t endp

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

send_data proc


 
    ;========================
                                   mov   dx , 3FDH                               ; Line Status Register
                                   In    al , dx                                 ;Read Line Status
                                   AND   al , 00100000b

    trans_data:                    
    ;Set port configuration
                                   mov   dx,3fbh
                                   mov   al,00011011b
                                   out   dx,al

                                   mov   dx , 3F8H                               ; Transmit data register
                                   mov   al,value
                                   out   dx , al
    end_send:                      
                                   ret
send_data endp

recive_data proc
    ;Set port configuration
                                   mov   dx,3fbh
                                   mov   al,00011011b
                                   out   dx,al

    ;Check that Data Ready from UART
    CHK:                           mov   dx , 3FDH                               ; Line Status Register
                                   in    al , dx
                                   AND   al , 1
            
                                   Jnz   recive_data_cont                        ; if there is not char in uart go check for key pressed
                                   jmp   recive_data_cont2
    recive_data_cont:              

 
    ;If Ready read the VALUE in Receive data register
                                   mov   dx , 03F8H
                                   in    al , dx
                                   mov   value , al
    ; add value to sec_curser_X
                                   pusha
    ; clear breaker then re-draw
            
    ; mov sec_breaker_color,0
    ; ; call draw_breaker2

                                   mov   determine_breaker_Flag ,1
                                   CALL  setBreaker1
                                   MOV   al ,value
                                   CBW
                                   MOV   dx ,AX



                                   mov   ax ,endx
                                   add   ax,dx
                                   mov   endx,ax
                                   cmp   ax,320
                                   ja    rightbound_1
                                   cmp   ax,lenght
                                   ja    inbound_1
                                   mov   ax,lenght
                                   mov   x,0
                                   mov   endx,ax
                   
                                   jmp   cont3_1
    rightbound_1:                  
                                   mov   ax,lenght
                                   mov   bx,320
                                   sub   bx,ax
                                   mov   endx,320
    inbound_1:                     
                                   mov   ax,endx
                                   mov   bx,lenght
                                   sub   ax,bx
                                   mov   x,ax
           
               
    cont3_1:                       
    
                                   cmp   value,0
                                   jG    drawR_1
                                   call  draw_breakerL
                                   CALL  setBreaker2
                                   popa
                                   ret
    drawR_1:                       
                                   call  draw_breakerR
                                   CALL  setBreaker2
                                   popa
                                   ret




    ;                                mov   determine_breaker_Flag ,1
    ;                                CALL  setBall1
    ;                                MOV   al ,value
    ;                                CBW
    ;                                CMP   AX , 0
    ;                                JB    negative

    ;                                MOV   breakersmothness , AX
    ;                                CALL  draw_breakerR
    ;                                CALL  setBreaker2
                                  
    ;                                ret
    ; negative:
    ;                                MOV   negativebs ,AX
    ;                                CALL  draw_breakerL
    ;                                CALL  setBreaker2
    ;                                popa
    ;                                ret
    ; mov sec_breaker_color,5
    ;=========================
    ; mov cx,sec_x
    ; mov bl,value
    ; and bl,128
    ; jnz negative
    ; mov dh,0
    ; jmp cont_rec1
    ; negative:
    ; mov dh,0ffh
    ; cont_rec1:
    ; mov dl,value
    ; add cx,dx
    ; mov sec_x,cx
    ; add cx,sec_lenght
    ; mov sec_endx,cx
         

    ; call draw_breaker2
    recive_data_cont2:             

                                   ret
recive_data ENDP

DrawBall PROC

                                   MOV   CX ,0
    OuterLoop:                     

                                   MOV   DX ,0
    InnerLoop:                     
                                   MOV   AX , Xc
                                   MOV   BX , Yc
                                   ADD   AX , CX
                                   ADD   BX , DX
                                   push  CX
                                   PUSH  DX
                                   CALL  DrawPixel
                                   pop   DX
                                   POP   CX

                                   inc   DX
                                   CMP   DX , S
                                   JNZ   InnerLoop

                                   inc   cx
                                   CMP   CX , S
                                   JNZ   OuterLoop


                                   RET
DrawBall ENDP


RestartBall PROC
    ;    MOV   AX , WindowWidth
    ;    MOV   BX , 2
    ;    MOV   DX , 0
    ;    DIV   BX

    ;    MOV   Xc , AX

    ;    MOV   AX , WindowHeight
    ;    MOV   BX , 2
    ;    MOV   DX , 0
    ;    DIV   BX

    ;    MOV   Yc , AX



                                    cmp mode ,4 
                                    jne mode_4_not

                                   MOV   AX , WindowWidth
                                   MOV   BX , 2
                                   MOV   DX , 0
                                   DIV   BX

                                   MOV   Xc , AX

                                ;    MOV   AX , WindowHeight
                                ;    MOV   BX , 2
                                ;    MOV   DX , 0
                                ;    DIV   BX

                                   MOV   Yc , 150
                                  cmp begin_game , 0
                                    jz begGame
                                   DEC   first_heart
                                   CMP   first_heart,0
                                   jz  gameover_mode4
                                    ret
                                   gameover_mode4:
                                   jmp    game_over
                                ;    MOV   ShiftX , 0

                                ret
mode_4_not:




                                ;    MOV   ShiftX , 1
                                ;    MOV   AX , DefaultShiftY
                                ;    MOV   ShiftY , AX
                                   cmp   determineFlag , 1
                                   
                                   jz    sec_ball_dec_hearts
                                     MOV determine_breaker_Flag,0
                                     CALL  setBreaker1
                                     call CenterBreaker
                                     CALL  setBreaker2
                                    MOV  AX , CBreaker
                                    MOV  Xc,AX
                                    MOV  AX , y
                                    SUB AX ,10 
                                    MOV Yc , AX
                                    cmp begin_game , 0
                                    jz begGame
                                   DEC   first_heart
                                   CMP   first_heart,0
                                   JZ    game_over
                                   begGame:
                                   cmp mode , 1
                                  JLE  wait_space
                                   RET
                                   wait_space:
                                    MOV   Flag , 0
                                   CALL DrawBall
                                  rewait_space:
                                   mov   ah,0
                                   int   16h
                                   cmp ah , 39H
                                   JNZ rewait_space
                                   RET
    sec_ball_dec_hearts:        
                                  MOV determine_breaker_Flag,1
                                     CALL  setBreaker1
                                     call CenterBreaker
                                     CALL  setBreaker2
                                    MOV  AX , CBreaker
                                    MOV  Xc,AX
                                    MOV  AX , y
                                    ADD AX ,10 
                                    MOV Yc , AX
                                    cmp begin_game , 0
                                    jz begGame2
                                   DEC   sec_heart
                                   CMP   sec_heart,0
                                   JZ    game_over
                                                                      begGame2:
                                   RET
    game_over:                     
    jmp   endgame

RestartBall ENDP


CenterBall PROC

                                   MOV   AX , S
                                   MOV   BX , 2
                                   MOV   DX , 0
                                   DIV   BX

                                   MOV   BX , Xc
                                   ADD   BX , AX
                                   MOV   CBall , BX
                                   RET
CenterBall ENDP



    ; CenterBreaker_second PROC

    ;                      MOV  AX , sec_lenght
    ;                      MOV  BX , 2
    ;                      MOV  DX , 0
    ;                      DIV  BX

    ;                      MOV  BX , sec_x
    ;                      ADD  BX , AX
    ;                      MOV  sec_breaker_center , BX
    ;                      mov  ax, sec_lenght
    ;                      mov  bx,2
    ;                      shr  ax,2
                     
    ;                      mov  bx ,sec_x
    ;                      add  bx,AX
    ;                      mov  firstQ,bx
    ;                      add  bx,ax
    ;                      add  bx,ax
    ;                      mov  thirdQ,bx

    ;                      RET
    ; CenterBreaker_second ENDP


CenterBreaker PROC

                                   MOV   AX , lenght
                                   MOV   BX , 2
                                   MOV   DX , 0
                                   DIV   BX

                                   MOV   BX , x
                                   ADD   BX , AX
                                   MOV   CBreaker , BX
                                   mov   ax, lenght
                                   mov   bx,2
                                   shr   ax,2
                     
                                   mov   bx ,x
                                   add   bx,AX
                                   mov   firstQ,bx
                                   add   bx,ax
                                   add   bx,ax
                                   mov   thirdQ,bx

                                   RET
CenterBreaker ENDP

draw_line_v proc
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                     
    l1:                            
                                   int   10h
                                   inc   dx
                                   cmp   dx,200
                                   jnz   l1
                                   ret
draw_line_v endp

draw_line_H proc
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch
                                   mov   bx,dx
                                   add   bx,l
    l12:                           
                                   int   10h
                                   inc   cx
                                   cmp   cx,320
                                   jnz   l12
                                   ret
draw_line_H endp

Chat proc





  ;Set port configuration
                                   mov   dx,3fbh
                                   mov   al,00011011b
                                   out   dx,al

    ;===================
    AGAIN_to_start_chatt:                                                              ;Check that Transmitter Holding Register is Empty
                                   mov   dx , 3FDH                               ; Line Status Register
                                   In    al , dx                                 ;Read Line Status
                                   AND   al , 00100000b
                                   Jz    AGAIN_to_start_chatt
                  
    ;If empty put the VALUE in Transmit data ;register
                                   mov   dx , 3F8H                               ; Transmit data register
                                   mov   al,11
                                   out   dx , al
    ;=======================================================================
    pusha
                                    mov   bh,0
                                   mov   ah,0
                                   mov   al,3
                                   int   10h
                                  mov   ah,2
                                   mov   dh,11
                                   mov   dl,25
                                   int   10h
                                    mov   ah, 9
                                   mov   dx, offset message_online
                                   int   21h


popa
   
    CHK_to_start_chatt:          
                                    mov ah , 1
                                    int 16h
                                    jz cont_online_chatt
                                    cmp ah , 01h
                                    jne cont_online_chatt

                                    ;transmit  that I leave




   AGAIN_to_start_esc_chatt:                                                              ;Check that Transmitter Holding Register is Empty
                                   mov   dx , 3FDH                               ; Line Status Register
                                   In    al , dx                                 ;Read Line Status
                                   AND   al , 00100000b
                                   Jz    AGAIN_to_start_esc_chatt
                  
    ;If empty put the VALUE in Transmit data ;register
                                   mov   dx , 3F8H                               ; Transmit data register
                                   mov   al,9
                                   out   dx , al








                                    jmp Menu
                                    cont_online_chatt:
                                    mov   dx , 3FDH                               ; Line Status Register
                                   in    al , dx
                                   AND   al , 1
                                   JZ    CHK_to_start_chatt             ;whait for user 2 to connect
                                                         
                                    mov dx , 03F8H
                                        in al , dx 
                                    cmp al , 11  
                                    jnz  save_prev_mode_chatt
                                    jmp correct_mode_chatt
                                    save_prev_mode_chatt:
                                    jmp  Menu
                                    mov   prevmode , al 
                                   jmp    CHK_to_start_chatt                           ;to be same mode
correct_mode_chatt:
    ;===============================================================================



  correct_mode_chk_chatt:
























                                   mov   ax,0600h
                                   mov   bh,07
                                   mov   cx,0
                                   mov   dx,184FH
                                   int   10h

                                   mov   bh,0
                                   mov   ah,2
                                   mov   dx,0000h
                                   int   10h

                                   mov   ah, 09
                                   mov   dx, offset messsage
                                   int   21h

    ;Check that Data Ready from UART
    CHK_chat:                      mov   dx , 3FDH                               ; Line Status Register
                                   in    al , dx
                                   AND   al , 1
            
                                   JZ    CHKINCHAR                               ; if there is not char in uart go check for key pressed

    ;If Ready read the VALUE in Receive data register
                                   mov   dx , 03F8H
                                   in    al , dx
                                   mov   VALUE , al                              ;??????????????????????????????????????????????????

    ; mov ah, 09
    ;mov dx, offset value
    ; int 21h
    ;set curser
                                   mov   dh,recy
                                   mov   dl,recx
    ; move curser
                                   mov   bh,0
                                   mov   ah,2
                                   int   10h

    ;print byte
                                   mov   ah,9                                    ;Display
                                   mov   bh,0                                    ;Page 0
                                   mov   al,value                                ;Letter D
                                   mov   cx,1                                    ;1 times
                                   mov   bl,05h                                  ;purple (5) on white(F) background
                                   int   10h




    ;======================get curser postition here its recx and recy

                                   mov   dh,recy
                                   mov   dl,recx
                                   cmp   dl,79
                                   jz    endofliner
                                   inc   dl
                                   mov   recx,dl
                                   cmp   dh,9
                                   jz    endofpager
                                   jmp   contr

    endofliner:                    
                                   mov   dl,0
                                   mov   recx,dl
                                   inc   dh
                                   mov   recy,dh
                                   jmp   contr
    endofpager:                    
    ;mov al,page1
    ;inc al
    ;mov page1 ,al
    ; clear part of rec
                                   mov   ax,0601h
                                   mov   bh,07
                                   mov   ch,01
                                   mov   cl,0
                                   mov   dh,9                                    ;
                                   mov   dl,79
                                   int   10h
                                   mov   dh,8                                    ;
                                   mov   dl,0d
                                   mov   recy,dh
                                   mov   recx,dl
                                   jmp   contr


    contr:                         
                                   mov   bh,0
                                   mov   ah,2
                                   int   10h



    CHKINCHAR:                     

                                   mov   bh,0
                                   mov   ah,2
                                   mov   dx,0a0ah
                                   int   10h

    getkey_pressed:                
                                   mov   ah,01h
                                   int   16h
                                   jnz   cont44                                  ; check if key is pressed if not go recive
                                   jmp   CHK_chat
    cont44:                        
                                   mov   ah,0
                                   Int   16h
                                   mov   value,al
                                   cmp   al,27
                                   jnz   cont_chat2
                                   jmp   exit
    cont_chat2:                    
    ;set curser
                                   mov   dh,sendy
                                   mov   dl,sendx
    ; move curser
                                   mov   bh,0
                                   mov   ah,2
                                   int   10h
                                   cmp   al,0dh
                                   jnz   cont_chat_print
 
                                   mov   dl,79
                                   jmp   check_boundary
    cont_chat_print:               
    ;print byte
                                   mov   ah,9                                    ;Display
                                   mov   bh,0                                    ;Page 0
                                   mov   al,value                                ;Letter D
                                   mov   cx,1                                    ;1 times
                                   mov   bl,03h                                  ;Green (A) on white(F) background
                                   int   10h
    ;======================get curser postition here it is stored in sendx and sendy

    check_boundary:                

    ;============
                                   cmp   dl,79
                                   jz    endofline
                                   inc   dl
                                   mov   sendx,dl
                                   cmp   dh,24
                                   jz    endofpage
                                   jmp   cont

    endofline:                     
                                   mov   dl,0
                                   mov   sendx,dl
                                   inc   dh
                                   mov   sendy,dh
                                   jmp   cont
    endofpage:                     

                                   mov   ax,0601h
                                   mov   bh,07
                                   mov   ch,11
                                   mov   cl,0
                                   mov   dh,24
                                   mov   dl,79
                                   int   10h
                                   mov   dh,23d
                                   mov   dl,0

                                   mov   sendx,dl
                                   mov   sendy,dh

                                   jmp   cont

    cont:                          
                                   mov   bh,0
                                   mov   ah,2
                                   int   10h

    ;Set port configuration
                                   mov   dx,3fbh
                                   mov   al,00011011b
                                   out   dx,al

    ;===================
    AGAIN:                                                                       ;Check that Transmitter Holding Register is Empty
                                   mov   dx , 3FDH                               ; Line Status Register
                                   In    al , dx                                 ;Read Line Status
                                   AND   al , 00100000b
                                   Jnz   cont12
                                   jmp   CHK_chat
    cont12:                        
    ;If empty put the VALUE in Transmit data ;register
                                   mov   dx , 3F8H                               ; Transmit data register
                                   mov   al,value
                                   out   dx , al
           
                                   jmp   getkey_pressed

       
                    
                

    exit:                          
                                   ret
    ;   mov   ah, 4ch
    ;   int   21h
    ;   ret
Chat endp


    ;===========================
MAIN PROC
    ; Initialize data segment
    cmp flag_init_port , 1
    jz   Menu
                                   MOV   AX, @DATA
                                   MOV   DS, AX
         
                               


    ; initinalize COM
    ;Set Divisor Latch Access Bit
                                   mov   dx,3fbh                                 ; Line Control Register
                                   mov   al,10000000b                            ;Set Divisor Latch Access Bit
                                   out   dx,al                                   ;Out it
    ;Set LSB byte of the Baud Rate Divisor Latch register.
                                   mov   dx,3f8h
                                   mov   al,01h
                                   out   dx,al

    ;Set MSB byte of the Baud Rate Divisor Latch register.
                                   mov   dx,3f9h
                                   mov   al,00h
                                   out   dx,al

    ;jmp play
    Menu:                          
                                   mov   ch,50
                                   mov   cl,10


                                   MOV   BH,1
                                   mov   ah,0
                                   mov   al,13h
                                   int   10h
                                   call  draw_menu
                                   mov   ah,0
                                   int   16h
                                   cmp   ah,1ch
                                   jz    EnterState
                                   cmp   ah,48h
                                   jnz   mov_down

                                   mov   ax,curY
                                   cmp   ax,65
                                   jb    Menu
                                   pusha
                                   mov   al,curs_color
                                  
                                   mov   curs_color,0
                                   pusha
                                   call  draw_curser
                                   popa
                                   mov   curs_color,al
                                   popa
                                   mov   ax,curY
                                   sub   ax,30
                                   mov   curY,ax
                                   call  draw_curser
                                   dec   State
                                   MOV   Al,State
    mov_down:                      
                                   cmp   ah,80
                                   jnz   Menu
                                   mov   ax,curY
                                   cmp   ax,110
                                   jg    Menu
                                   pusha
                                   mov   al,curs_color
                                   mov   curs_color,0
                                   pusha
                                   call  draw_curser
                                   popa
                                   mov   curs_color,al
                                   popa
                                   mov   ax,curY
                                   add   ax,30
                                   mov   curY,ax
                                   call  draw_curser
                                   inc   State
                                   mov   al,State
                                   jmp   Menu
    EnterState:                    
                                   cmp   State,0
                                   jz    play
                                   cmp   State,1
                                   jnz   menu_cont2
                                   jmp   Score
    menu_cont2:                    
                                   cmp   State,2
                                   jnz   menu_cont
                                   jmp   chat_menu
    menu_cont:                     
    play:                          
    ;==================================================================select mode
                                   mov   bh,0
                                   mov   ah,0
                                   mov   al,3
                                   int   10h

    ;== move cureser
                                   mov   ah,2
                                   mov   dh,5
                                   mov   dl,25
                                   int   10h
    ;====
         
                                   mov   ah, 9
                                   mov   dx, offset mode1
                                   int   21h
    ;== move cureser
                                   mov   ah,2
                                   mov   dh,8
                                   mov   dl,25
                                   int   10h
    ;====
                                   mov   ah, 9
                                   mov   dx, offset mode2
                                   int   21h
    ;== move cureser
                                   mov   ah,2
                                   mov   dh,11
                                   mov   dl,25
                                   int   10h
    ;====
                                   mov   ah, 9
                                   mov   dx, offset mode3
                                   int   21h
    ;== move cureser
                                   mov   ah,2
                                   mov   dh,14
                                   mov   dl,25
                                   int   10h
    ;====
                                   mov   ah, 9
                                   mov   dx, offset mode4
                                   int   21h





                                    ;== move cureser
                                   mov   ah,2
                                   mov   dh,17
                                   mov   dl,25
                                   int   10h
    ;====
                                   mov   ah, 9
                                   mov   dx, offset mode5
                                   int   21h
    ;===================wait for button to be pressed

                                                                 
                                   mov   ah,2
                                   mov   dh,5
                                   mov   dl,22
                                   int   10h
                                   mov   mode,0
    reagain_butt:                  
                                   mov   ah,0
                                   int   16h
                                   cmp   ah , 50h
                                   jne   chk_upper
                                   inc   mode
                                   JMP   valid_mode
                                   jmp   reagain_butt
    chk_upper:                     

                                   cmp   ah , 48h
                                   jne   chk_enter
                                   dec   mode
                                   JMP   valid_mode
                                   jmp   reagain_butt
    chk_enter:                     
                                   cmp   ah , 1ch
                                   je   selectiondone_rel

                                   cmp   ah , 01h
                                   jne selectiondone_rel1
                                   jmp Menu

                                   selectiondone_rel:
                                   jmp selectiondone

selectiondone_rel1: jmp reagain_butt
                                


    valid_mode:                    
                                   cmp   mode,5
                                   je    choice_1
                                   cmp   mode , 0
                                   je    choice_1
                                   cmp   mode,1
                                   je    choice_2
                                   cmp   mode,2
                                   je    choice_3
                                   cmp   mode,3
                                   je    choice_4
                                  cmp   mode,4
                                   je    choice_5
                                   cmp   mode ,0
                                   jl    choice_5
                                   jmp   selectiondone
    choice_1:                      
                                   mov   mode,0
                                   mov   ah,2
                                   mov   dh,5
                                   mov   dl,22
                                   int   10h
                                   jmp   reagain_butt
    choice_2:                      
                                   mov   mode,1
                                   mov   ah,2
                                   mov   dh,8
                                   mov   dl,22
                                   int   10h
                                   jmp   reagain_butt

    choice_3:                      
                                   mov   mode,2
                                   mov   ah,2
                                   mov   dh,11
                                   mov   dl,22
                                   int   10h
                                   jmp   reagain_butt
    choice_4:                      
                                   mov   mode,3
                                   mov   ah,2
                                   mov   dh,14
                                   mov   dl,22
                                   int   10h
                                   jmp   reagain_butt

    choice_5:
                                   mov   mode,4
                                   mov   ah,2
                                   mov   dh,17
                                   mov   dl,22
                                   int   10h
                                   jmp   reagain_butt

    ;   cmp mode,4

    ;   jne select_mode2
    ;   mov mode,0
    ;   jmp select_modef
    ;   select_mode2:
    ;   cmp al,"2"
    ;   jne select_mode3
    ;   mov mode,1
    ;   jmp select_modef
    ;   select_mode3:
    ;   cmp al,"3"
    ;   jne select_mode4
    ;  mov mode,2
    ;  jmp select_modef
    ;  select_mode4:
    ;   cmp al,"4"
    ;   jne rechk_mode
    ;   mov mode,3
    ;   select_modef:




    ;   rechk_mode:
    ;   mov   ah,0
    ;   int   16h
    ;   cmp al,"1"
    ;   jne select_mode2
    ;   mov mode,0
    ;   jmp select_modef
    ;   select_mode2:
    ;   cmp al,"2"
    ;   jne select_mode3
    ;   mov mode,1
    ;   jmp select_modef
    ;   select_mode3:
    ;   cmp al,"3"
    ;   jne select_mode4
    ;  mov mode,2
    ;  jmp select_modef
    ;  select_mode4:
    ;   cmp al,"4"
    ;   jne rechk_mode
    ;   mov mode,3
    ;   select_modef:
    ;========================================================================

    selectiondone:                 


                                  mov bh,0
                                  mov   ah,0
                                  mov   al,3
                                  int   10h




                                  mov   ah,2
                                  mov   dh,3
                                  mov   dl,20
                                  int   10h
    ;====
                                 CMP mode,2 
                                 JZ control_mode2
                                  mov   ah, 9
                                  mov   dx, offset option_single
                                  int   21h

                                    JMP cont_control
                                control_mode2:

                                  mov   ah, 9
                                  mov   dx, offset option_multi
                                  int   21h
                                cont_control:


    ;== move cureser
                                  mov   ah,2
                                  mov   dh,8
                                  mov   dl,25
                                  int   10h
    ;====
         
                                  mov   ah, 9
                                  mov   dx, offset option1
                                  int   21h
    ;== move cureser
                                  mov   ah,2
                                  mov   dh,11
                                  mov   dl,25
                                  int   10h
    ;====
                                  mov   ah, 9
                                  mov   dx, offset option2
                                  int   21h




                                mov   ah,2                              
                                  mov   dh,8
                                  mov   dl,22
                                  int   10h
                                  mov curr_option,0
                                  reagain_option:
                                  mov   ah,0
                                  int   16h
                                  cmp ah , 50h
                                  jne chk_upper_option
                                inc curr_option
                                JMP valid_option
                                jmp  reagain_option
                                chk_upper_option:

                                cmp ah , 48h
                                jne chk_enter_option
                                dec curr_option
                                                                JMP valid_option
                                jmp  reagain_option
                                chk_enter_option:
                                cmp ah , 1ch
                                je  control_flag1
                                cmp ah , 01h
                                je control_flag2
                                jmp reagain_option
                                control_flag2:
                                jmp play

control_flag1:
                                jmp selectiondone_option




                                valid_option:


   

                                   cmp curr_option , 0
                                   je choice_1_option

                                   cmp curr_option,1
                                   je choice_2_option

                                    cmp curr_option,2
                                   je choice_1_option

                                   cmp curr_option ,0
                                   jl choice_2_option
                                   jmp selectiondone_option
                                    choice_1_option:
                                    mov curr_option,0
                                 mov   ah,2
                                  mov   dh,8
                                  mov   dl,22
                                  int   10h
                                    jmp reagain_option
                                    choice_2_option:
                                    mov curr_option,1
                                                                      mov   ah,2
                                  mov   dh,11
                                  mov   dl,22
                                  int   10h
                                    jmp reagain_option

                                selectiondone_option:

                                MOV    AL  ,curr_option
                                MOV first_player_butt,AL


                                MOV sec_player_butt,1

                                CMP curr_option , 0 
                                JZ cont_option_player2
                                MOV sec_player_butt,0

                                cont_option_player2:

                                   mov   ah,0
                                   mov   al,13h                                  ;13h
                                   int   10h
                                   mov   ah, 1Ah                                 ; BIOS function: Get Display Combination Code
                                   int   10h
    ; AL = Display code (e.g., 00h = MDA, 04h = CGA, 06h = EGA, 07h = VGA)
    ; BL = Adapter type


    ;===========================
    ; Set BackGround Color
                                   MOV   AH , 0Bh
                                   MOV   BH , 00h
                                   MOV   BL , BackGroundColor                    ; BackGround Color
                                   int   10h


    ;  CALL RestartBall
  


    ;======================================
    ;;;;;;;;;;;;choose level;;;;;;;;;;;;;;;;;
    ;======================================
                                   mov   al,mode
                                   cmp   mode,3
                                   jge    cont_chooseLeve   ;je
                                   jmp   cont_chooseleve2
    cont_chooseleve:      

pusha 
mov al ,prevmode
                cmp  mode,al
                popa
                je noneed_chk
                jmp need_chk
                noneed_chk:
                jmp correct_mode
                need_chk:
    ;====================================================================== send that u are ready
    ;Set port configuration
                                   mov   dx,3fbh
                                   mov   al,00011011b
                                   out   dx,al

    ;===================
    AGAIN_to_start:                                                              ;Check that Transmitter Holding Register is Empty
                                   mov   dx , 3FDH                               ; Line Status Register
                                   In    al , dx                                 ;Read Line Status
                                   AND   al , 00100000b
                                   Jz    AGAIN_to_start
                  
    ;If empty put the VALUE in Transmit data ;register
                                   mov   dx , 3F8H                               ; Transmit data register
                                   mov   al,mode
                                   out   dx , al
    ;=======================================================================
    pusha
                                    mov   bh,0
                                   mov   ah,0
                                   mov   al,3
                                   int   10h
                                  mov   ah,2
                                   mov   dh,11
                                   mov   dl,25
                                   int   10h
                                    mov   ah, 9
                                   mov   dx, offset message_online
                                   int   21h


popa
   
    CHK_to_start:          
                                    mov ah , 1
                                    int 16h
                                    jz cont_online
                                    cmp ah , 01h
                                    jne cont_online

                                    ;transmit  that I leave




   AGAIN_to_start_esc:                                                              ;Check that Transmitter Holding Register is Empty
                                   mov   dx , 3FDH                               ; Line Status Register
                                   In    al , dx                                 ;Read Line Status
                                   AND   al , 00100000b
                                   Jz    AGAIN_to_start_esc
                  
    ;If empty put the VALUE in Transmit data ;register
                                   mov   dx , 3F8H                               ; Transmit data register
                                   mov   al,9
                                   out   dx , al








                                    jmp Menu
                                    cont_online:
                                    mov   dx , 3FDH                               ; Line Status Register
                                   in    al , dx
                                   AND   al , 1
                                   JZ    CHK_to_start             ;whait for user 2 to connect
                                                         
                                    mov dx , 03F8H
                                        in al , dx 
                                    cmp al , mode  
                                    jnz  save_prev_mode
                                    jmp correct_mode
                                    save_prev_mode:
                                    jmp  Menu
                                    mov   prevmode , al 
                                   jmp    CHK_to_start                            ;to be same mode
correct_mode:
    ;===============================================================================

                                    pusha

                                   mov   ah,0
                                   mov   al,13h                                  ;13h
                                   int   10h
                                   mov   ah, 1Ah                                 ; BIOS function: Get Display Combination Code
                                   int   10h

                                   MOV   AH , 0Bh
                                   MOV   BH , 00h
                                   MOV   BL , BackGroundColor                    ; BackGround Color
                                   int   10h
popa

  correct_mode_chk:
                                   mov   al,2

                                   cmp mode , 4 
                                   jne cont_chooseleve2
                                   mov al ,4
    cont_chooseleve2:              
                                   mov   lvl,al
                                   cmp lvl ,4 
                                   jz mode_4_lvl
                                   cmp   lvl,0
                                   jnz   cmpAgain
                                   mode_4_lvl:
                                   mov   rows,10
                                   mov   cols,14
                                   mov   starts_x,0
                                   mov   starts_y,0
                                   jmp   choice_done
    cmpAgain:                      
                                   cmp   lvl,1
                                   jnz   lvl3
                                   mov   rows,10
                                   mov   cols,10
                                   mov   starts_x,46
                                   mov   starts_y,0
                                   jmp   choice_done
    lvl3:                          
                                   mov   starts_x,0
                                   mov   starts_y,60
                                   mov   rows,8
                                   mov   cols,14
    choice_done:                   
    ;=======================================
                                   call  draw_grid_loop
                                   mov   determine_breaker_Flag ,0
                                   CALL  setBreaker1
                                                                       MOV AX , defaultx 
                                    mov x , AX 
                                     MOV AX , defaulty 
                                    mov y, AX 
                                    MOV AX , defaultendx 
                                    mov endx , AX 
                                    MOV AX , defaultendy 
                                    mov endy , AX 
                                                                        MOV AX , defaultyorigin 
                                    mov yorigin , AX 
                                    mov ax, default_lenght
                                    mov lenght, ax
                                   call  draw_breaker
                                   CALL  setBreaker2


                                   CMP   mode ,1
                                   JLE   singl_mode
                                    cmp mode , 4 
                                    jne mode_4_det
                                    mov  determine_set_get_mode_4 ,0
                                    call setBreaker3
                                    jmp singl_mode
                                    mode_4_det:
                                   mov   determine_breaker_Flag ,1
                                   CALL  setBreaker1
                                     MOV AX , defaultx 
                                    mov x , AX 
                                     MOV AX , defaulty 
                                    mov y, AX 
                                    MOV AX , defaultendx 
                                    mov endx , AX 
                                    MOV AX , defaultendy 
                                    mov endy , AX 
                                    MOV AX , defaultyorigin 
                                    mov yorigin , AX 
                                    mov ax, default_lenght
                                    mov lenght, ax
                                   call  draw_breaker
                                   CALL  setBreaker2
    ;  call draw_breaker2
    ;  CALL DrawBall              ;check the upper pixel of the ball is not as the background ;;;;;;;;;;;;;;;
    singl_mode:                    

                                



            
                                    
                                    MOV total,0
                                    mov fire, 0
                                    mov al, defaultCntFire
                                    mov cntFire, al
                                    
                                    cmp greenFlag, 0
                                    JZ resetGreenFlag
                                    

                                    
                                    resetGreenFlag:
                                    mov greenFlag, 0
                                    mov al, defaultIncBreaker
                                    mov cntIncBreaker, al

                                    MOV begin_game , 0
                                    MOV  AL ,default_heart
                                    MOV first_heart ,AL 
                                    MOV sec_heart ,AL 
                                    MOV first_score , 0 
                                    MOV sec_score, 0 
                                   mov   cx,0
                                   MOV   determineFlag , 0
                                   CALL  setBall1
                                   CALL  RestartBall
                                   CALL  setBall2
                                   MOV   determineFlag , 1
                                   CALL  setBall1
                                   CALL  RestartBall
                                   CALL  setBall2
    game:                          
                                   cmp   cx,Speed

                                   jnz dummyFlag
                                   jmp dummyFlag2
                                   dummyFlag:
                                   jmp Draw_break2
                                    dummyFlag2:

                                    ; check for fire powerUps
                                   cmp fire, 1
                                   jnz contAfterPowerUp
                                   dec cntFire
                                   cmp cntFire, 0
                                   jge contAfterPowerUp 
                                   mov al, defaultCntFire
                                   mov cntFire, al
                                   mov fire, 0
    ; first ball            
                                    contAfterPowerUp:

                                    ; check for increase breaker power up
                                   cmp greenFlag, 1
                                   jnz contAfterIncPowerUp
                                   dec cntIncBreaker
                                   cmp cntIncBreaker, 0
                                   jge contAfterIncPowerUp 
                                   mov al, defaultIncBreaker
                                   mov cntIncBreaker, al
                                   mov greenFlag, 0

                                   MOV determineFlag ,0
                                    CALL setBreaker1
                                    mov breaker_color, 0
                                    call draw_breaker
                                    add x, 20
                                    sub endx, 20
                                    sub lenght, 40
                                    mov al, default_breaker_color
                                    mov breaker_color, al
                                    call draw_breaker
                                    CALL setBreaker2
                                   
                                   
                                   
    ; first ball            
                                    contAfterIncPowerUp:

                                   MOV   determineFlag , 0
                                   CALL  setBall1
                                   CALL  MovBall
                                 
                                   CALL  setBall2
                                   CMP   mode ,1
                                   JLE   singl_mode_1
                                   cmp mode ,4 
                                   je singl_mode_1
                                   MOV   determineFlag , 1
                                   CALL  setBall1
                                   CALL  MovBall
                                

                                   CALL  setBall2

    singl_mode_1:                  
                                   MOV   determineFlag , 0
                                   CALL  setBall1
                                 
                                   pusha
                                   call  bricksCollision
                                   popa
                                   CALL  setBall2
                
                                   CMP   mode ,1
                                   JLE   singl_mode_22
                                   cmp mode,4 
                                   je singl_mode_22
                                   MOV   determineFlag , 1
                                   CALL  setBall1
                                  
                                   pusha
                                   call  bricksCollision
                                   popa

                                   CALL  setBall2
    singl_mode_22:                 
                                   mov   cx,0
    ; Second ball
    ;      MOV determineFlag ,1
    ;     CALL setBall1
    ;      CALL MovBall
    ;                           pusha
    ;    call checkCollisionBlocks
    ;    popa
    ;      CALL setBall2
                     
             
    ;      pusha
    ;    call checkCollisionBlocks
    ;    popa
    Draw_break2:                   
                                   pusha
                                   mov   dx,5
                                   mov   dx,0
                                   mov   dl,-5
                     
                                   call  Mov_Breaker
                                   popa
                                   pusha
                     
                                   CMP   mode ,2
                                   JLE   singl_mode_6
                                   call  recive_data
                                   popa
    singl_mode_6:                  
                                   inc   cx
                                   jmp   game
    endgame:                       
                                   jmp   Score

    Score:                         
                                   mov   bh,0
                                   mov   ah,0
                                   mov   al,3
                                   int   10h

                                   mov   bh,0
                                   mov   ah,2
                                   mov   dh,9
                                   mov   dl,30
                                   int   10h
                                   mov   ah, 9
                                   mov   dx, offset player1_str
                                   int   21h
                                   pusha

                                   mov   ax,first_score
                                   lea   di,string_score1
                                   lea   si,string_score1
                                   call  convert_to_str
                                   popa


                                   mov   ah, 9
                                   mov   dx, offset string_score1
                                   int   21h

                                cmp mode, 2
                                jl cont_score
                                   mov   ah,2
                                   mov   dh,12
                                   mov   dl,30
                                   int   10h
                                   mov   ah, 9
                                   mov   dx, offset player2_str
                                   int   21h
                                   pusha
                                   mov   ax,sec_score
                                   lea   di,string_score2
                                   lea   si,string_score2
                                   call  convert_to_str
                                   popa


                                   mov   ah, 9
                                   mov   dx, offset string_score2
                                   int   21h

    cont_score:                    
                                   mov   ah,0
                                   int   16h
                      
                                   cmp   ah,01h
                                   jnz   cont_score
                                   jmp   Menu




    chat_menu:                     
                                   mov   ah,0
                                   mov   al,3
                                   int   10h
                                   pusha
                                   call  Chat
                                   popa
                                   jmp   Menu
    end1:                          

MAIN ENDP

convert_to_str proc
    
                                   mov   bx,0ah
    convertstro:                   
                                   mov   dx,0
                                   div   bx
                                   add   dx,'0'
                                   mov   [di],dl
                                   inc   di
                                   and   ax,ax
                                   jnz   convertstro

                                   dec   di
    

    revstro:                       
                                   CMP   SI, DI
                                   JAE   stoprstro
                                   MOV   AL, [SI]
                                   XCHG  AL, [DI]
                                   MOV   [SI], AL
                                   inc   si
                                   dec   di
                                   jmp   revstro
    stoprstro:                     
                                   ret
convert_to_str endp
Mov_Breaker proc

    loop2:                         
                                   mov   dx,breakersmothness
                                   mov   ah,1
                                   int   16h
                                   
                                   Jz    rel_no_key
                                   jmp   rel_cont_key
    rel_no_key:                    
                                   JMP   no_key_1
    rel_cont_key:                  

                                   mov   al , right_arrow
                                   mov   curr_right ,al
                                   mov   al , left_arrow
                                   mov   curr_left , al
                                   cmp   first_player_butt ,0
                                   jz    cont_butt
                                   mov   al , right_butt
                                   mov   curr_right ,al
                                   mov   al , left_butt
                                   mov   curr_left , al
    cont_butt:                     
                                   mov   buttonpressed,ah
                                   mov   determine_breaker_Flag,0
                                   mov   ah,0                                    ;  make it int 16/0
                                   int   16h
                                   mov   rl,1                                    ;;;;;;;;;;
                                   cmp   ah,curr_right
                                   jz    rel_movr
                                 jmp not_rel_mov
                                   rel_movr:
                                   jmp movr
                                   not_rel_mov:
                                   cmp   ah,curr_left
                                   jnz   cont2
    ;jnz                        
                                   mov   dx,negativebs
                                   mov   rl,0
                                   JMP   movr

    cont2:                         
                                    cmp mode,3
                                    jge cont_mode_3     ;je
                                    
                                    cmp ah, 01H ; esc 
                                    JE    escapetomenu
                                    jmp cont_mode_3

                                    escapetomenu:
                                    ; mov flag_init_port , 1
                                    
                                    mov   cx,0
                                   mov   dx,0
                   
                                     d_c211:                                                                      
                                    ;call draw_line_H

                                   mov   al,0          ;Pixel color
                                   mov   ah,0ch
                  
                                 d_c222:                         
                                   int   10h
                                   inc   cx
                                   cmp   cx,320
                                   jnz   d_c222
                                   inc   dx
                                   mov   cx,0
                                   cmp   dx,200
                                   jnz   d_c211
                                    jmp Menu


                                  cont_mode_3:

                                  cmp mode,3
                                    jge cont_mode_33                ;jg
                                    
                                    cmp ah, 3BH ; f1 
                                    JE    pausetomenu
                                    jmp cont_mode_33

                                    pausetomenu:
                                    
                                    ; mov pause_flag ,1
                                    mov   ah,0
                                   int   16h
                                  cmp ah, 3BH ; f1 
                                JNZ pausetomenu

                                cont_mode_33:
                                ;    mov pause_flag ,0


                                   CMP   mode ,2
                                   jne   rel_nokey_1
                                   jmp   rel_nokey_2
    rel_nokey_1:                   
                                   jmp   no_key_1
    rel_nokey_2:                   
                                   mov   al , right_arrow
                                   mov   curr_right ,al
                                   mov   al , left_arrow
                                   mov   curr_left , al
                                   cmp   sec_player_butt ,0
                                   jz    cont_butt_2
                                   mov   al , right_butt
                                   mov   curr_right ,al
                                   mov   al , left_butt
                                   mov   curr_left , al
    cont_butt_2:                   



                                   mov   determine_breaker_Flag,1
                                   cmp   ah,curr_right
                                   jz    movr
                                   cmp   ah,curr_left
                                   jnz   no_key_1
                                   mov   dx,negativebs
                                   mov   rl,0

                                     
    movr:                          
         
                                   CALL  setBreaker1
    
                                   cmp   mode , 3
                                   Jl   not_mode_3         ;jne
                                   pusha
                                   mov   value, dl
                                   cmp mode , 4 
                                   je mode_4_notneg
                                   neg   value     
                                   mode_4_notneg:                              ;;;;;;;;;;;;;;;;;;;send shift value
                                   call  send_data
                                   popa
    not_mode_3:                    

    ; endx+somth
                                   mov   ax ,endx
                                   add   ax,dx
                                   mov   endx,ax
                                   cmp   ax,320
                                   ja    rightbound
                                   cmp   ax,lenght
                                   ja    inbound
                                   mov   ax,lenght
                                   mov   x,0
                                   mov   endx,ax
                   
                                   jmp   cont3
    rightbound:                    
                                   mov   ax,lenght
                                   mov   bx,320
                                   sub   bx,ax
                                   mov   endx,320
    inbound:                       
                                   mov   ax,endx
                                   mov   bx,lenght
                                   sub   ax,bx
                                   mov   x,ax
           
               
    cont3:                         
    
                                   cmp   rl,0
                                   jnz   drawR
                                   call  draw_breakerL
                                   jmp   no_key
    drawR:                         
                                   call  draw_breakerR



    no_key:                        

                                   CALL  setBreaker2
    no_key_1:                      

                                   ret
Mov_Breaker endp

draw_breakerR proc

                                   mov   bx,x
                                   sub   bx,breakersmothness
                                   mov   startx,bx
                                   mov   bx,y
                                   mov   starty,bx
                                   call  clrbreaker_shift
    loop1R:                        



                                   mov   bx,endx
                                   sub   bx,breakersmothness
                                   mov   cx,bx
                                   dec   cx                                      ;Column
                                   mov   dx,y                                    ;Row
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch                                  ;Draw Pixel Command
    backR:                         int   10h
                                   inc   cx
           
                                   cmp   cx,endx
                                   jnz   backR
                                   inc   dx
                                   mov   y,dx
            
                                   cmp   dx,endy
                                   jnz   loop1R

                                   mov   ax,yorigin
                                   mov   y,ax
                                   ret
draw_breakerR endp


draw_breakerL proc


                                   mov   bx,x
                                   add   bx,lenght
                                   mov   startx,bx
                                   mov   bx,y
                                   mov   starty,bx

                                   call  clrbreaker_shift
                                   mov   bx,x
                                   add   bx,breakersmothness
    loop1L:                        
                     
                                   mov   cx,x                                    ;Column
                                   mov   dx,y                                    ;Row
                                   mov   al,5                                    ;Pixel color
                                   mov   ah,0ch                                  ;Draw Pixel Command
    backL:                         int   10h
                                   inc   cx
           
                                   cmp   cx,bx
                                   jnz   backL
                                   inc   dx
                                   mov   y,dx
            
                                   cmp   dx,endy
                                   jnz   loop1L

                                   mov   ax,yorigin
                                   mov   y,ax
                                   ret
draw_breakerL endp



    ;==================================================================
draw_grid_loop proc

                                   mov   cx,0
                                   mov   dx,0
                                   mov   cl ,rows
                                   push  starts_x
    grid_loop:                     
    ;change color
                                   pop   starts_x
                    
                                   cmp   lvl,1
                                   jnz   normal
                                   cmp   cl,2
                                   jbe   rock
                                   mov   color,4
                                   jmp   done_color
    rock:                          
                                   mov   color,8
                                   jmp   done_color


    normal:                        
                                   cmp   color,12
                                   jnz   firstc1
                                   mov   color,9
                                   jmp   secondc1
    firstc1:                       
                                   mov   color,12
    secondc1:                      
                    
                     
    done_color:                    
                                   mov   dl,cols
                                   push  starts_x

    line_loop:                     
                                   mov   bx,starts_x
                                   mov   startx,bx
                                   mov   bx,starts_y
                                   mov   starty,bx
                                   push  cx
                                   push  dx
                                   call  myblock
                                   inc   total
                                   pop   dx
                                   pop   cx
                                   add   starts_x,23
                                   dec   dl
                                   jnz   line_loop
                                   add   starts_y,10
                                   dec   cl
                                   jnz   grid_loop
                                   ret
draw_grid_loop endp

draw_breaker proc
    loop1:                         
                    
                                   mov   cx,x                                    ;Column
                                   mov   dx,y                                    ;Row
                                   mov   al,breaker_color                                    ;Pixel color
                                   mov   ah,0ch                                  ;Draw Pixel Command
    back:                          int   10h
                                   inc   cx
           
                                   cmp   cx,endx
                                   jnz   back
                                   inc   dx
                                   mov   y,dx
            
                                   cmp   dx,endy
                                   jnz   loop1

                                   mov   ax,yorigin
                                   mov   y,ax
                                   ret
draw_breaker endp

    ; draw_breaker2 proc

    ;                      mov  ax ,sec_breac_endx ;endx
    ;                      cmp  ax,320
    ;                      ja   rightbound_sec
    ;                      cmp  ax,sec_breac_len
    ;                      ja   inbound_sec
    ;                      mov  ax,sec_breac_len
    ;                      mov  sec_breac_X,0
    ;                      mov  sec_breac_endx,ax
                   
    ;                      jmp  cont3_sec
    ;     rightbound_sec:
    ;                      mov  ax,sec_breac_len;lenght
    ;                      mov  bx,320
    ;                      sub  bx,ax
    ;                      mov sec_breac_X,bx
    ;                      mov  sec_breac_endx,320
    ;     inbound_sec:
    ;                      mov  ax,sec_breac_endx;endx
    ;                      mov  bx,sec_breac_len;lenght
    ;                      sub  ax,bx
    ;                      mov  sec_breac_X,ax
    ;         cont3_sec:

    ;     loop12:
                    
    ;                      mov  cx,sec_breac_X                   ;Column
    ;                      mov  dx,sec_breac_Y                    ;Row
    ;                      mov  al,sec_breaker_color                    ;Pixel color
    ;                      mov  ah,0ch                  ;Draw Pixel Command
    ;     back2:            int  10h
    ;                      inc  cx
           
    ;                      cmp  cx,sec_breac_endx
    ;                      jnz  back2
    ;                      inc  dx
    ;                      mov  sec_breac_Y,dx
            
    ;                      cmp  dx,sec_breac_endy
    ;                      jnz  loop12

    ;                      mov  ax,sec_breac_yOrg
    ;                      mov  sec_breac_y,ax
    ;                      ret
    ; draw_breaker2 endp






    ; draw_breaker2_single proc

    ;                      mov  ax ,sec_endx ;endx
    ;                      cmp  ax,320
    ;                      ja   rightbound_sec_single
    ;                      cmp  ax,sec_lenght
    ;                      ja   inbound_sec_single
    ;                      mov  ax,sec_lenght
    ;                      mov    sec_x,0
    ;                      mov  sec_endx,ax
                   
    ;                      jmp  cont3_sec_single
    ;     rightbound_sec_single:
    ;                      mov  ax,sec_lenght;lenght
    ;                      mov  bx,320
    ;                      sub  bx,ax
    ;                      mov sec_x,bx
    ;                      mov  sec_endx,320
    ;     inbound_sec_single:
    ;                      mov  ax,sec_endx;endx
    ;                      mov  bx,sec_lenght;lenght
    ;                      sub  ax,bx
    ;                      mov  sec_x,ax
    ;         cont3_sec_single:

    ;     loop12_single:
                    
    ;                      mov  cx,sec_x                   ;Column
    ;                      mov  dx,sec_y                   ;Row
    ;                      mov  al,sec_breaker_color                    ;Pixel color
    ;                      mov  ah,0ch                  ;Draw Pixel Command
    ;     back2_single:            int  10h
    ;                      inc  cx
           
    ;                      cmp  cx,sec_endx
    ;                      jnz  back2_single
    ;                      inc  dx
    ;                      mov  sec_y,dx
            
    ;                      cmp  dx,sec_endy
    ;                      jnz  loop12_single

    ;                      mov  ax,sec_yorigin
    ;                      mov  sec_breac_y,ax
    ;                      ret
    ; draw_breaker2_single endp







    ;==============================================================================


myblock proc

    ;=====change color====
                                   cmp   lvl,1
                                   jz    no_cc
                                   cmp   color,9
                                   jnz   firstc
                                   mov   color,12
                                   jmp   secondc
    firstc:                        
                                   mov   color,9
    secondc:                       
                   
          
    no_cc:                         
                   

    ;;;;;;;;;;;;;;;;;power up
                                   cmp   lvl,0
                                   jnz   start_draw
                                   cmp   total,35
                                   jnz   powerUpLabel
                                   mov dl, green_block
                                   mov   color, dl
                powerUpLabel:

    ;;;;;;;;;;;;;;;;;power up
                                   cmp   lvl,0
                                   jnz   start_draw
                                   cmp   total,100
                                   jnz   start_draw
                                   mov dl, orange_block
                                   mov   color, dl
                     





    start_draw:                    
                                   mov   dx,starty                               ;set start height
                                   mov   cx,startx                               ;set start width
       
    ;set end width
           
                                   mov   bx,startx
                                   add   bx,mywidth
                                   mov   end_x,bx

    ; set end height
           
                                   mov   bx,starty
                                   add   bx,height
                                   mov   end_y,bx
    block:                         
                                   inc   dx
                                   mov   cx,startx
                                   mov   al,color
                                   mov   ah,0ch
    line:                          
                                   int   10h
                                   inc   cx
                                   cmp   cx,end_x
                                   jnz   line
                                   cmp   dx,end_y
                                   jnz   block
                                   ret
myblock endp



clearMyBlock proc

                                   mov   color, 0
                                   mov   dx,starty                               ;set start height
                                   mov   cx,startx                               ;set start width
       
    ;set end width
           
                                   mov   bx,startx
                                   add   bx,mywidth
                                   mov   end_x,bx

    ; set end height
           
                                   mov   bx,starty
                                   add   bx,height
                                   mov   end_y,bx
    clearBlock:                    
                                   inc   dx
                                   mov   cx,startx
                                   mov   al,color
                                   mov   ah,0ch
    clearLine:                     
                                   int   10h
                                   inc   cx
                                   cmp   cx,end_x
                                   jnz   line
                                   cmp   dx,end_y
                                   jnz   block
                                   ret
clearMyBlock endp

    ; detect the background color if not black so there is collision
    ; xc -> div 23 get the divisor and mul with 23 to get block start x
    ; Yc -> div 10 get the divisor and mul with 10 to get block start y
    ;


getDownBlockStarts proc
                                   mov   ax, dummy                               ; xc of the ball
                                   mov   cx, mywidth                             ; block width
                                   add   cx, space                               ;div by block length and space in between => cx = 23 for our eg.
                                   mov   dx, 0
                                   div   cx                                      ;  AX = AX/CX and DX=AX % CX
                                   mul   cx                                      ; mul with the block width and space in between => now ax contain the startx for the block
                                   mov   startx, ax                              ; startx has the right posit

                                   mov   cx,height
                                   add   cx,space
                                   mov   ax, yc
                                   mov   dx,0
                                   div   cx                                      ; xc of the ball
                                   mul   cx
                                   mov   starty, ax                              ; starty has the right posit

                                   ret
getDownBlockStarts endp


checkDownBlockColl proc
    ; down collision

                    mov cx, xc          ; left upper of ball
                    mov dx, yc     
                    sub dx, 1     
                    mov dummy, cx
                    mov bh, 0               ; page number
                    mov ah, 0DH             ; get background color into al
                    int 10h                 ; get 
                    cmp al, BackGroundColor ; if the current pixel color not same as the background loop till end of ball width                    
                    jz skipFirstDown

                    ; check for rock
                    cmp al, grey_block
                    mov lowerCollFlag, 1       
                    jz skipFirstDown
                    
                    ; if not grey
                    call getDownBlockStarts
                    call breakerLenPowerUp
                    
                    ; players score
                    cmp determineFlag, 0
                    jnz incPlayer2Down
                    push ax
                    mov ax, increamentPoints
                    add first_score, ax
                    pop ax
                    jmp contDownColl 
                    incPlayer2Down:
                    push ax
                    mov ax, increamentPoints
                    add sec_score, ax
                    pop ax
                    contDownColl:

                    call clearMyBlock  
                      mov checked,1        
                    mov lowerCollFlag, 1       

    ; for testing
                                   mov   ax, startx
                                   mov   bx, startY
    ;     call DrawPixel
                    
    skipFirstDown:                 
    ; check the end of the ball
                                   mov   cx, xc                                  ; left upper of ball
                                   add   cx, S
                                   mov   dummy, cx
                                   mov   dx, yc
                                   sub   dx, 1

                    mov bh, 0               ; page number
                    mov ah, 0DH             ; get background color into al
                    int 10h                 ; get 
                    cmp al, BackGroundColor ; if the current pixel color not same as the background loop till end of ball width                    
                    jz exitDownColl
                    ; check for rock
                    cmp al, grey_block
                    mov lowerCollFlag, 1
                    jz exitDownColl

                    call getDownBlockStarts
                    call breakerLenPowerUp
                    
                    ; players score
                    cmp determineFlag, 0
                    jnz incPlayer2DownLast
                    push ax
                    mov ax, increamentPoints
                    add first_score, ax
                    pop ax
                    jmp contDownCollLast 
                    incPlayer2DownLast:
                    push ax
                    mov ax, increamentPoints
                    add sec_score, ax
                    pop ax
                    contDownCollLast:

                    call clearMyBlock   
                    mov checked,1            
                    ;test
                    mov ax, startx
                    mov bx, startY
                  ;  call DrawPixel 

                                   mov   lowerCollFlag, 1
                    
    exitDownColl:                  
                
                                   cmp   lowerCollFlag, 1
                                jnZ   retLowerBlockLoop
                                   cmp   fire, 0    ; if 1 zero flag = 1
                                jnZ   retLowerBlockLoop

                                ;    jnz   retLowerBlockLoop
                                   mov   lowerCollFlag, 0
    ; NEG  Shiftx
                                   NEG   ShiftY

    retLowerBlockLoop:             
                                   ret
checkDownBlockColl endp


getUpperBlockStarts proc
                                   mov   ax, dummy                               ; xc of the ball
                                   mov   cx, mywidth                             ; block width
                                   add   cx, space                               ;div by block length and space in between => cx = 23 for our eg.
                                   mov   dx, 0
                                   div   cx                                      ;  AX = AX/CX and DX=AX % CX
                                   mul   cx                                      ; mul with the block width and space in between => now ax contain the startx for the block
                                   mov   startx, ax                              ; startx has the right posit


                                   mov   ax, yc                                  ; xc of the ball
                                   add   ax, S
                                   mov   cx,height
                                   add   cx,space
                                   mov   dx,0
                                   div   cx                                      ; xc of the ball
                                   mul   cx

                                   mov   starty, ax                              ; starty has the right posit

                                   ret
getUpperBlockStarts endp


checkUpperBlockColl proc
    ; upper collision
                    
                    mov cx, xc          ; left upper of ball
                    mov dx, yc     
                    add dx, S     
                    add dx, 1     
                    mov dummy, cx
                    mov bh, 0               ; page number
                    mov ah, 0DH             ; get background color into al
                    int 10h                 ; get 
                    cmp al, BackGroundColor ; if the current pixel color not same as the background loop till end of ball width                    
                    jz skipFirstUpper

                    cmp al, grey_block
                    mov upperCollFlag, 1       
                    jz skipFirstUpper

                    call getUpperBlockStarts
                    call breakerLenPowerUp

                    ; players score
                    cmp determineFlag, 0
                    jnz incPlayer2Upper
                    push ax
                    mov ax, increamentPoints
                    add first_score, ax
                    pop ax
                    jmp contUpperColl
                    incPlayer2Upper:
                    push ax
                    mov ax, increamentPoints
                    add sec_score, ax
                    pop ax
                    contUpperColl:

                    call clearMyBlock 
                    mov checked,1         
                    mov upperCollFlag, 1       

    ; for testing
                                   mov   ax, startx
                                   mov   bx, startY
    ;  call DrawPixel
                    
    skipFirstUpper:                
    ; check the end of the ball
                                   mov   cx, xc                                  ; left upper of ball
                                   add   cx, S
                                   mov   dummy, cx
                                   mov   dx, yc
                                   add   dx, 1
                                   add   dx, S

                                   mov   bh, 0                                   ; page number
                                   mov   ah, 0DH                                 ; get background color into al
                                   int   10h                                     ; get
                                   cmp   al, BackGroundColor                     ; if the current pixel color not same as the background loop till end of ball width
                                   jz    exitUpperColl
                    
                    cmp al, grey_block
                    mov upperCollFlag, 1
                    jz exitUpperColl

                    call getUpperBlockStarts
                    call breakerLenPowerUp
                    ; players score
                    cmp determineFlag, 0
                    jnz incPlayer2UpperLast
                    push ax
                    mov ax, increamentPoints
                    add first_score, ax
                    pop ax
                    jmp contUpperCollLast
                    incPlayer2UpperLast:
                    push ax
                    mov ax, increamentPoints
                    add sec_score, ax
                    pop ax
                    contUpperCollLast:

                    call clearMyBlock 
                    mov checked,1                
                    ;test
                    mov ax, startx
                    mov bx, startY
                ;    call DrawPixel 

                                   mov   upperCollFlag, 1
                    
    exitUpperColl:                 
                
                                   cmp   upperCollFlag, 1
                                   jnz   retUpperBlockLoop
                                cmp   fire, 0
                                jnZ   retUpperBlockLoop
                                   mov   upperCollFlag, 0
    ; NEG  Shiftx
                                   NEG   ShiftY

    retUpperBlockLoop:             
                                   ret

checkUpperBlockColl endp


getLeftBlockStarts proc
                                   mov   ax, xc                                  ; xc of the ball
                                   add   ax, S
                                   add   ax, 1
                                   mov   cx, mywidth
                                   add   cx, space
                                   mov   dx,0
                                   div   cx
                                   mul   cx
                                   mov   startx, ax                              ; startx has the right posit

                                   mov   ax, dummy                               ; xc of the ball
                                   mov   cx, height                              ; block width
                                   add   cx, space                               ;div by block length and space in between => cx = 10 for our eg.
                                   mov   dx, 0
                                   div   cx                                      ;  AX = AX/CX and DX=AX % CX
                                   mul   cx                                      ; mul with the block width and space in between => now ax contain the startx for the block
                                   mov   starty, ax                              ; startغ has the right posit

                                   ret
getLeftBlockStarts endp


checkLeftBlockColl proc
    ; left collision

                                   mov   cx, xc                                  ; left upper of ball
                                   mov   dx, yc
                                   add   cx, S
                                   add   cx, 1
                                   mov   dummy, dx

                                   mov   bh, 0                                   ; page number
                                   mov   ah, 0DH                                 ; get background color into al
                                   int   10h                                     ; get
                                   cmp   al, BackGroundColor                     ; if the current pixel color not same as the background loop till end of ball width
                                   jz    skipFirstLeft
                    
                    cmp al, grey_block
                    mov leftCollFlag, 1       
                    jz skipFirstLeft

                    call getLeftBlockStarts
                    call breakerLenPowerUp
                    ; players score
                    cmp determineFlag, 0
                    jnz incPlayer2Left
                    push ax
                    mov ax, increamentPoints
                    add first_score, ax
                    pop ax
                    jmp contLeftColl
                    incPlayer2Left:
                    push ax
                    mov ax, increamentPoints
                    add sec_score, ax
                    pop ax
                    contLeftColl:
                    
                    call clearMyBlock     
                    mov checked,1     
                    mov leftCollFlag, 1       

    ; for testing
                                   mov   ax, startx
                                   mov   bx, startY
    ;    call DrawPixel
                    
    skipFirstLeft:                 
    ; check the end of the ball
                                   mov   cx, xc                                  ; left upper of ball
                                   add   cx, S
                                   add   cx, 1
                                   mov   dx, yc
                                   add   dx, S
                                   mov   dummy,dx

                                   mov   bh, 0                                   ; page number
                                   mov   ah, 0DH                                 ; get background color into al
                                   int   10h                                     ; get
                                   cmp   al, BackGroundColor                     ; if the current pixel color not same as the background loop till end of ball width
                                   jz    exitLeftColl
                    
                    cmp al, grey_block
                    mov leftCollFlag, 1
                    jz exitLeftColl
                    
                    call getLeftBlockStarts
                    call breakerLenPowerUp
                    ; players score
                    cmp determineFlag, 0
                    jnz incPlayer2LeftLast
                    push ax
                    mov ax, increamentPoints
                    add first_score, ax
                    pop ax
                    jmp contLeftCollLast
                    incPlayer2LeftLast:
                    push ax
                    mov ax, increamentPoints
                    add sec_score, ax
                    pop ax
                    contLeftCollLast: 

                    call clearMyBlock
                        mov checked,1               
                    ;test
                    mov ax, startx
                    mov bx, startY
                ;    call DrawPixel 

                                   mov   leftCollFlag, 1
                    
    exitLeftColl:                  
                
                                ;    cmp   leftCollFlag, 1
                                ;    jnz   retLeftBlockLoop
                                ;    mov   leftCollFlag, 0
                                cmp   fire, 1 
                                jZ   retLeftBlockLoop
                                   NEG   Shiftx
    ; NEG  ShiftY
    retLeftBlockLoop:              
                                   ret
checkLeftBlockColl endp


getRightBlockStarts proc
                                   mov   ax, xc                                  ; xc of the ball
                                   mov   cx, mywidth
                                   add   cx,space
                                   mov   dx,0
                                   div   cx
                                   mul   cx
                                   mov   startx, ax                              ; startx has the right posit

                                   mov   ax, dummy                               ; xc of the ball
                                   mov   cx, height                              ; block width
                                   add   cx, space                               ;div by block length and space in between => cx = 10 for our eg.
                                   mov   dx, 0
                                   div   cx                                      ;  AX = AX/CX and DX=AX % CX
                                   mul   cx                                      ; mul with the block width and space in between => now ax contain the startx for the block
                                   mov   starty, ax                              ; starty has the right posit

                                   ret
getRightBlockStarts endp


checkRightBlockColl proc
    ; right collision
                                   mov   cx, xc
                                   mov   dx, yc
                                   sub   cx, 1
                                   mov   dummy, dx

                                   mov   bh, 0                                   ; page number
                                   mov   ah, 0DH                                 ; get background color into al
                                   int   10h                                     ; get
                                   cmp   al, BackGroundColor                     ; if the current pixel color not same as the background loop till end of ball width
                                   jz    skipFirstRight
                    
                    cmp al, grey_block
                    mov rightCollFlag, 1       
                    jz skipFirstRight

                    call getRightBlockStarts
                    call breakerLenPowerUp
                    ; players score
                    cmp determineFlag, 0
                    jnz incPlayer2Right
                    push ax
                    mov ax, increamentPoints
                    add first_score, ax
                    pop ax
                    jmp contRightColl
                    incPlayer2Right:
                    push ax
                    mov ax, increamentPoints
                    add sec_score, ax
                    pop ax
                    contRightColl:

                    ; for testing
                    mov ax, startx
                    mov bx, startY
                ;    call DrawPixel 
                    call clearMyBlock
                        mov checked,1        
                    mov rightCollFlag, 1       

                    
    skipFirstRight:                
    ; check the end of the ball
                                   mov   cx, xc                                  ; left upper of ball
                                   sub   cx, 1
                                   mov   dx, yc
                                   add   dx, S
                                   mov   dummy,dx

                                   mov   bh, 0                                   ; page number
                                   mov   ah, 0DH                                 ; get background color into al
                                   int   10h                                     ; get
                                   cmp   al, BackGroundColor                     ; if the current pixel color not same as the background loop till end of ball width
                                   jz    exitRightColl
                    
                    cmp al, grey_block
                    mov rightCollFlag, 1
                    jz exitRightColl
                    
                    call getRightBlockStarts
                    call breakerLenPowerUp
                    ; players score
                    cmp determineFlag, 0
                    jnz incPlayer2RightLast
                    push ax
                    mov ax, increamentPoints
                    add first_score, ax
                    pop ax
                    jmp contRightCollLast
                    incPlayer2RightLast:
                    push ax
                    mov ax, increamentPoints
                    add sec_score, ax
                    pop ax
                    contRightCollLast:
                    call clearMyBlock     
                    mov checked,1          
                    ;test
                    mov ax, startx
                    mov bx, startY
                ;    call DrawPixel 

                                   mov   rightCollFlag, 1
                    
    exitRightColl:                 
                
                                ;    cmp   rightCollFlag, 1
                                ;    jnz   retRightBlockLoop
                                ;    mov   rightCollFlag, 0
                                cmp   fire, 1
                                jZ   retRightBlockLoop
                                   NEG   Shiftx
    ; NEG  ShiftY
    retRightBlockLoop:             

                                   ret
checkRightBlockColl endp

bricksCollision             proc 
pusha
; mode 0, 1 => single  ------------- mode 2, 3 => multi 
                                call checkDownBlockColl
                                popa
                                cmp yc, 180
                                jge skipRight
                                cmp mode, 2
                                JL rightCollLabel
                                cmp yc, 20
                                JLE skipRight
                                rightCollLabel:
                                pusha
                                call checkUpperBlockColl
                                popa
                                skipUp:
                                mov ax, WindowWidth
                                sub ax, S
                                cmp ax, xc
                                jz skipLeft
                                pusha
                                call checkLeftBlockColl
                                popa
                                skipLeft:
                                cmp xc, 0
                                jz skipRight
                                pusha
                                call checkRightBlockColl
                                popa
                                skipRight:
                                ; collision part  => make proc
                            ret

bricksCollision endp
    ;==================================================================
breakerLenPowerUp           proc 

                    ; detect green color
                    mov cx, startX
                    mov dx, startY
                    inc cx
                    inc dx
                    mov bh, 0               ; page number
                    mov ah, 0DH             ; get background color into al
                    int 10h                 ; get 
                    cmp al, green_block ; if the current pixel color not same as the background loop till end of ball width
                    jnz nxtPowerUp
                    push ax
                    
                    MOV determineFlag ,0
                    mov greenFlag, 1
                    CALL setBreaker1
                    sub x, 20
                    add endx, 20
                    add lenght, 40
                    call draw_breaker
                    CALL setBreaker2
                    
                    pop ax                    
                    nxtPowerUp:
                    cmp al, orange_block
                    jnz exitBreakerPowerUp
                    mov   cx,0
                                   mov   dx,0
                   
    ;                                 d_c214:            
    ;                                mov   al,0                                  ;Pixel color
    ;                                mov   ah,0ch
                  
    ; d_c224:                         
    ;                                int   10h
    ;                                inc   cx
    ;                                cmp   cx,320
    ;                                jnz   d_c224
    ;                                inc   dx
    ;                                mov   cx,0
    ;                                cmp   dx,200
    ;                                jnz   d_c214
                    mov fire, 1
                    ; mov rightCollFlag, 0
                    ; mov leftCollFlag, 0
                    ; mov lowerCollFlag, 0
                    ; mov CollFlag, 0
                    
                    exitBreakerPowerUp:
                    ret

breakerLenPowerUp           endp 
clrbreaker_shift proc

          
                                   mov   color,0
       
                                   mov   dx,starty                               ;set start height
                                   dec   dx
                                   mov   cx,startx                               ;set start width
      
    ;set end width
           
                                   mov   bx,startx
                                   add   bx,breakersmothness
                                   mov   end_x,bx

    ; set end height
           
                                   mov   bx,starty
                                   add   bx,Bidth
                                   mov   end_y,bx

    clr_block:                     
                                   inc   dx
                                   mov   cx,startx
                                   dec   cx
                                   mov   al,color
                                   mov   ah,0ch
    clr_line:                      
                                   int   10h
                                   inc   cx
                                   cmp   cx,end_x
                                   jnz   clr_line
                                   cmp   dx,end_y                                ;there was a hight greater than the hight so i changed the number
                                   jnz   clr_block
                                   ret
clrbreaker_shift endp
    ;===================================================================

END MAIN