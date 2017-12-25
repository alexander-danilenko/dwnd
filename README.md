# **D**rude on **W**indows **N**ative **D**ocker

![DWND Preview image](http://armarium.org/u/2016/09/07/e4a0cfa6a75ba8e6c5e7294d431898d9.png)

If you are **Microsoft Windows 10** user - this repo is exactly what you have looked for if you wanted to run your local Drupal-development environment using Docker!

As you probably know it's pretty painful to install and work with [original Drude: Docker environment for Drupal](https://github.com/blinkreaction/drude) on Windows. This hell with Vagrant and VirtualBox versions, virtual filesystems, very looong start/stop of containers because of complexity of [original Drude](https://github.com/blinkreaction/drude)... Well, it's not a problem anymore! We can just use Drude's Docker containers in **Native Docker for Windows** and do whatever we want manually! Yay!

Just remember, **Drude PowerShell module and all this repo contents are not official parts of Drude! It's just workaround for Windows 10 users who suffered long enough.** 

## `docker-compose.yml`
This project is mostly about `docker-compose.yml`. This file describes environment that will almost perfectly repeat Acquia servers and we are going to use it as our local server. 

## DWND Usage
1. Clone current repo
2. Navigate in terminal to repo directory (that contains `docker-compose.yml`)
2. Use `docker-compose` commands work with `docker-compose.yml` just as with any other compose file.

**OR** you can install [Drude Powershell Module](https://github.com/alexander-danilenko/drude-powershell-module) and execute all `dsh-*` commands (drude-like commands) in repo root directory (that contains `docker-compose.yml` file).
For **Drude Powershell Module usage examples** see [wiki](https://github.com/alexander-danilenko/dwnd/wiki/Drude-Powershell-Module-usage).

## General information
### Ports
All containers after start will forward their ports to your host's machine ports. It means that if you have Apache2 or MySQL servers running in your Windows - Docker will not be able to start and use needed ports because they are already used by your Windows apps. 

### Directories mounting
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
See [DWND Wiki](https://github.com/alexander-danilenko/dwnd/wiki) for documentation.
- - -
### License

Copyright (c) 2017 Alexander Danilenko.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
