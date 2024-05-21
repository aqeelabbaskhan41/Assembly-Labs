Include irvine32.inc
.stack 100h

.data
val1 dword 5h
val2 dword 10h

.code
Main Proc
    call Swap
            
Exit
Main endp

Swap Proc
    mov eax,val1
    push eax
    mov ebx,val2
    push ebx
    call dumpregs
    pop eax
    mov val1,eax
    pop ebx
    mov val2, ebx
    call dumpregs
    ret
Swap endp
End main

