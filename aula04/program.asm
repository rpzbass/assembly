%include 'biblioteca.inc'

section .text

global _start

_start:
   lea   esi, [BUFFER] ; lea vai no buffer calcula  endereço efetivo do buffer atribui ao esi
   add   esi, 0x9 ; inicia  esi  com tab
   mov   byte[esi], 0xA ; mov line feed ou quebra de linha para  byte de esi
   
   
   dec   esi ; recua uma posição ou decrementa 
   mov   dl, 0x12 ; mov 0x11 para dl
   add   dl, '0' ; soma caractere '0' que corresponde a 0x30 par dl tornando o caractere A
   mov  [esi], dl ; mov A para o endereço


   dec   esi ; recua uma posição ou decrementa 
   mov   dl, 0x11 ; mov 0x11 para dl
   add   dl, 0x30 ; soma caractere '0' que corresponde a 0x30 par dl tornando o caractere A
   mov  [esi], dl ; mov A para o endereço

   call saidaResultado

   mov eax, SYS_EXIT
   mov ebx, RET_EXIT
   int SYS_CALL
