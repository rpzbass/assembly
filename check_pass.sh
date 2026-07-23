#!/bin/bash

if [ -z "$1" ]; then

   echo ""
   echo "-------------------------------"
   echo "Modo de uso: $0 wordlist.txt"
   echo "-------------------------------"
   echo ""

else

    worlist="$1"

    read -p "Insira a senha para verificação: " minhasenha

    echo ".........................."
    echo "      Verificando"
    echo ".........................."

    while read -r senha; do

        if [ "$senha" == "$minhasenha" ]; then

            echo -e "\e[31m!!!! VULNERAVEL !!!!\e[0m"
            exit 0

        fi

    done < "$worlist"

    echo "NAO VULNERAVEL PARA A WORDLIST $1"

fi
