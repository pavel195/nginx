#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

# Создайте приватный ключ и CSR для wildcard сертификата:
openssl req -new -nodes -out ../req/wildcard.csr -keyout ../certs/default.key -config wildcard.cnf
# Подпишите wildcard сертификат с помощью корневого сертификата:
openssl x509 -req -in ../req/wildcard.csr -CA ../certs/rootCA.crt -CAkey ../certs/rootCA.key -CAcreateserial -out ../certs/default.crt -days 500 -sha256 -extfile wildcard.cnf -extensions v3_req
# Создание цепочки сертификатов
cat ../certs/default.crt ../certs/rootCA.crt > ../certs/default.chain.pem
# Создание dhparam
openssl dhparam -out ../certs/dhparam.pem 2048