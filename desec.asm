global _main

section .data

  my: db 'Eu sei assembly',0xa

section .text

_main:
   mov eax, 4
   mov ebx, 1
   mov ecx, my
   mov edx, 16
   int 0x80

   mov eax, 1
   mov ebx, 0
   int 0x80


