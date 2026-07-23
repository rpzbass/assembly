#!/bin/bash


if [ "$1" == "" ]; then

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "____ ____ ____ ____ _  _ ___  ____ ____ ____ ___ _  _ _  _ "
echo "|    |__/ |__| |    |_/  |__] |__| [__  [__   |  |  |  \/  "
echo "|___ |  \ |  | |___ | \_ |    |  | ___] ___]  |  |__| _/\_ "
echo "                        v 0.1                              "
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo ""        
echo "            MODO DE USO: $0 wordlist.txt                   "
echo "                         by Rpz                            "         
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"

else

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "____ ____ ____ ____ _  _ ___  ____ ____ ____ ___ _  _ _  _ "
echo "|    |__/ |__| |    |_/  |__] |__| [__  [__   |  |  |  \/  "
echo "|___ |  \ |  | |___ | \_ |    |  | ___] ___]  |  |__| _/\_ "
echo "                        v 0.1                              "
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"



read -p "Informe a hash: " hash


salto=$(echo $hash | cut -d "$" -f3-4)

while IFS= read -r senha;do

 crack_hash=$(mkpasswd -m yescrypt -S $salto "$senha") 

# echo "$senha"

 if [ "$hash" == "$crack_hash" ];then

        echo ""

	echo -e "\033[32m[+] Senha encontrada: $senha \033[0m"

	exit 0
  fi

done < $1

echo "[-] Senha não encontrada" 

fi
