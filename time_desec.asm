global _main

section .text

_main: 
   mov eax, 13 
   mov ebx, 0
   int 0x80

   mov ebx, 0
   mov eax, 1
   int 0x80



