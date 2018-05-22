# Aleksgav_microservices
Aleksgav microservices repository

## HOMEWORK 14

 - Подключился к ранее созданному хосту
 - Распаковал микросервисное приложение
 - Создал докер файлы для:
  * post
  * comment
  * ui
 - Собрал образа с сервисами
 - Создал бридж сеть
 - Запустил контейнеры
 - Проверил - все ок
 - Оптимизировал образа
 - Создал docker volume и подключил его к mongo db
 - Перезапустил приложение - все посты остались


#### Задание со *

Остановил все контейнеры и запустил с другими сетевыми алиасами, проверил - все работает.

```
docker run -d --network=reddit \
--network-alias=post_db_test --network-alias=comment_db_test mongo:latest
docker run -d --network=reddit \
--network-alias=post_test -e "POST_DATABASE_HOST=post_db_test" abirvalg/post:1.0
docker run -d --network=reddit \
--network-alias=comment_test -e "COMMENT_DATABASE_HOST=comment_db_test" abirvalg/comment:1.0
docker run -d --network=reddit \
-p 9292:9292 -e "POST_SERVICE_HOST=post_test" -e "COMMENT_SERVICE_HOST=comment_test" abirvalg/ui:1.0
```

#### Задание со *

Пересобрал образа на основе alpine linux

#### Задание со **

Еще сильнее уменьшил размеры образов.
Главным счетом за счет использования чистого alpine linux, и удаления ненужных пакетов после сборки проекта.
Пример в репозитории.


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
