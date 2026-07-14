

segment .data      ; tabelas assossiativas  

	LF		equ 0xA   ; Line Feed ou nova linha 
	NULL		equ 0xD	  ; Aponta para final da string	
	SYS_EXIT 	equ 0x1	  ; call de finalização 
	RET_EXIT	equ 0x0   ; Chamada de operaçao concluida com exito	
	STD_IN		equ 0x0	  ; Sinaliza o sistema para entrada de dados
	STD_OUT		equ 0x1   ; Sinaliza o sistema para saida de dados
	SYS_READ 	equ 0x3   ; Sinaliza o sistema para leitura de dados
	SYS_WRITE 	equ 0x4	  ; Sinaliza o sistema para escrita de dados
	SYS_CALL 	equ 0x80  ; Diz para o sistema operacional executar


section .data          ; seção de variaveis constantes
	msg db "Entre com seu nome: ", LF, NULL
	tam equ $ - msg

section .bss  		; seçao de variaveis modificaveis
	nome resb 1

section .text          ; espaçõ para o programa principal

global _start

_start:

	mov eax, SYS_WRITE   ; Efetua call de escrita
	mov ebx, STD_OUT     ; Efetua a sinalização de escrita
	mov ecx, msg         ; mov o que vai ser escrito para ecx	
	mov edx, tam	     ; mov o tamanho utilizado para essa menssagem
	int SYS_CALL         ; pede para o sistema operacional tomar a a ação


	mov eax, SYS_READ    ; Efetua call de leitura
	mov ebx, STD_IN      ; Prepara ebx para entrada de dados
	mov ecx, nome	     ; mov o endereço de nome para ecx 
	mov edx, 0xA ;       ; mov o valor 10 para edc sendo a capacidade utilizada para escrita suportada
        int SYS_CALL
     
	mov eax, SYS_EXIT    ; efetua a call de finalização do programa
	mov ebx, RET_EXIT    ; retorna 0 para o sistema operacional
	int SYS_CALL        ; interrupção basicame diz para os sistema operacional executar



