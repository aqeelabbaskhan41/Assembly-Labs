INCLUDE Irvine32.inc
.data
    smaller byte "The smaller number present in the array is: ",0
    greater byte "The greater number present in the array is: ",0
    Array byte 3,6,1,10,0,4,9,2,8,7
    temp byte ?
.code
    main proc
        call checkSmaller
        call checkGreater
        exit
    main endp

    checkSmaller proc
        mov edx, OFFSET Array
        mov ecx, LENGTHOF Array
        movzx eax, byte ptr [edx]  ; Initialize eax to the first element (zero-extended)
        inc edx
        dec ecx                    ; Decrement ecx because we already considered the first element

    L1:
        movzx ebx, byte ptr [edx]  ; Load the next element into ebx (zero-extended)
        cmp eax, ebx
        jbe Next                   ; If eax <= ebx, skip updating eax
        mov eax, ebx               ; Update eax if ebx < eax
    Next:
        inc edx
        loop L1

        mov temp, al
        mov edx, OFFSET smaller
        call writestring
        movzx eax, temp
        call writedec
        call crlf
        ret
    checkSmaller endp

    checkGreater proc
        mov edx, OFFSET Array
        mov ecx, LENGTHOF Array
        movzx eax, byte ptr [edx]  ; Initialize eax to the first element (zero-extended)
        inc edx
        dec ecx                    ; Decrement ecx because we already considered the first element

    L2:
        movzx ebx, byte ptr [edx]  ; Load the next element into ebx (zero-extended)
        cmp eax, ebx
        jae Next2                  ; If eax >= ebx, skip updating eax
        mov eax, ebx               ; Update eax if ebx > eax
    Next2:
        inc edx
        loop L2

        mov temp, al
        mov edx, OFFSET greater
        call writestring
        movzx eax, temp
        call writedec
        call crlf
        ret
    checkGreater endp
END main