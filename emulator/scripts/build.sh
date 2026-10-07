#!/bin/bash

supervisord -c /app/supervisor/supervisord.conf

cd /app/arcturus
mvn package
cp /app/config.ini /app/arcturus/target/config.ini
mkdir -p /app/arcturus/target/plugins
cd /app/arcturus/target/plugins
if [ ! -f NitroWebsockets-3.1.jar ]; then
  wget -O NitroWebsockets-3.1.jar https://git.krews.org/morningstar/nitrowebsockets-for-ms/-/raw/aff34551b54527199401b343a35f16076d1befd5/target/NitroWebsockets-3.1.jar
fi

supervisorctl start arcturus-emulator

tail -f /dev/null
