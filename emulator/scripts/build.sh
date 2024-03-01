#!/bin/bash

supervisord -c /app/supervisor/supervisord.conf

cd /app/arcturus
mvn package
cp /app/config.ini /app/arcturus/target/config.ini
mkdir /app/arcturus/target/plugins
cd /app/arcturus/target/plugins
wget https://git.krews.org/morningstar/nitrowebsockets-for-ms/-/raw/aff34551b54527199401b343a35f16076d1befd5/target/NitroWebsockets-3.1.jar

supervisorctl start arcturus-emulator

tail -f /dev/null