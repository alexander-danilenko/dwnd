# **D**rude on **W**indows **N**ative **D**ocker

![DWND Preview image](http://armarium.org/u/2016/09/07/e4a0cfa6a75ba8e6c5e7294d431898d9.png)

If you are **Microsoft Windows 10** user - this repo is exactly what you have looked for if you wanted to run your local Drupal-development environment using Docker!

As you probably know it's pretty painful to install and work with [original Drude: Docker environment for Drupal](https://github.com/blinkreaction/drude) on Windows. This hell with Vagrant and VirtualBox versions, virtual filesystems, very looong start/stop of containers because of complexity of [original Drude](https://github.com/blinkreaction/drude)... Well, it's not a problem anymore! We can just use Drude's Docker containers in **Native Docker for Windows** and do whatever we want manually! Yay!

Just remember, **Drude PowerShell module and all this repo contents are not official parts of Drude! It's just workaround for Windows 10 users who suffered long enough.** 

## `docker-compose.yml`
This project is mostly about `docker-compose.yml`. This file describes environment that will almost perfectly repeat Acquia servers and we are going to use it as our local server. 

### `docker-compose.yml` contents:

- `web` - Apache2 v2.2.22
- `cli` - Debian v8.4 + PHP v5.6.20 
<br/>
It's actually real Debian with some preinstalled command line apps like `drush`, `drupal console`, etc. It's also used as PHP interpriter for `web` container.
- `db` - MySQL v5.5.46
- `browser` - Selenium 2.47.1 + Firefox headless browser
- `solr` - Apache Solr v3.6.2
- `memcached` - Memcached v3.0.8

## DWND Usage
### General information
#### Ports
Almost all containers after start will forward their ports to your host's machine ports. It means that if you have Apache2 or MySQL servers running in your Windows - Docker will not be able to start and use needed ports because they are already used by your Windows apps. 
#### Hosts
Also as you can see in compose file - `cli` container have `links` section. It means that every linked container will be added to `/etc/hosts` of `cli` container with it's own IP address which points to domain with container name. 

It allows any container can be easily accessed from `cli` container using it's container name as host. 

For example: 
- For mysql database configuration use `db` - as host for accessing database in Drupal settings
- For Memcached configuration use `memcached` - as host for Memcached Drupal module settings
- For Apache Solr configuration use`solr` - as host for Apache Solr Drupal module settings

Just keep in mind - **Windows Apps** can use `localhost` as host for any container's port, but for **code that runs inside containers** you should use **container names as their hosts**.

### Code
All folder with `docker-compose.yml` will be mounted to `cli` and `web` containers as `/var/www`. So place Drupal distribution to `docroot` folder of repo.
### Database
For connecting to MySQL you can use any tool like [MySQL WorkBench](https://www.mysql.com/products/workbench/), [SQLyog](https://github.com/webyog/sqlyog-community/wiki/Downloads) or my favorite [Navicat for MySQL](https://www.navicat.com/products/navicat-for-mysql). Surely, you can use [phpMyAdmin](https://www.phpmyadmin.net/) by just copying it to `docroot` folder of this repo.

#### Credentials for connecting to MySQL in **Windows tools**:
- Host: `localhost`
- Port: `3306`
- User: `root`
- Password: `admin123`

#### Credentials for connecting to MySQL in **Drupal**:
- Host: `db` 
- Port: `3306`
- User: `root`
- Password: `admin123`

Well, i understand that it's pretty unsafe to use this credentials everywhere, but you can set your own in `docker-compose.yml`.

### Accessing Drupal site
- [http://localhost/](http://localhost/) 
- [https://localhost/](https://localhost/) 

## Drude Powershell Module
Of course if you are Docker-ninja you can just use pre-configured `docker-compose.yml` file using docker if you know what to do. Well done then, you are rockstar! :+1:

But if you are not so good skileld Docker-ninja, you can just install unofficial [Drude Powershell Module](https://github.com/fat763/drude-powershell-module) and use simplified commands for working with this repo.

**[Drude Powershell Module](https://github.com/fat763/drude-powershell-module)** is just a collection of PowerShell functions that works the same as in original [Drude](https://github.com/blinkreaction/drude). 

Powershell Module is available in PowershellGallery: https://www.powershellgallery.com/packages/Drude. It means that you don't need to install any additional software for install/update/uninstall Drude PowerShell module. Pretty cool, hah?

### Requirements for running DWND with Drude Powershell module:
- [Stable Docker for Windows](https://docs.docker.com/docker-for-windows/) (with Hyper-V support)
- **Windows 10 Professional / Enterprise / Education**
</br>
`Standard editions will not work with Native Docker because of missing Hyper-V in them` ([see details here](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_compatibility)).
<br/>
I'm very sorry if you find this information for a first time and realized that you want to buy (he-he) Windows 10 Professional.

### Installation, Update, Uninstallation of Powershell module
First of all, for using Drude Powershell Module you need to allow PowerShell modules to run in your system and only then install Drude PowerShell module. For doing this just open `powershell as Administrator` and execute next: 

```powershell 
Set-ExecutionPolicy RemoteSigned
Install-Module Drude
```
That's it. Now you can use `dsh-*` commands. Also Drude PowerShell module is regular PowerShell module, it means that you can use `Install-Module`, `Update-Module` and `Uninstall-Module`.

### Commands
You can get list of commands using next command in PowerShell:
```powershell
Get-Command dsh-*
```
Anyway, below you can find list of commands. You are welcome.

All commands should be executed in folder with `docker-compose.yml`. Other words - in root directory of current repo.

| Comand                    | Description                                                                   |
| ------------------------- | ----------------------------------------------------------------------------- |
| `dsh-up`                  | Start containers                                                              |
| `dsh-down`, `dsh-stop`    | Stops containers                                                              |
| `dsh-restart`             | Restarts containers                                                           |
| `dsh-status`, `dsh-ps`    | Prints status of containers                                                   |
| `dsh-logs`                | Prints logs for all or needed container                                       |
| `dsh-bash`                | Initiates interactive bash shell session with cli (or any other) container    |
| `dsh-exec`                | Executes command in cli (or any other) container's interactive bash shell     |
| `dsh-drush`               | Executes drush command for needed site in needed docroot folder               |
| `dsh-destroy`             | Drops all containers                                                          |
| `dsh-reset`               | Drops all containers and starts containers from scratch                       |
| `dsh-behat`               | Executes Behat tests                                                          |
| `dsh-init-dwnd`           | Downloads this repo to current folder into `dwnd` subfolder                   |
| (TBD) 'dsh-init'          | Executes init script placed in `.\.drude\scripts\drude-init.sh`               |

For more detailed descriptions see for [Drude Powershell Module usage documentation page](https://github.com/fat763/dwnd/blob/master/docs/usage.md).

All commands are documented and you can see example of usage just use default PowerShell help: 
```powershell 
Get-Help dsh-bash -examples
```

## Documentation: 
- [How to setup Docker on Windows 10.](https://github.com/fat763/dwnd/blob/master/docs/setup.md)
- [Drude Powershell Module usage](https://github.com/fat763/dwnd/blob/master/docs/usage.md)
- (TBD) How to configure your own `docker-compose.yml`
- (TBD) How to add some new containers.
- (TBD) How to setup Drupal using this template
- (TBD) How to setup Wordpress using this template
- (TBD) How to setup Joomla! using this template
- (TBD) How to run Behat tests.

- - -
### License

Copyright (c) 2016 Alexander Danilenko.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
