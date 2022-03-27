supervisord -c /app/supervisor/supervisord.conf

cp /app/configuration/nitro-converter/configuration.json /app/nitro-converter/src/configuration.json
cd /app/nitro-converter; yarn install;

supervisorctl start swf-http-server

tail -f /dev/null