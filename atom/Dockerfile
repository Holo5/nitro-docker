FROM php:8.2-cli-alpine3.17

WORKDIR /app

RUN apk update
RUN apk add bash
RUN apk add --no-cache linux-headers
RUN apk add npm
RUN apk add mysql-client
RUN apk add supervisor
RUN apk add rsync
RUN apk add --no-cache \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    libxpm-dev \
    libxml2-dev \
    openssl-dev \
    curl-dev

RUN docker-php-ext-install curl fileinfo gd pdo_mysql sockets
