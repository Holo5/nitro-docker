#!/bin/bash

# Move config
cp -av /app/configuration/.env /app/cosmic/

# Install composer dependencies
cd /app/cosmic/
composer update

tail -f /dev/null