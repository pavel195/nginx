# Запуск web-сервера nginx для локальной разработки

1. Создать сеть nginx-proxy:
   1. docker network create nginx-proxy 
2. Сгенерировать сертификаты (keygen)
    2.1 Корневой сертификат
        keygen/rootCA.sh
    2.2 wildcard сертификат
        keygen/wildcard.cnf в конфигурации указать нужные домены
        keygen/wildcard.sh 
3. Сохранить корневой сертификат в Доверенные корневые сертификаты (mmc.exe в windows)
4. Запустить контейнер через docker-compose.yml
5. Для доступа по доменному имени нужно задать доменное имя и порт VIRTUAL_HOST , VIRTUAL_PORT при запуске контейнеров
6. Указать в файле hosts 127.0.0.1 доменное имя 
 