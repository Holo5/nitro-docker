#!/bin/bash

# Move config
cp -av /var/www/configuration/.env /var/www/cosmic/
cp -av /var/www/configuration/Config.php /var/www/cosmic/src/App/

# Install composer dependencies
cd /var/www/cosmic/
composer install

apache2-foreground