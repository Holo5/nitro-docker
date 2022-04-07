set windows-powershell := true

# Desc
desc:
  echo "Please, use other recipe to make you nitro dev environment :)"

# Install all easily
install:
  git submodule init
  git submodule update

# Start Mysql, Arcturus Emulator & Nitro
start-all:
  docker-compose up -d

# Open the MySQL console
mysql:
  docker exec -it arcturus bash -c "mysql -h mysql -u arcturus_user -parcturus_pw arcturus"

# Restart Arcturus Emulator
restart-arcturus:
  docker exec arcturus supervisorctl restart arcturus-emulator

# Stop Arcturus Emulator
stop-arcturus:
  docker exec arcturus supervisorctl stop arcturus-emulator

# Start Arcturus Emulator
start-arcturus:
  docker exec arcturus supervisorctl start arcturus-emulator

# Recompile Arcturus Emulator
recompile-arcturus:
  docker exec arcturus supervisorctl stop arcturus-emulator
  docker exec -it arcturus bash -c "cd /app/arcturus; mvn package; cp /app/config.ini /app/arcturus/target/config.ini;"
  docker exec arcturus supervisorctl start arcturus-emulator

# Watch Arcturus's output
watch-arcturus:
  docker exec arcturus supervisorctl tail -f arcturus-emulator

# Enter in the Arcturus's shell:
shell-arcturus:
  docker exec -it arcturus bash

# Restart Nitro dev server
restart-nitro:
  docker exec nitro supervisorctl stop nitro-dev-server
  docker exec nitro bash -c "cp /app/configuration/nitro-react/public/* /app/nitro-react/public/"
  docker exec nitro supervisorctl start nitro-dev-server

# Enter in the Nitro's shell
shell-nitro:
  docker exec -it nitro bash

# Extract nitro assets from SWF
extract-nitro-assets:
  docker exec -it nitro bash -c "cp /app/configuration/nitro-converter/configuration.json /app/nitro-converter/src/configuration.json; \
   cd /app/nitro-converter; \
   yarn ts-node-dev --transpile-only src/Main.ts; \
   echo \"Moving assets...\"; \
   rsync -r /app/nitro-converter/assets/* /app/nitro-assets/; \
   echo \"Done !\"; \
   exit;"