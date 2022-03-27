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

# Watch Arcturus's output
watch-arcturus:
  docker exec arcturus supervisorctl tail -f arcturus-emulator

# Enter in the Arcturus's shell:
shell-arcturus:
  docker exec -it arcturus bash

# Enter in the Nitro's shell
shell-nitro:
  docker exec -it nitro bash

# Extract nitro assets from SWF
extract-nitro-assets:
  docker exec -i nitro bash -c "cp /app/configuration/nitro-converter/configuration.json /app/nitro-converter/src/configuration.json; cd /app/nitro-converter; yarn start; mv /app/nitro-converter/assets/* /app/nitro-assets/"