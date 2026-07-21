segment .data
	LF        equ 0xA ;Line feed 
	NULL	  equ 0xD ; Final da string
	SYS_CALL  equ 0x80 ;chamada do so 
	;EAX
	SYS_EXIT  equ 0x1  ;cacll de finalização
	SYS_READ  equ 0x3  ;call de leitura
	SYS_WRITE equ 0x4  ;call de escrita
	;EBX
	RET_EXIT  equ 0x0  ;call de retorno de ok para o SO ou outros programas
	STD_IN	  equ 0x0  ;sinalização de entrada de dados no terminal
	STD_OUT   equ 0x1  ;sinalização de saida de dados no terminal

segment .text
     
     ;...................................
     ; Calcular o tamanho da String
     ;...................................
     ; Entrada: Valor da String em ECX
     ; Saida: Tamanho da String em EDX
     ;...................................

tamStr:
        mov edx, ecx   ; No programa main quando msg for passado para ecx, ecx tera o endereço que aqui movera para edx, 
       
proxChar:
	cmp byte[edx], NULL ; compara se o primeiro byte de edx e igual a NULL , perceba edx é usado como indice
	jz terminei ; verifica se zero fflag = 1 continua se for igual a 0 continua 
	inc edx ; incrementa vai para proximo digito
	jmp proxChar ; volta para inicio
terminei:
	sub edx, ecx ; depois que zero flag vira 1  efetua subtração de ecx  resultando 3 para ABC se fosse o caso
	ret ; retorno de chamada 


 
