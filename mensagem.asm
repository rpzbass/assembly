global _start

section .data

    msg db "Ola mundo",10
    len equ $ - msg

section .text

_start:
   mov eax, 4  ;chamada de escrita de sistema
   mov ebx, 1  ;file descritor  stdout (terminal)
   mov ecx, msg ;endereço da mensagem
   mov edx, len ;tamanho da mensagem
   int 0x80 ; chama kernel

   mov eax, 1  ; syscall exit
   mov ebx, 0  ; codigo de saida
   int 0x80 ;

