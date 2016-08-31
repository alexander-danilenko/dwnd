# For busiest people who don't like to read
This guide is for people who don't like to read tons of words and just wanted to quick how-to. So here it is.

## General information
- It works **only** with Docker for Windows **10** **Professional**, **Enterprise** or **Education** because only these editions of Windows 10 have possibility to use **Hyper-V**.
- First of all install Docker for Windows and enable Hyper-V as it wants.
- Execute all commands in `powershell`. First navigate to folder with `docker-compose.yml` and then execute commands.
- `docker-compose.yml` is a file with settings for all ecosystem that you want to setup. It contains container names and their settings. Folders sharing settings also in there.
- `cli container` is for command line tools. Actually it's ubuntu, so play with it as you wish.
- `Container's unique name` is ued for initiation of interactive terminal session with any container.

### How to start containers 
<pre>docker-compose up</pre>
### How to stop containers
<pre>docker-compose stop</pre>
### How to restart containers
<pre>docker-compose restart</pre>
**Note:** If you made some changes to `docker-compose.yml` this `restart` command will not use this changes. For getting changes working just stop and start containers.
### How to get containers unique names
<pre>docker-compose ps</pre>
### How to get interactive session with container's bash
<pre>docker exec -it dwnd_cli_1 bash</pre>
Where `dwnd_cli_1` is unique name of `cli` container.
### How to execute commands in bash
<pre>docker exec -it dwnd_cli_1 bash -c 'cd /var/www/docroot && drush cc all'</pre>
Where `dwnd_cli_1` is unique name of `cli` container and `cd /var/www/docroot && drush cc all` is command that will run inside `cli` container.
### How to drop all containers
<pre>docker-compose down</pre>
### How to drop only needed container
<pre>docker dwnd_cli_1 down</pre>
Where `dwnd_cli_1` is unique name of needed `cli` container.
