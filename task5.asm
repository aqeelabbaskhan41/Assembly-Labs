include irvine32.inc 
.data
    quotient dword ?
    remainder dword ?
.code 
main proc
    mov eax, (-10/3)    ;-3
    mov quotient, eax
    mov ebx, (10 mod 3)*-1  ;-1
    mov remainder, ebx

    call dumpregs
    exit
main endp
end main
