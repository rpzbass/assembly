segment .data
    LF         equ 0xA
    SYS_CALL   equ 0x80
    SYS_EXIT   equ 0x1
    RET_EXIT   equ 0x0
    SYS_READ   equ 0x3
    SYS_WRITE  equ 0x4
    STD_IN     equ 0x0
    STD_OUT    equ 0x1

section .data
    msg db "Valores iguais", LF
    tam equ $ - msg

    x dd 5          ; vamos comparar com o número 5

section .bss
    num resb 2      ; 1 dígito + ENTER

section .text
global _start

_start:

    ;==========================
    ; Leitura do teclado
    ;==========================
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, num
    mov edx, 2
    int SYS_CALL

    ;==========================
    ; Converte ASCII para inteiro
    ;==========================
    ;movzx ebx, byte [num]   ; lê o primeiro caractere
    ;sub ebx, '0'            ; '5' -> 5

    ;==========================
    ; Compara com x
    ;==========================
    mov eax, [x]

    cmp eax, ebx
    jge igual
    jmp final

igual:
    mov ecx, msg
    mov edx, tam


final:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    int SYS_CALL


    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
