TITLE defining variables
;just using variables
Include irvine32.inc
.stack 100h

.data
mbyte BYTE 05,65,81
Sum DWORD ?

.code
Main Proc
Movzx eax,mByte			
movzx ebx,mByte+1
movzx ecx,mByte+2
call mySum                     ;cal  procedure
mov edx,sum
call dumpregs
Exit
Main endp

mySum Proc                  ;    mySum procedure
PUSHAD                    ; Push  all data  registers  on stack
add eax,ebx
add eax,ecx
mov sum,eax
call dumpregs
POPAD                        ; pop all data registers
RET
mySum endp

End main

