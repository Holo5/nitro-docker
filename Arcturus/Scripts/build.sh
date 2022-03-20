#!/bin/bash

supervisord -c /app/Supervisor/supervisord.conf

cd /app/Sources
mvn package
cp /app/config.ini /app/Sources/target/config.ini
mkdir /app/Sources/target/plugins
cd /app/Sources/target/plugins
wget https://cdn.discordapp.com/attachments/641088820598538252/873759980329766942/NitroWebsockets-3.1.jar

supervisorctl start arcturus-emulator

tail -f /dev/null