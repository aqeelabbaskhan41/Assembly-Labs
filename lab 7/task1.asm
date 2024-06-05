include irvine32.inc
.data
    stringname DWORD 50 DUP(?)
    counter2 dword ?
    firstNamePrompt BYTE "Enter the first name: ", 0
    lastNamePrompt BYTE "Enter the last name: ", 0

.code
    

    Main Proc
        call NameInput
        exit
    Main endp

NameInput Proc
    ; First name input
    mov edx, OFFSET firstNamePrompt
    call WriteString
    mov esi, OFFSET stringname
    mov ecx, SIZEOF stringname ; Set the buffer size
    call ReadString
    mov counter2, eax

    ; Last name input
    add esi, TYPE stringname
    mov edx, OFFSET lastNamePrompt
    call WriteString
    mov ecx, SIZEOF stringname ; Set the buffer size
    call ReadString
    mov [esi], eax

    ; Display full name
    mov edx, OFFSET stringname
    call WriteString
    call crlf

    ret
NameInput endp

end Main