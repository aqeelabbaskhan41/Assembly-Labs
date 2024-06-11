include Irvine32.inc

.data
prompt BYTE "Enter a 32-bit hexadecimal number: ", 0
userInput DWORD ?
countOnes DWORD 0

.code

main PROC
    ; Prompt the user for input
    mov edx, offset prompt
    call WriteString
    
    ; Input a 32-bit hexadecimal number from the user
    call ReadHex
    mov userInput, eax
    
    ; Call the Count procedure
    mov eax, userInput
    call Count
    mov countOnes, eax
    
    ; Display the result
    mov eax, countOnes
    call Writehex
    call Crlf
    
    exit
main ENDP


Count PROC
    
    ; Initializing the count of ones to 0
    mov ecx, 0
    
    ; Iterate through each bit in the least significant byte (AL)
    mov ebx, eax
    and ebx, 0FFh
    
CountLoop:
    ; Shifting 
    shl ebx, 1
    
    ; Checking the Carry Flag (CF) to see if the least significant bit was 1
    jnc SkipIncrement
    inc ecx
    
SkipIncrement:
    ; Check if  processed all 8 bits in the least significant byte
    cmp ebx, 0
    jne CountLoop
    
    ; Moving count of in EAX register
    mov eax, ecx
    ret
Count ENDP

END main