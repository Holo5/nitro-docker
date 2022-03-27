supervisord -c /app/supervisor/supervisord.conf

cp /app/configuration/nitro-converter/configuration.json /app/nitro-converter/src/configuration.json
cd /app/nitro-converter; yarn install;

cp /app/configuration/nitro-react/public/* /app/nitro-react/public/
cd /app/nitro-react; yarn install;

supervisorctl start swf-http-server
supervisorctl start assets-http-server

tail -f /dev/null