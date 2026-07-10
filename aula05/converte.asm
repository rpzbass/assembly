%include 'bibliotecaE.inc'

section .data
    v1 dw '105',LF, NULL


section .text

global _start 

_start:
	call converte_valor 
	call mostrar_valor

	mov eax, SYS_EXIT
	mov ebx, RET_EXIT
	int SYS_CALL

converte_valor:
	lea esi, [v1] ; carrega o endereço inicial da double word v1
	mov ecx, 0x3  ; defini o tamanho ou seja quantos caracteres a v1 tem no caso 3, funciona como um contador
	call string_to_int ; efetua chamada da função string_to_int
	add eax, 0x2 ; soma 10 com registrador eax 
	ret ; volta para o ponto depois do call

mostrar_valor:
	call int_to_string  ; efetua chamada da função int to string
	call saidaResultado ; chama função da biblioteca 
        ret

string_to_int:
	xor ebx, ebx; zera  registrador
 .prox_digito:
        movzx eax, byte[esi] ; mov o byte de esi que está vinculado com a posição v1 dw o primeiro byte 104 seria 1 
        inc esi  ; incrementa em 1 byte esi, ou seja basicamente como um variavel de controle para o proximo byte 
        sub al, '0'  ; '1'|0|5    subtrai '0' de '1' como é string subtrai da string '1'
        imul ebx, 0xA ; Multiplica 10 vezes ebx que é zero então ebx permanece com 0
        add ebx, eax  ; soma o valor de eax em ebx 1 ebx fica valendo 1
        loop .prox_digito   ; volta para o marcador proximo digito e decrementa ecx for diferente de 0
        mov eax, ebx  ;  mov 105 para eax 
        ret ; retorno de interrução voltando para a chamada

int_to_string:
	lea esi, [BUFFER]  ;  carrega o endereço do buffer em esi criando uma associação
        add esi,  0x9  ;  efetua tabulação para o ultimo byte do buffer
        mov byte[esi], 0xA ;   escreve o caractere \n para esi no ultimo byte ou LF
	mov ebx, 0xA ;  movimenta 10 para ebx 
 .prox_digito:
        xor edx, edx ; faz uma operação xor para zerar edx devido a divisão
	div ebx  ;    (EDX:EAX / EBX)  EAX=QUOCIENTE EDX=RESTO 
	add dl, '0' ; soma 5 resto com '0' somando 35h
	dec esi ;  decrementa valor de esi mudando a recuando uma posição 
	mov [esi], dl ; mov 5 para esi
	test eax, eax ; atualiza as flags, não entendi bem
	jnz .prox_digito ; como o conciente é 10 e não é zero, continua 
	ret

