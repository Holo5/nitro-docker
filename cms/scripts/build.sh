#!/bin/bash

# Move config
cp -av /var/www/configuration/.env /var/www/cosmic/

# Install composer dependencies
cd /var/www/cosmic/
composer update

tail -f /dev/null