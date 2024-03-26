INCLUDE c:\Users\This PC\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc

.data
    var1 BYTE 20h
    var2 BYTE 30h
    
.code
main PROC

    mov al, var1        ; moving content of var1 into al
    mov bl, var2        ; moving content of var2 into bl
    movzx eax, var1     ; moving value of var1 into eax for display
    movzx ebx, var2     ; moving value of var2 into ebx for display
    call DumpRegs       ; displaying values before swapping

    ; Swapping
    mov var1, bl	;moving value of bl into var1 for swaping
    mov var2, al	;moving value of al into var2 for swaping

    movzx eax, var1     ; moving value of var1 into eax for display
    movzx ebx, var2     ; moving value of var2 into ebx for display
    call DumpRegs       ; displaying values after swapping

    exit
main ENDP
END main

