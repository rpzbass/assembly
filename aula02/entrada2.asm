segment .data
    LF         equ 0xA ; line feed
    NULL       equ 0xD ; final de string ou final da cadeia de caractere
    SYS_CALL   equ 0x80 ; gera uma interrução ou seja envia ao informação ao so
    SYS_EXIT   equ 0x1 ; codigo de chamada para finalizar
    RET_EXIT   equ 0x0 ; Operacao realizada com sucesso retorno para o sistema operacional
    SYS_READ   equ 0x3 ; operacao de leitura
    SYS_WRITE  equ 0x4 ; operacao de escrita
    STD_IN     equ 0x0 ; entrada padrao
    STD_OUT    equ 0x1 ; saida padrao


section .data
    msg db "valores iguais", LF, NULL
    tam equ  $- msg
    x dd 5

section .bss
    num resb 2  ; resb fala que reserve 1 byte para a variavel nome

section .text

global _start

_start:


    ;mov EAX, SYS_WRITE
    ;mov EBX, STD_OUT
    ;mov ECX, msg
    ;mov EDX, tam
    ;int SYS_CALL

    mov EAX, SYS_READ
    mov EBX, STD_IN
    mov ECX, num
    mov EDX, 2
    int SYS_CALL

    mov EAX, [x]
    cmp EAX, EBX

    je igual
    jmp final

igual:
    MOV ECX,msg
    MOV EDX,tam


final:

    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, RET_EXIT
    int SYS_CALL





