# Nitro Docker
Nitro docker is a quick-to-setup docker dev environment. It can be run on Windows, Linux or OSX just with a few commands

# Installation
- Install ``just`` from here: https://github.com/casey/just#installation
- Install docker desktop (and for windows, enable WSL support) from here: https://www.docker.com/get-started/
- Clone this repository
- Execute the following commands inside cloned repository
- `just install`
- `just start-all`
- Wait 5/10 minutes (it's important)
- Once nitro accessible on [http://127.0.0.1:1080?sso=123](http://127.0.0.1:1080?sso=123)
- you can extract all assets easily with the command `just extract-nitro-assets`
- after extract assets you can run `just config-atom` to configure the cms and housekeeping
- the command above will give you the instalation key required by atom in the initial setup. Access http://localhost:8000, paste it in the required field and have fun.

## More commands
- `just restart-arcturus`: restart arcturus emulator
- `just restart-nitro`: restart nitro dev server (Craco in nitro-react)
- `just watch-arcturus`: watch the emulator output
- `just watch-nitro`: watch the nitro dev server output
- `just --list`: display all usefull commands <3

## More informations
### Mysql
Mysql server use these credentials:
```
      - MYSQL_ROOT_PASSWORD=arcturus_root_pw
      - MYSQL_USER=arcturus_user
      - MYSQL_PASSWORD=arcturus_pw
      - MYSQL_DATABASE=arcturus
```
The first database come from mysql/dumps, it's the base Arcturus database for 3.0.X with just a default SSO ticket (123).

### Arcturus
- Arcturus is stored in emulator/arcturus, it's just a submodule from krews.git. Each time you run the nitro-arcturus image, each time the emulator is recompiled. You can recompile manualy with the command `just recompile-arcturus`.
- The NitroWebSocket plugin is already added
- All the configuration can be found in `emulator/config.ini`

### Nitro
- Nitro is the folder for nitro dev server, assets, swf, converters...
- The nitro-image contains 3 server: assets server (for all *.nitro files), swf server from morningstar (who contain all current useful SWF) and nitro-dev server on nitro-react.
- All extracted assets come from nitro-swf and will be extracted in nitro-assets (the nitro converter use the swf server)
- All the configurations for nitro-react are in `nitro/configuration`. If you make some change, just make `just restart-nitro`

### Atom CMS and HK

-   Atom is accessible at [http://localhost:8000](http://localhost:8000/), and Atom HK is accessible at [http://localhost:666](http://localhost:666/).
-   All configurations for Atom CMS and Atom HK are in `atom/.env`.
-   After the initial setup of the CMS, you can edit some settings in the `website_settings` table of the database.
-   To test Atom HK, you will need to add rank 7 (admin) to your user in the `users` table of the database.

### Have fun <3
