FROM php:8.0-apache

# Change root directory
ENV APACHE_DOCUMENT_ROOT /var/www/cosmic/public/

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Enable mod rewrite
RUN a2enmod rewrite

# Enable mod header
RUN a2enmod headers

# Install and enable ext-gd
RUN apt-get update && \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
    docker-php-ext-configure gd && \
    docker-php-ext-install gd

# Install zip and unzip
RUN apt-get install zip unzip \
     && apt-get install -y libzip-dev \
     && docker-php-ext-install zip

# Install git
RUN apt-get install git -y

# Install pdo and mysqli
RUN docker-php-ext-install mysqli pdo pdo_mysql