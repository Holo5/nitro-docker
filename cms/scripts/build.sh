#!/bin/bash

cd /var/www/

# Move config
cp -av configuration/.env cosmic/
cp -av configuration/Config.php cosmic/src/App/

# Install composer dependencies
cd cosmic/
composer install

# Start apache
apache2-foreground