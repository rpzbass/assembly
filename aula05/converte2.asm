%include 'bibliotecaE.inc'

section .data
   vi dw  '2001', LF, NULL


section .text

global  _start

_start:
	call converte_valor
    	call mostra_valor
 
	mov eax, SYS_EXIT
	mov ebx, RET_EXIT
	int SYS_CALL

converte_valor:

	lea esi, [v1] ; carrega o endereco inicial da double word v1 em esi
	mov ecx, 0x4 ; defini o tamanho ou seja quantos caracteres a v1 tem nesse caso 4 funciona como contador para loop
	call string_to_int ;efetua a chamada da função string_to_int
	add eax, 0x2; soma 2 com o registrador eax
        ret   ; retorna ao ponto de partida do qual a chamada iniciou

mostra_valor:
	call int_to_string  ; efetua chamada da função int to string
	call saidaResultado ; chama função da biblioteca
	ret

string_to_int:
	xor ebx, ebx ; zera registrador ebx
  .prox_digito:
	movzx eax, byte[esi] ; mov o byte de esi que está viculado com a posiçao v1 dw o primeiro byte no caso 2
	inc esi ; incrementa em 1 byte esi ou seja basicamente e como uma variavel de controle para fazer o deslogamento
	sub al, '0' ;  subtrai '0' de '1' como e string subtrai da string 1
 	imul ebx, 0xA ; Multiplica 10 vezes ebx que e 0, atribuindo valor resultante em ebx
	add ebx, eax ;  soma o valor de eax em ebx 
 	loop .prox_digito ; volta para o marcador prox_digito e decrementa ecx enquanto for diferente de 0
        mov eax, ebx , mov o valor total convertido em eax
	ret

int_to_string:
	lea esi, [BUFFER] ; carrega o endereço do buffer em esi criando uma associação	
	add esi, 0x9 ; efetua tabulação para o ultimo byte do buffer
	mov byte[esi], 0xA ; escreve o caractere \n para esi no ultimo byte ou LF
	mov ebx, 0xA; movimenta 10 para ebx
  .prox_digito:
	xor edx, edx ;faz uma operacao xor para zerar devido a divisao 
	div ebx ; EDX:EAX /  EBX   EAX=quociente EDX=resto
        add dl, '0' ; soma resto como '0' somando 
        dec esi ; decrementa valor de esi mudando a recuando uma posição
        mov [esi], dl ; mov resto para esi 
	test eax, eax ; atualiza flags 
        jnz .prox_digito ; continua enquanto quociente foi diferente de 
        ret 
