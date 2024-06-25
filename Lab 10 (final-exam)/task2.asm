; Irvine32 library
include Irvine32.inc

.data
prompt      BYTE "Enter the value of n to calculate factorial (-1 to quit): ", 0
overflowMsg BYTE "Error: Calculated value can not fits into 32bits.", 0
input       DWORD ?
factorial   DWORD ?
temp        DWORD ?

.code
main PROC
    ; Infinite loop to handle continuous input
    mainLoop:
        ; Display the prompt
        mov edx, OFFSET prompt
        call WriteString

        ; Read integer input
        call ReadInt
        mov input, eax

        ; Check if the input is -1
        cmp eax, -1
        je exitLoop

        ; Initialize factorial calculation
        mov ecx, eax        ; setting loop for the given input 
        mov eax, 1          ; EAX = 1 (initial factorial value)
        mov edi, 1          ; EDI = 1 (multiplier)

    calcLoop:
        cmp edi, ecx
        jg endCalc          ; If edi > ecx theb end the calculation bcz factorial is done

        ; Multiply EAX by EDI and check for overflow
        imul eax, edi
        jo overflow         ; jump to overflow if overflow is occurred

        inc edi             ; incrementing the multiplier
        jmp calcLoop        ; Repeat the loop

    endCalc:
        ;storing result into my factorial variable
        mov factorial, eax

        ; displaying the result
        call crlf
        mov eax, factorial
        call Writedec

        call crlf
        jmp mainLoop        ; After overflow getting new input

    overflow:
        ; displaying overflow error message
        call crlf
        mov edx, OFFSET overflowMsg
        call WriteString
        call crlf
    
        jmp mainLoop        ; repeating the main loop for getting new input

    exitLoop:
        exit
main ENDP
END main