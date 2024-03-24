FROM php:8.2

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libgd-dev \
    libzip-dev \
    libsodium-dev

RUN docker-php-ext-install intl gd zip sodium sockets