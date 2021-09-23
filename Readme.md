Шлюз для запросов с клиента до backend, на данном этапе все запросы идут к одному сервису, в дальнейшем предполагается, разделить монолит на микросервисы и данный шлюз упростит переход к такой архитектуре. 

[Официальная документация](https://www.krakend.io/docs/overview/introduction/)

[Online GUI](https://designer.krakend.io/)

**Krakend Не можент принимать массивы без объекта**

# Описание переменных 
1. ```FC_ENABLE=1``` krakend собирает конфиг из указанных ниже директорий 
1. ```FC_SETTINGS=/etc/krakend/config/settings/dev``` путь до файла с настройками который можно передавать в каждый шаблон для локальной разработки local, для develop - dev и тд 
1. ```FC_PARTIALS=/etc/krakend/config/partials``` папка с частями, те файлы которые вставляются в финальный конфиг как есть, обычно используется для мок данных 
1. ```FC_TEMPLATES=/etc/krakend/config/templates``` папка в которых хранятся шаблоны, основные настройки путей -- какие пути существуют и откуда что забирать    
1. ```FC_OUT=/etc/krakend/krakend_build.json``` вывод собранного конфига получившийся конфиг для krakend (полная копия krakend.json)

## Локальный запуск и сборка

### make debug 
    Локальная сборка и запуск контейнера конфиги собираются в файл FC_OUT

### make check
    Проверка сборки сборка происходит в файл FC_OUT

### Ошибки backend
    Krakend настроен таким образом, что в случае ошибок на backend сервисе будет приходить 200 код ответа и json 
    {"error_backend":{"http_status_code":404, "http_body": {"message"} }} 


# Структура config
+ **partial** - папка для мок данных в json виде сохраняются {название файла}.json
+ **settings** - окружение "переменных" папки задаются через evn окруженние окуда подтягиваются. Разделены на dictionary, discussion и тд для будущего разделения на микросервисы, что бы не пришлось искать и заменять значения по templates 
+ **templates** - описание endpoints для клиентского api и настройки проксирования до backend. Файлы обязательно с расширением .tmpl и при добавлении нового фала его нужно будет указать в krakend.json `{{ template "debug.tmpl" .service }}`


# Структура lua
Набор скриптов lua для pre или post обработки запроса


# templates
    Разделелние по шаблонам идет логическое, по используемым сущностями. 


