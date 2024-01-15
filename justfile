set windows-powershell := true

default:
  @just --list

# Install all easily
install:
  git submodule init
  git submodule update

# Start Mysql, Arcturus Emulator & Nitro (not in daemon mod)
start-all:
  docker-compose up --build

# Close docker containers, remove images and clean volumes
clean-docker:
  docker-compose down
  docker image rm nitro-docker_arcturus -f
  docker image rm nitro-docker_nitro -f
  docker image rm nitro-docker-atom -f
  docker volume rm nitro-docker_volume-arcturus-maven-repo
  docker volume rm nitro-docker_volume-arcturus-target
  docker volume rm nitro-docker_volume-mysql
  docker volume rm nitro-docker_volume-nitro-converter-node-modules
  docker volume rm nitro-docker_volume-nitro-react-node-modules

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

# Stop Nitro Dev Server
stop-nitro:
  docker exec nitro supervisorctl stop nitro-dev-server

# Start Nitro Dev Server
start-nitro:
  docker exec nitro supervisorctl start nitro-dev-server

# Enter in the Nitro's shell
shell-nitro:
  docker exec -it nitro bash

# Watch Nitro dev server's output
watch-nitro:
  docker exec nitro supervisorctl tail -f nitro-dev-server

# Extract nitro assets from SWF
extract-nitro-assets:
  docker exec -it nitro bash -c "cp /app/configuration/nitro-converter/configuration.json /app/nitro-converter/configuration.json"
  docker exec -it nitro bash -c "cd /app/nitro-converter; yarn ts-node-dev --transpile-only src/Main.ts"
  docker exec -it nitro bash -c "echo 'Moving assets...'"
  docker exec -it nitro bash -c "rsync -r /app/nitro-converter/assets/* /app/nitro-assets/"
  docker exec -it nitro bash -c "echo 'Done !'"

# Enter in the Atom's shell:
shell-atom:
  docker exec -it atom bash

# Update nitro client path, hk path, apply hk migrations and get the installation key required in the initial setup
config-atom:
  docker exec -it mysql mariadb -u arcturus_user -parcturus_pw arcturus -e "UPDATE arcturus.website_settings SET value = 'http://localhost:1080' WHERE (\`key\` = 'nitro_path');"
  docker exec -it mysql mariadb -u arcturus_user -parcturus_pw arcturus -e "UPDATE arcturus.website_settings SET value = 'http://localhost:666' WHERE (\`key\` = 'housekeeping_url');"
  docker exec -it atom bash -c "cd /app/atom-hk/; php artisan migrate --seed"
  docker exec -it mysql mariadb -u arcturus_user -parcturus_pw arcturus -e "SELECT installation_key FROM arcturus.website_installation;"
