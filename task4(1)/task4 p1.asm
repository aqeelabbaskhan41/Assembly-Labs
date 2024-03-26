INCLUDE Irvine32.inc

.data
    var1 DWORD 5h
    var2 DWORD 6h
    var3 DWORD 2h
    result DWORD ?

.code
main PROC
    
    ; given expression 5+(6-2) 
    mov eax, var2	; moving value of var2 into eax
    sub eax, var3	; subtracting value of var3 from eax
    add eax, var1	; adding value of var1 into eax
    mov result, eax	; storing the result of expression into result variable
    
    call DumpRegs	; displaying the result
    exit
main ENDP
END main
