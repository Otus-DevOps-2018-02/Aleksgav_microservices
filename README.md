# Aleksgav_microservices
Aleksgav microservices repository


## HOMEWORK 13
 - Создал новый проект в GCE
 - Поднял зост с докером
 - Поковырялся с PID namespace
 - Сравнил выводы: docker run --rm -ti tehbilly/htop || docker run --rm --pid host -ti tehbilly/htop
 - Создал докер фаил для контейнера с reddit monolith
 - Собрал образ на базе контейнера reddit-monolith
 - Запустил собранный контейнер
 - Отправил имэдж в докерхаб
 - Проверил что он доступен и работоспособен

#### Задание со *

 - Создал плейбук энсибл для установки докера - для пакер шаблона
 - Создал пакер шаблон, который делает образ с установленным Docker
 - Создал терраформ шаблон, поднимающий инстансы в зависимости от переменной. Используется образ с докером, ранее запеченный пакером.
 - Создал плейбук для деплоя докер контейнера, с динамическим инвентори, в поднятую инфраструктуру


## HOMEWORK 12
 - Установил Docker
 - Запустил контейнер hello world
 - Изучил команды:
    * docker info
    * docker version
    * docker ps
    * docker images
    * docker run
    * docker start
    * docker attach
    * docker create
    * docker exec
    * docker commit
    * docker inspect
    * docker kill
    * docker stop
    * docker system df
    * docker rm
    * docker rmi
