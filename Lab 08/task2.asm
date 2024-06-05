INCLUDE Irvine32.inc

.data
    prompt byte "Enter your marks between 0 and 100 (-1 to exit): ", 0
    errorMsg byte "Error: Mark must be between 0 and 100.", 0
    header byte    "----Program Output----", 0
    subHeader byte "Grade      |      Marks", 0
    separator byte "----------------------", 0
    gradeA byte "A", 0
    gradeB byte "B", 0
    gradeC byte "C", 0
    gradeD byte "D", 0
    gradeF byte "F", 0
    marks DWORD 50 DUP(0)  ; Array to hold up to 50 marks
    markCount DWORD 0       ; Counter for the number of input marks

.code
main proc
    call collectMarks
    call displayAllGrades
    exit
main endp

collectMarks proc
    mov ecx, 0  ; Initialize mark counter with zero to count total inputs
    mov esi, OFFSET marks
inputLoop:
    mov edx, OFFSET prompt
    call writestring
    call readint
    cmp eax, -1
    je endInputLoop

    ; Store the input mark in the marks array
    mov ebx, eax
    call checkRange

    ; If the mark is valid, store it in the array
    cmp eax, 1
    je inputLoop
    mov [esi], ebx
    add esi,4
    inc ecx
    jmp inputLoop

endInputLoop:
    mov markCount, ecx
    ret
collectMarks endp

checkRange proc
    cmp ebx, 0
    jl outOfRange
    cmp ebx, 100
    jg outOfRange
    mov eax, 0
    ret
outOfRange:
    mov edx, OFFSET errorMsg
    call writestring
    call crlf
    mov eax, 1
    ret
checkRange endp

;----------------------Checking and displaying grades-------------------

displayAllGrades proc
    mov edx, OFFSET header
    call writestring
    call crlf
    mov edx, OFFSET subHeader
    call writestring
    call crlf
    mov edx, OFFSET separator
    call writestring
    call crlf

    mov ecx, markCount
    mov esi, OFFSET marks

displayLoop:
    cmp ecx, 0
    je endDisplayLoop

    ; Load the next mark from the array
    mov eax, [esi]
    call displayGrade

    ; Display the mark
    mov edx, OFFSET separator
    call writestring
    call crlf

    ; Move to the next mark
    add esi, 4
    dec ecx
    jmp displayLoop

endDisplayLoop:
    ret
displayAllGrades endp

displayGrade proc
    cmp eax, 90
    jae gradeA_label
    cmp eax, 80
    jae gradeB_label
    cmp eax, 70
    jae gradeC_label
    cmp eax, 60
    jae gradeD_label
    jmp gradeF_label

gradeA_label:
    mov edx, OFFSET gradeA
    jmp display

gradeB_label:
    mov edx, OFFSET gradeB
    jmp display

gradeC_label:
    mov edx, OFFSET gradeC
    jmp display

gradeD_label:
    mov edx, OFFSET gradeD
    jmp display

gradeF_label:
    mov edx, OFFSET gradeF

display:
    call writestring
    mov edx, OFFSET separator
    call writestring
    call crlf

    ; Display mark
    mov eax, [esi]
    call writedec
    call crlf
    ret
displayGrade endp
END main