include Irvine32.inc

.data

.code
main PROC
    ; 1. right shift (shr) by 1 bit
    mov al, 0D4h 
    call crlf 
    call writebin    
    shr al, 1 
    call crlf 
    call writebin             
    call Crlf         

    ; 2. Arithmetic right shift (sar) by 1 bit
    mov al, 0D4h 
    call crlf 
    call writebin     
    sar al, 1 
    call Crlf        
    call Writebin     
    call Crlf        

    ; 3. Arithmetic right shift (sar) by 4 bits
    mov al, 0D4h 
    call crlf 
    call writebin 
    call Crlf   
    sar al, 4        
    call Writebin    
    call Crlf       

    ; 4. Rotate left (rol) by 4 bits
    mov al, 0D4h
    call crlf 
    call writebin      
    rol al, 4 
    call Crlf        
    call Writebin    
    call Crlf         

    ; 5. Rotate right (ror) by 4 bits
    mov al, 0D4h
    call crlf 
    call writebin      
    ror al, 4 
    call Crlf        
    call Writebin     
    call Crlf         

    exit
main ENDP
END main

