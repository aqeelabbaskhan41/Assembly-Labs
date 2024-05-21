INCLUDE irvine32.inc
.stack 100h

.data
array DWORD 10 DUP(?)         ; Define an array of 10 DWORDs
prompt1 BYTE "Enter first value of Fibonacci: ", 0
prompt2 BYTE "Enter second value of Fibonacci: ", 0

.code
Main Proc
    call input               ; Calling the input procedure to input two values
    call fabnoci             ;; Calling the fabnoci function to calculate the fabnoci

    Exit
    
Main endp

input Proc
    mov esi, OFFSET array
    ; First input
    mov edx, OFFSET prompt1  
    call WriteString         
    call ReadInt            
    mov [esi], eax           

    ; Second input
    mov edx, OFFSET prompt2 
    call WriteString         
    call ReadInt
    add esi, 4
    mov [esi], eax           ; Storing value on 2nd index (4 bytes offset for DWORD)

    ; Displaying the stored values 
    mov esi, OFFSET array
    mov eax, [esi]        
    call WriteInt          
    call dumpregs
    call Crlf    
    add esi, 4
    mov eax, [esi] 
    call WriteInt           
    call dumpregs
    call Crlf               

    ret
input endp

fabnoci Proc
    mov ecx, 8                   ; Loop counter for remaining 8 numbers of fabnoci
    mov esi, OFFSET array
    add esi, 4                
    
loop1:
    ; Calculating fabnoci
    mov eax, [esi]               ; moving value of current into eax 
    mov ebx, [esi-4]             ; moving value of previous into eax 
    add eax, ebx                 ; adding eax and ebx

    add esi, 4
    mov [esi], eax               ; Storing the result into array  
    loop loop1                   

    mov ecx, 10                  ;setting loop counter for Displaying
    mov esi, OFFSET array
loop2:
    mov eax, [esi]
    call WriteInt
    call Crlf
    add esi, 4
    loop loop2

    ret
    
fabnoci endp
End Main

