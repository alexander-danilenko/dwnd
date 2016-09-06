# Drude Powershell Module usage

## General information
- It works **only** with Docker for Windows **10** **Professional**, **Enterprise** or **Education** because only these editions of Windows 10 have possibility to use **Hyper-V**.
- Enable hardware virtualization in your BIOS.
- Install [Docker for Windows](https://github.com/fat763/dwnd/blob/master/docs/setup.md) and enable Hyper-V as it wants.
- Execute all commands in `powershell`. First navigate to folder with `docker-compose.yml` and then execute commands.
- Project folder that contains `docker-compose.yml` file will be mounted as `/var/www/` to `cli` container.
- `docker-compose.yml` is a file with settings for all ecosystem that you want to setup. It contains container names and their settings. Folders sharing settings also in there.
<br />[See compose file syntax documentation](https://docs.docker.com/compose/compose-file/). 
- `cli container` is for command line tools. Actually it's Debian, so play with it as you wish.

## Drude Powershell Module
Drude Powershell module is just a collection of PowerShell commands that works the same as in original [Drude](https://github.com/blinkreaction/drude). 

Module is available in PowershellGallery: https://www.powershellgallery.com/packages/Drude

It means that you don't need to install any additional sofrware for install/update/uninstall Drude PowerShell module. Pretty cool, hah?

### Installation
You need to allow PowerShell modules to run in your system. For allowing it - just open `powershell as Administrator` and execute next: 

```powershell 
Set-ExecutionPolicy RemoteSigned
```

Install Drude PowerShell module

```powershell 
Install-Module Drude
```

That's it! Now you can execute any command listed in this repo.


### Update
Wanna some cool and tasty new features? 
```powershell 
Update-Module Drude
```

### Uninstall
Hate this thing? Just remove it!
```powershell 
Uninstall-Module Drude
```

## Commands
### Getting all available commands
After installation of Drude PowerShell module you can get list of commands using next command in PowerShell:
```powershell
Get-Command dsh-*
```

### Starting of containers
```powershell
dsh-up
```

### Stopping of containers
```powershell
dsh-stop
```

### Restarting of containers
```powershell
dsh-restart
```

### Getting status of containers
```powershell
dsh-status
```

### Getting into `cli` container's bash terminal
So, just starting and stopping containers is not so fun as it was before. Let's just run `cli` container's bash terminal and do whatever we want from there. `cli` container is used for handling as many console things that will be heplful for work as possible. For example `cli` container already have `drush` and `drupal console`, some `nodejs`, `ruby` and many other things. It means that you will not want to install all these things into your Windows system, they are all in here, in `cli` container.

It's pretty easy to initiate interactive terminal session:  

```powershell
dsh-bash
```

You can play with cli container: install apps using `sudo apt-get`, do some experiments and do whatever you want. And don't be afraid to break something, you always can destroy all containers and start from scratch.

### Getting into needed container's bash terminal
As example let's open interactive sessions with `web` container's bash:
```powershell
dsh-bash web
```

### Executing of command in bash 
As example let's print content of `/etc/hosts` file of `cli` container:
```powershell
dsh-exec "cat /etc/hosts" cli
```

### Executing Drush commands
First - you need to place your Drupal installation to `./docroot` folder of this repo.

As example let's install Drupal site using `standard` installation profile in `docroot/sites/default` folder:
```powershell
dsh-drush "si -y standard" default
```
<br />**Note:** You can open bash interactive session and execute `drush` commands directly from there.

### Destroying containers
As you probably know - all containers are some kind of `ephemeral` and can be easily dropped and started from scratch in a few seconds. Dropping of containers means that `all data in containers will be lost` and on next start of containers they will not have any of your changes, just like you installed this containers from scratch. 
<br />
<br />
**Warning**: in `docker-compose.yml` we have `db` container which brings to us MySQL database. If we drop containers, we will loose all data in that container that was added to database by us or our favorite CMS. Other words - there will be no MySQL databases after dropping of containers. So use containers dropping very carefully, you may lose your databases data.
```powershell
dsh-destroy
```

### Run Behat tests
```powershell
dsh-behat "--tags=@d7"
```

## Download DWND
Wanna download this repo to some folder? Easy! 
```powershell
dsh-init-dwnd foldername
```
This command will download current repo that contains `docker-compose.yml` and other useful templates to `foldername` folder.
