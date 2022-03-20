set shell := ["powershell.exe", "-c"]

# Install all easily
install:
  git submodule init
  git submodule update
  docker-compose up -d

# Start Mysql, Arcturus Emulator & Nitro
start-all:
  docker-compose up -d