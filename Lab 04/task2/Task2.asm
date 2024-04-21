include irvine32.inc
.data
    message Byte "1. The sums of the arrays are shown in the registers EAX and EBX:", 0

    array1 Word 2h,3h,4h,5h     ;first array with four values
    array2 Word 3h,4h,5h,6h     ;second array with four values
    array3 Word 4 Dup(?)        ;declaring array of size 4 
    

.code
main proc

;Sum of array1: 
    Mov esi, offset array1  

    Mov ecx, 3      ;giving loop size
    Mov ax, [esi]
    loop1:          ;giving label to loop
    add esi,2
    add ax, [esi]
    loop loop1      ;loop

;displaying result 1:
    mov edx,offset message 
    call writestring
    Movzx eax, ax     ; Store sum of array1 in EAX
    call dumpregs    ; Display register values

    
;Sum of array2:
    Mov esi, offset array2 
    Mov ecx,3 ; Store sum of array
     

    Mov bx, [esi]
    loop2:          ;giving label to loop
    add esi,2
    add bx, [esi]
    loop loop2      ;loop
   
;displaying result 2
    mov edx,offset message 
    call writestring
    Movzx ebx, bx     ; Store sum of array1 in EBX
    call dumpregs    ; Display register values

    exit 
main ENDP

end main
