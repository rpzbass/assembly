segment .data

	LF  	    equ   0xA ; Line feed ou proxima linha
	NULL 	    equ   0xD ; Aponta para final da string
	SYS_EXIT    equ   0x1 ; Efetua call de finalização do programa
	RET_EXIT    equ   0x0 ; Retorna 0 para sistema indicando processo concluido com exito
	STD_IN 	    equ   0x0 ; Sinaliza entrada de dados no terminal
	STD_OUT     equ   0x1 ; Sinaliza saida de dados no descritor terminal
	SYS_READ    equ   0x3 ; Efetua call de leitura de dados
	SYS_WRITE   equ   0x4 ; Efetua call de escrita de dados
	SYS_CALL    equ   0x80; Gera a interrução para o processador executar


section .data
	x dd 50
	y dd 30
	msg1 db 'x maior que y',LF, NULL
	tamanho1 equ $ - msg1 
	msg2 db 'y maior que x',LF, NULL
	tamanho2 equ $ - msg2

section .text 


global _start

_start:
	mov eax, DWORD [x] ;Le os 4 bytes(DWORD) do endereço de memoria x e mov para EAX
	mov ebx, DWORD [y] ;le os 4 bytes(DWORD) do endereço de memoria y e mov para EBX
        cmp eax, ebx
	jge maior
        mov ecx, msg2 ; ecx recebe a posição inicial da memoria onde tem algo a ser exibido
	mov edx ,tamanho2 ; edx recebe o calculo do tamanho da mensagem
	jmp final
maior:
	mov ecx, msg1
	mov edx, tamanho1

final:
	mov eax, SYS_WRITE
	mov ebx, STD_OUT
	int SYS_CALL

	mov eax, SYS_EXIT
	mov ebx, RET_EXIT
	int SYS_CALL


