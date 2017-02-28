# **D**rude on **W**indows **N**ative **D**ocker

![DWND Preview image](http://armarium.org/u/2016/09/07/e4a0cfa6a75ba8e6c5e7294d431898d9.png)

If you are **Microsoft Windows 10** user - this repo is exactly what you have looked for if you wanted to run your local Drupal-development environment using Docker!

As you probably know it's pretty painful to install and work with [original Drude: Docker environment for Drupal](https://github.com/blinkreaction/drude) on Windows. This hell with Vagrant and VirtualBox versions, virtual filesystems, very looong start/stop of containers because of complexity of [original Drude](https://github.com/blinkreaction/drude)... Well, it's not a problem anymore! We can just use Drude's Docker containers in **Native Docker for Windows** and do whatever we want manually! Yay!

Just remember, **Drude PowerShell module and all this repo contents are not official parts of Drude! It's just workaround for Windows 10 users who suffered long enough.** 

## `docker-compose.yml`
This project is mostly about `docker-compose.yml`. This file describes environment that will almost perfectly repeat Acquia servers and we are going to use it as our local server. 

## DWND Usage
1. Clone current repo
2. Install [Drude Powershell Module](https://github.com/fat763/drude-powershell-module)
3. Execure all `dsh-*` commands in root directory (that contains `docker-compose.yml` file) of recently cloned repo.

### Drude Powershell Module commands
You can get list of all commands using next command in PowerShell:
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
| `dsh-behat`               | Executes Behat tests in `.\tests\behat\features` folder                         |


## General information
### Ports
All containers after start will forward their ports to your host's machine ports. It means that if you have Apache2 or MySQL servers running in your Windows - Docker will not be able to start and use needed ports because they are already used by your Windows apps. 

### Folder mounting
All folder with `docker-compose.yml` will be mounted to all containers as `/var/www`. So place Drupal distribution to `docroot` repo's folder.

## MySQL Credentials
For connecting to MySQL you can use any tool like [MySQL WorkBench](https://www.mysql.com/products/workbench/), [SQLyog](https://github.com/webyog/sqlyog-community/wiki/Downloads) or my favorite [Navicat for MySQL](https://www.navicat.com/products/navicat-for-mysql). Surely, you can use [phpMyAdmin](https://www.phpmyadmin.net/) by just copying it to `docroot` folder of this repo.

### Credentials for connecting to MySQL in **Windows tools**:
- Host: `localhost`
- Port: `3306`
- User: `root`
- Password: `root`

### Credentials for connecting to MySQL in **Drupal**:
- Host: `db` 
- Port: `3306`
- User: `root`
- Password: `root`

## Accessing Drupal site
Just open in your favorite browser one of next urls:
- [http://localhost/](http://localhost/) 
- [https://localhost/](https://localhost/) 

## Documentation: 
See [DWND Wiki](https://github.com/fat763/dwnd/wiki) for documentation.
- - -
### License

Copyright (c) 2017 Alexander Danilenko.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
