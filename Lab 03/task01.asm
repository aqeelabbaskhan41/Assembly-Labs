include irvine32.inc

.data
mbyte BYTE 05, 12, 100
Align 2
mword WORD 50h, 60h
mdouble DWORD 0A0908070h
greetings BYTE "Hi There", 0
Response TEXTEQU <'Hi, Thanks.'>

.code
main PROC

    mov ah, mbyte        ; loading byte 1 into ah 
    mov al, mbyte + 1    ; loading byte 2 into al
    
    ;displaying the output of AH into different formats 
    movzx eax, ah        ; moving AH into EAX for display
    call writehex        ; displaying in hexadecimal format
    call crlf            
    call writeint        ; displaying as integer
    call crlf            
    call writechar       ; displaying  as character
    call crlf           
    call writebin        ; displaying in binary
    call crlf     

    ;displaying the output of AL into different formats 
    ;movzx eax, al        ; moving AL into EAX for display
    ;call writehex        ; displaying in hexadecimal format
    ;call crlf            
    ;call writeint        ; displaying as integer
    ;call crlf            
    ;call writechar       ; displaying  as character
    ;call crlf           
    ;call writebin        ; displaying in binary
    ;call crlf            
    
    call dumpregs        
    exit                 
main ENDP
END main