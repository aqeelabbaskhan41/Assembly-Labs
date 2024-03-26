INCLUDE c:\Users\This PC\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc

.data
    var1 DWORD 5h
    var2 DWORD 6h
    var3 DWORD 2h
    result DWORD ?

.code
main PROC
    
    ; given expression 5+(6-2) 
    mov eax, var2	; moving value of var2 into eax
    sub eax, var3	; substracting value of var3 from eax
    mov ebx, var1
    add eax, ebx	; adding value of var1 into eax
    mov result, eax	; storing the result of expression into result variable
    
    call DumpRegs	; displaying the result
    exit
main ENDP
END main
