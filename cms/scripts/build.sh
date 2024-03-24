#!/bin/bash

cd /usr/src/orion-cms

cp /usr/src/configuration/orion-cms/.env /usr/src/orion-cms/.env

composer install
yarn install && yarn build
php artisan key:generate
php artisan migrate --seed
chown -R www-data:www-data /var/www/cms/
cd /var/www/cms
chmod -R 775 storage
chmod -R 775 bootstrap/cache

php -S 0.0.0.0:2080 -t public