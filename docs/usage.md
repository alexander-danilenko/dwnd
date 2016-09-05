# Usage of DWND

## General information
- It works **only** with Docker for Windows **10** **Professional**, **Enterprise** or **Education** because only these editions of Windows 10 have possibility to use **Hyper-V**.
- Enable hardware virtualization in your BIOS.
- Install [Docker for Windows](https://github.com/fat763/dwnd/blob/master/docs/setup.md) and enable Hyper-V as it wants.
- Execute all commands in `powershell`. First navigate to folder with `docker-compose.yml` and then execute commands.
- For easier executing commands - do not write full commands like `.\up.ps1`, but just write `up` and hit `Tab` on your keyboard, Powershell will auto complete it for you and replace with needed command.
- Project folder that contains `docker-compose.yml` file will be mounted as `/var/www/` to `cli` container.
- `docker-compose.yml` is a file with settings for all ecosystem that you want to setup. It contains container names and their settings. Folders sharing settings also in there.
<br />[See compose file syntax documentation](https://docs.docker.com/compose/compose-file/). 
- `cli container` is for command line tools. Actually it's Debian, so play with it as you wish.

## First of all 
You need to allow `*.ps1` scripts to run in your system. For allowing it - just open `powershell as Admin` and execute next: 
<pre>
Set-ExecutionPolicy RemoteSigned
</pre>
Answer `Yes` to prompt and that's it. 

## Starting of containers
<pre>.\up.ps1</pre>

## Stopping of containers
<pre>.\stop.ps1</pre>

## Restarting of containers
<pre>.\restart.ps1</pre>

## Getting status of containers
<pre>.\status.ps1</pre>

## Getting into `cli` container's bash terminal
So, just starting and stopping containers is not so fun as it was before. Let's just run `cli` container's bash terminal and do whatever we want from there. `cli` container is used for handling as many console things that will be heplful for work as possible. For example `cli` container already have `drush` and `drupal console`, some `nodejs`, `ruby` and many other things. It means that you will not want to install all these things into your Windows system, they are all in here, in `cli` container.

It's pretty easy to initiate interactive terminal session:  

<pre>.\bash.ps1</pre>

You can play with cli container: install apps using `sudo apt-get`, do some experiments and do whatever you want. And don't be afraid to break something, you always can destroy all containers and start from scratch.

## Getting into needed container's bash terminal
As example let's open interactive sessions with `web` container's bash:
<pre>.\bash.ps1 -container web</pre>
Parameters:
- `-container`: name of container that added to `docker-compose.yml` file.
<br />Default value: `cli`

## Executing of command in bash 
As example let's print content of `/etc/hosts` file of `cli` container:
<pre>.\exec.ps1 -command "cat /etc/hosts" -container "cli"</pre>
Parameters:
- `-command`: command that should be executed. String that have linux bash syntax.
<br />Default value: `ls -la`
- `-container`: name of container that added to `docker-compose.yml` file.
<br />Default value: `cli`

## Executing Drush commands
First - you need to place your Drupal installation to `./docroot` folder of this repo.

As example let's install Drupal site using `standard` installation profile:
<pre>.\drush.ps1 -command "si -y standard" -site "demo" -docroot "/var/www/docroot"</pre>
Parameters:
- `-docroot`: path to docroot of Drupal installation.
<br />Default value: `/var/www/docroot`
- `-site`: site folder that should be used for executing commands.
<br />Default value: `default`
- `-command`: command that should be executed in drush with all it's parameters.
<br />Default value: `status`
<br />**Note:** You can open bash interactive session and execute `drush` commands directly from there.

## Dropping of containers
As you probably know - all containers are some kind of `ephemeral` and can be easily dropped and started from scratch in a few seconds. Dropping of containers means that `all data in containers will be lost` and on next start of containers they will not have any of your changes, just like you installed this containers from scratch. 
<br />
<br />
**Warning**: in `docker-compose.yml` we have `db` container which brings to us MySQL database. If we drop containers, we will loose all data in that container that was added to database by us or our favorite CMS. Other words - there will be no MySQL databases after dropping of containers. So use containers dropping very carefully, you may lose your databases data.

<pre>.\destroy.ps</pre>
