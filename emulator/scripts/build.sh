#!/bin/bash

supervisord -c /app/supervisor/supervisord.conf

cd /app/arcturus
mvn package
cp /app/config.ini /app/arcturus/target/config.ini
mkdir /app/arcturus/target/plugins
cd /app/arcturus/target/plugins
wget https://cdn.discordapp.com/attachments/641088820598538252/873759980329766942/NitroWebsockets-3.1.jar
wget https://git.krews.org/Raizer/cosmic-assets/-/raw/master/Plugin/Webkit.jar

supervisorctl start arcturus-emulator

tail -f /dev/null