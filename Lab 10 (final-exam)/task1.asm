; Irvine32 library
include Irvine32.inc

.data
var1 dword 11
var2 dword -4
var3 dword 3
var4 dword ?
temp dword ?
.code
main PROC

    mov eax, var1
    mov ebx, -5
    imul ebx    ; eax = var1 * -5

    ; saving result of var1 * -5 in temp
    mov temp, eax

    ; loading var2 into EAX
    mov eax, var2

    ; negating the var2 to -var2
    neg eax     ; eax = -var2 

    ; loading var3 into ecx
    mov ecx, var3

    ; calculating -var2 % var3
    cdq         ; sign extend eax into edx:eax
    idiv ecx    ; eax = quotient = 1, edx = remainder = 1

    ; moving the result of var1 * -5 to eax
    
    mov ebx, temp
    mov ecx, eax
    mov eax, ebx

    ; dividing (var1 * -5) by (-var2 % var3)
    cdq         ; sign extend ecx into edx:ecx
    idiv ecx    ; eax = quotient 

    ; storing the result in var4
    mov var4, eax

    ; Display the result
    call WriteInt
    exit
main ENDP
END main