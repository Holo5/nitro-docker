supervisord -c /app/supervisor/supervisord.conf

cp /app/configuration/nitro-converter/configuration.json /app/nitro-converter/src/configuration.json
cd /app/nitro-converter; yarn install;

cp /app/configuration/nitro-react/public/* /app/nitro-react/public/
cd /app/nitro-react; yarn install;

# sass patch
yarn remove node-sass; yarn add sass; yarn install
cp -av /app/sass-patch/LoadingView.scss /app/nitro-react/src/components/loading/

supervisorctl start swf-http-server
supervisorctl start assets-http-server
supervisorctl start nitro-dev-server

tail -f /dev/null