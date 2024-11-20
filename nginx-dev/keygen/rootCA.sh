#!/bin/bash
# ШАГ 1: Создание приватного ключа и самоподписанного корневого сертификата
# Используйте конфигурационный файл для создания корневого сертификата:

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

openssl req -x509 -new -nodes -keyout ../certs/rootCA.key -sha256 -days 1024 -out ../certs/rootCA.crt -config rootCA.cnf


# Шаг 1: Создание корневого сертификата CA
# Создайте приватный ключ для корневого CA:
# openssl genpkey -algorithm RSA -out rootCA.key -aes256

# Создайте самоподписанный корневой сертификат:
# openssl req -x509 -new -key rootCA.key -sha256 -days 3650 -out rootCA.crt
