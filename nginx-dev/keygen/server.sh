#!/bin/bash
# Шаг 3: Создание и подпись конечного сертификата промежуточным CA
# Создайте приватный ключ для конечного сертификата:
# openssl genpkey -algorithm RSA -out server.key -aes256
# Создайте запрос на подпись сертификата (CSR) для конечного сертификата:
# openssl req -new -key server.key -out server.csr
# Создайте и подпишите конечный сертификат промежуточным CA:
# Создайте файл конфигурации для конечного сертификата server.cnf:
# Затем создайте сертификат:
# openssl x509 -req -in server.csr -CA intermediate.crt -CAkey intermediate.key -CAcreateserial -out server.crt -days 365 -sha256 -extfile server.cnf -extensions v3_req
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./private.key -out ./certificate.crt -config ./openssl-san.snf

# Создайте приватный ключ и запрос на подпись сертификата (CSR) для конечного сертификата:
openssl req -config server.cnf -new -keyout ../server.key -out ../server.csr -nodes
# Создайте и подпишите конечный сертификат промежуточным CA:
openssl x509 -req -in ../server.csr -CA ../intermediate.crt -CAkey ../intermediate.key -CAcreateserial -out ../server.crt -days 365 -sha256 -extfile server.cnf -extensions server_req_extensions
# Создание цепочки сертификатов
cat ../intermediate.crt ../rootCA.crt > ../server.chain.pem
