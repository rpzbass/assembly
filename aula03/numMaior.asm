segment .data
	LF        equ  0xA
        NULL      equ  0xD
        SYS_CALL  equ  0x80
         ;EAX
        SYS_EXIT  equ  0x1
        SYS_READ  equ  0x3
        SYS_WRITE equ  0x4
         ;EBX
        RET_EXIT  equ  0x0
        STD_IN    equ  0x0
        STD_OUT   equ  0x1 


section .data
     x dd 50   ; define x como double word
     y dd 10   ; define y como double word
     msg1 db 'X maior que Y',LF,NULL
     tam1 equ $ - msg1
     msg2 db 'Y maior que X',LF,NULL
     tam2 equ $ - msg2



section .text
    mov EAX, DWORD[x]
    mov EBX, DWORD[y]

    cmp EAX, EBX 
    ;je =  jg >  Jge >= jl < jle <= jne !=
    jge maior

    ;jmp  equivalente ao go to 
maior:


final:

global _start 


_start:
