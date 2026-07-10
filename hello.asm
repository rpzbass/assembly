
section .data

        msg: db 'Hello Word!',0xa
        b1: db 'ola mundo',0xa
        b2: db 'ola mundo',0xa
        tam equ $ - msg
        b3: db 'ola mundo',0xa
        

section .text

global _start

_start:
        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, msg
        mov edx, 0x10
	int 0x80

	mov eax, 0x1
        mov ebx, 0x0
        int 0x80




