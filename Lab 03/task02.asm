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

    mov eax, LENGTHOF greetings    ; getting length of greetings
    call writedec                  ; length in decimal
    call crlf                      
    mov eax, SIZEOF greetings      ; getting the size of the string
    call writedec                  
    call crlf                     

    mov edx, OFFSET greetings      ; loading address of greetings into edx
    call writestring               ; printing the string
    call crlf                              

    call dumpregs        
    exit                 
main ENDP
END main