# **D**rude on **W**indows **N**ative **D**ocker

If you are happy *Mac* or *Linux* user - you can close this page, there is no helpful information for you, just do what you do as before, you rocks! :) 

But if you are **Microsoft Windows 10** user - this repo is exactly what you have looked for if you wanted to run your local web-development environment using Docker.

As you probably know it's pretty painfull to install and work with [Drude](https://github.com/blinkreaction/drude) (Docker environment for Drupal) on Windows. This hell with Vagrant and VirtualBox versions, virtual filesystems, very looong start/stop of containers because of complexity of Drude. Well, it's not a problem anymore! We can just use Drude's Docker containers in **Native Docker for Windows** and do whatever we want manually! Yay!

Just remember, **Drude PowerShell module and all this repo contents are not official parts of Drude! It's just workaround for Windows 10 users who suffered long enough.** 

### Requirements for running Drude Powershell module on Windows:
1. Windows 10 Professional / Enterprise / Education
</br>
`Standard editions will not work with Native Docker because of missing Hyper-V in them` ([see details here](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_compatibility)).
<br/>
I'm very sorry if you find this information for a first time and realized that you want to buy (he-he) Windows 10 Professional.
2. Hardware support of virtualization technology in your processor (all modern processors support it)

## Drude Powershell Module
**Drude Powershell module** is just a collection of PowerShell commands that works the same as in original [Drude](https://github.com/blinkreaction/drude). 

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
help dsh-bash -examples
```

## List of containers that works out-of-box in `docker-compose.yml`
- `web` - Apache2 v2.2.22
- `cli` - Debian v8.4 + PHP v5.6.20 
<br/>
It's actually real Debian with some preinstalled command line apps like `drush`, `drupal console`, etc. It's also used as PHP interpriter for `web` container.
- `db` - MySQL v5.5.46
- `browser` - Selenium 2.47.1 + Firefox headless browser
- `solr` - Apache Solr v3.6.2
- `memcached` - Memcached v3.0.8

## Documentation: 
- [How to setup Docker on Windows 10.](https://github.com/fat763/dwnd/blob/master/docs/setup.md)
- [Drude Powershell Module usage](https://github.com/fat763/dwnd/blob/master/docs/usage.md)
- (TBD) How to create new project based on DWND
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
