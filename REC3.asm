.MODEL small
.STACK 100h
.data
value db ?, "$"
messsage DB 'reciever on , press esc to end session', 0AH, 0DH, "$"
messsage2 DB 'Enter your string', 0AH, 0DH, "$"
messsage3 DB 'good by then', 0AH, 0DH, "$"
messege_send db 'to send ',0ah,0dh,"$"

sendx db 0
sendy db 0bh
recx db 0
recy db 1
InDATA db 30,?,30 dup('$') 
emptystr db 10,13,'$'
page1 db 0
.code


Main proc
    mov ax, @data
    mov ds, ax

mov ax,0600h
 mov bh,07 
mov cx,0 
mov dx,184FH
 int 10h

mov bh,0
 mov ah,2
 mov dx,0000h
 int 10h

    mov ah, 09 
    mov dx, offset messsage
    int 21h




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

    ;Set port configuration
    mov dx,3fbh
    mov al,00011011b
    out dx,al




    

    ;Check that Data Ready from UART
    CHK:    mov dx , 3FDH		; Line Status Register
    	    in al , dx 
            AND al , 1
            
            JZ CHKINCHAR     ; if there is not char in uart go check for key pressed

    ;If Ready read the VALUE in Receive data register
            mov dx , 03F8H
            in al , dx 
            mov VALUE , al                              ;??????????????????????????????????????????????????

           ; mov ah, 09 
            ;mov dx, offset value
           ; int 21h
   ;set curser 
            mov dh,recy
            mov dl,recx 
            ; move curser
            mov bh,0
            mov ah,2
            int 10h

;print byte 
           mov ah,9          ;Display
           mov bh,0         ;Page 0
           mov al,value        ;Letter D
           mov cx,1         ;1 times
           mov bl,05h ;purple (5) on white(F) background
           int 10h




    ;======================get curser postition here its recx and recy

mov dh,recy
mov dl,recx
 cmp dl,79
 jz endofliner
 inc dl
 mov recx,dl
 cmp dh,9
 jz endofpager
 jmp contr

endofliner:
mov dl,0
mov recx,dl
inc dh
mov recy,dh
jmp contr
endofpager:
;mov al,page1
;inc al
;mov page1 ,al
; clear part of rec
mov ax,0601h
mov bh,07 
mov ch,01
mov cl,0
mov dh,9    ;
mov dl,79
int 10h
mov dh,8        ;
mov dl,0d
mov recy,dh
mov recx,dl
jmp contr


contr:
mov bh,0
 mov ah,2
 int 10h



CHKINCHAR:

mov bh,0
mov ah,2
mov dx,0a0ah
int 10h

   
 

 

  

getkey_pressed:
            mov ah,01h 
            int 16h 
            jnz cont44   ; check if key is pressed if not go recive
            jmp CHK
             cont44:
            mov ah,0
            Int 16h
            mov value,al
            cmp al,27
            jz exit
            ;set curser 
            mov dh,sendy
            mov dl,sendx 
            ; move curser
            mov bh,0
            mov ah,2
            int 10h
 
 ;print byte 
mov ah,9          ;Display
 mov bh,0         ;Page 0
 mov al,value        ;Letter D
 mov cx,1         ;1 times
 mov bl,03h ;Green (A) on white(F) background
 int 10h
    ;======================get curser postition here it is stored in sendx and sendy



 ;============ 
 cmp dl,79
 jz endofline
 inc dl
 mov sendx,dl
 cmp dh,24
 jz endofpage
 jmp cont

endofline:
mov dl,0
mov sendx,dl
inc dh
mov sendy,dh
jmp cont
endofpage:

mov ax,0601h
mov bh,07 
mov ch,11
mov cl,0
mov dh,24
mov dl,79
int 10h
mov dh,23d
mov dl,0

mov sendx,dl
mov sendy,dh

jmp cont

cont:
mov bh,0
mov ah,2
int 10h

;Set port configuration
    mov dx,3fbh
    mov al,00011011b
    out dx,al

    ;===================
       AGAIN: ;Check that Transmitter Holding Register is Empty
            mov dx , 3FDH	; Line Status Register 
            In al , dx 			;Read Line Status
            AND al , 00100000b
            Jnz cont12
                     jmp CHK
                     cont12:
                               ;If empty put the VALUE in Transmit data ;register
            mov dx , 3F8H		; Transmit data register
            mov al,value
            out dx , al 
           
    jmp getkey_pressed

       
                    
                

exit:

    mov ah, 4ch
    int 21h 

Main endp
end