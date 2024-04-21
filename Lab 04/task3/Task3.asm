include irvine32.inc

.data
    message Byte "2. The sums of the elements of the arrays are shown below:", 0

    array1 Word 2h, 3h, 4h, 5h     ; first array with four values
    array2 Word 3h, 4h, 5h, 6h     ; second array with four values
    array3 Word 4 Dup(0h)           ; array of size 4 to store sums

.code
main proc
    Mov esi, offset array1    ; point to the start of array1
    Mov edi, offset array2    ; point to the start of array2
    Mov ebx, offset array3    ; point to the start of array3

    Mov ecx, 4                ; loop size 

    loop1:
        mov ax, [esi]         ; load element from array1
        add ax, [edi]         ; add corresponding element from array2
        mov [ebx], ax         ; store the sum in array3 at current index
        add esi, 2            ; move to the next element in array1
        add edi, 2            ; move to the next element in array2
        add ebx, 2            ; move to the next element in array3
        loop loop1            ; loop 

; Displaying the sums stored in array3:
    Mov ecx, 4               ; setting loop counter for displaying array3
    mov esi, offset array3   ; point to the start of array3 for display

    display_loop:
        mov eax,  [esi] ; load the sum from array3
        mov edx, offset message  ; display message before results
        call writestring
        call dumpregs              ; display the sum stored in EAX
        add esi, 2                 ; move to the next element in array3
        loop display_loop
    exit
main ENDP

end main