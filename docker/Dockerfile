FROM devopsfaith/krakend

USER root
RUN apt-get update && apt-get install -y curl

COPY ./src/config /etc/krakend/config
COPY ./src/lua /etc/krakend/lua
COPY ./src/krakend.json /etc/krakend/krakend.json

COPY src/config /etc/krakend/config