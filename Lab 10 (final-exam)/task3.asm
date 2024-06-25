include Irvine32.inc

.data
prompt      BYTE "Enter time in seconds: ", 0
hoursprompt    BYTE "Hours: ", 0
minutesprompt  BYTE "Minutes: ", 0
secondsprompt  BYTE "Seconds: ", 0

input       DWORD ?
hours       DWORD ?
minutes     DWORD ?
seconds     DWORD ?

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString

    ; getting integer input
    call ReadInt
    mov input, eax

    ; calculating hours
    mov eax, input
    mov ecx, 3600           ; 3600 seconds in an hour
    xor edx, edx            
    div ecx                 ; EAX = total hours, EDX = remaining seconds
    mov hours, eax          ; storing hours
    mov eax, edx            ; moving remaining seconds to EAX

    ; Calculate minutes
    mov ecx, 60             ; 60 seconds in a minute
    xor edx, edx            
    div ecx                 ; EAX = total minutes, EDX = remaining seconds
    mov minutes, eax        ; storing minutes
    mov seconds, edx        ; storing remaining seconds

    ; Display hours
    mov edx, OFFSET hoursprompt
    call WriteString
    mov eax, hours
    call WriteDec
    call Crlf

    ; Display minutes
    mov edx, OFFSET minutesprompt
    call WriteString
    mov eax, minutes
    call WriteDec
    call Crlf

    ; Display seconds
    mov edx, OFFSET secondsprompt
    call WriteString
    mov eax, seconds
    call WriteDec
    call Crlf

    exit
main ENDP
END main