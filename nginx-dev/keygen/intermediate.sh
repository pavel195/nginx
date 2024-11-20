#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# Шаг 2: Создание промежуточного сертификата и его подпись корневым CA
# Создайте приватный ключ для промежуточного сертификата:
# openssl genpkey -algorithm RSA -out intermediate.key -aes256
# Создайте запрос на подпись сертификата (CSR) для промежуточного сертификата:
# openssl req -new -key intermediate.key -out intermediate.csr
# Создайте файл конфигурации для промежуточного сертификата intermediate.cnf:
# Затем создайте сертификат:
# openssl x509 -req -in intermediate.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out intermediate.crt -days 3650 -sha256 -extfile intermediate.cnf -extensions v3_intermediate_ca

# openssl req -config intermediate.cnf -new -keyout intermediate.key -out intermediate.csr -nodes

# Создайте приватный ключ и запрос на подпись сертификата (CSR) для промежуточного сертификата:
openssl req -config intermediate.cnf -new -keyout ../certs/intermediate.key -out ../req/intermediate.csr -nodes
# Создайте и подпишите промежуточный сертификат корневым CA:
openssl x509 -req -in ../req/intermediate.csr -CA ../certs/rootCA.crt -CAkey ../certs/rootCA.key -CAcreateserial -out ../certs/intermediate.crt -days 3650 -sha256 -extfile intermediate.cnf -extensions intermediate_req_extensions
