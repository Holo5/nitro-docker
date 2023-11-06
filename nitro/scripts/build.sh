supervisord -c /app/supervisor/supervisord.conf

cp /app/configuration/nitro-converter/configuration.json /app/nitro-converter/src/configuration.json
cp /app/configuration/nitro-react/public/* /app/nitro-react/public/

cd /app/; yarn install;

supervisorctl start swf-http-server
supervisorctl start assets-http-server
supervisorctl start nitro-dev-server

tail -f /dev/null
