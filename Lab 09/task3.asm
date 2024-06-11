include Irvine32.inc

.data

.code
main PROC


    mov eax, 13    
    mov ebx, eax   
    mov ecx, 21    

    shl ebx, 4     
    add eax, ebx   

    shl ebx, 2     
    add eax, ebx   

    add eax, ecx   

    call DumpRegs

exit
main ENDP
END main