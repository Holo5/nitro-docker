#!/bin/bash

supervisord -c /app/supervisor/supervisord.conf

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

cd /app/atom
cp /app/.env /app/atom/.env

/usr/local/bin/composer install 
php artisan key:generate
npm install && npm run build:atom 
rm -rf /app/atom/public/client

chown -R $USER:www-data storage
chown -R $USER:www-data bootstrap/cache
chmod -R 775 storage
chmod -R 775 bootstrap/cache

cd /app/atom-hk
cp /app/atom/.env /app/atom-hk/.env
/usr/local/bin/composer install 
npm install && npm run build

chown -R $USER:www-data storage
chown -R $USER:www-data bootstrap/cache
chmod -R 775 storage
chmod -R 775 bootstrap/cache

supervisorctl start atom-cms
supervisorctl start atom-hk
tail -f /dev/null
