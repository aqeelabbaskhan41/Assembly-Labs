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

    
    ;printing TEXTEQU character by character
    mov al, 'H'            ; loading 'H' into al
    call writechar         ; printing 'H'
    mov al, 'i'            ; loading 'i' into al
    call writechar         ; printing 'i'
    mov al, ','            ; loading ',' into al
    call writechar         ; printing ','
    mov al, ' '            ; loading ' ' into al
    call writechar         ; printing ' '
    mov al, 'T'            ; loading 'T' into al
    call writechar         ; printing 'T'
    mov al, 'h'            ; loading 'h' into al
    call writechar         ; printing 'h'
    mov al, 'a'            ; loading 'a' into al
    call writechar         ; printing 'a'
    mov al, 'n'            ; loading 'n' into al
    call writechar         ; printing 'n'
    mov al, 'k'            ; loading 'k' into al
    call writechar         ; printing 'k'
    mov al, 's'            ; loading 's' into al
    call writechar         ; printing 's'
    mov al, '.'            ; loading '.' into al
    call writechar         ; printing '.'
    call crlf           

    call dumpregs        ; Display all registers
    exit                 ; Exit the program
main ENDP
END main