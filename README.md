# DWND = **D**rude on **W**indows **N**ative **D**ocker

If you are happy *Mac* or *Linux* user - you can close this page, there is no helpful information for you, just do what you do as before, you rocks! :) 

But if you are Microsoft Windows user - this repo is exactly what you have looked for if you wanted to run your local web-development environment using Docker.

As you probably know it's pretty painfull to install and work with [Drude (Docker environment for Drupal)](https://github.com/blinkreaction/drude) on Windows. This hell with Vagrant and VirtualBox versions, virtual filesystems, very looong start/stop of containers because of complexity of Drude. Well, it's not a problem anymore! We can just use Drude's Docker containers in *Native Docker for Windows* and do whatever we want manually! Yay! If you are geek - you will love it, I promise.

### Requirements for running Drude on Windows:
1. Windows 10 Professional / Enterprise / Education
</br>
`Standard editions will not work with Native Docker because of missing Hyper-V in them` ([see details here](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_compatibility)).
<br/>
I'm very sorry if you find this information for a first time and realized that you want to buy (he-he) Windows 10 Professional.
2. Hardware support of virtualization technology in your processor (all modern processors support it)

## Drude installation as powershell module
- You need to allow `*.ps1` scripts to run in your system. For allowing it - just open `powershell as Administrator` and execute next: 
<pre>Set-ExecutionPolicy RemoteSigned</pre>
- Install Drude powershell module
<pre>Install-Module Drude</pre>

## Commands in Powershell module
You can get list of commands using `Get-Command dsh-*` command in powershell. Anyway, below is list of commands.

All commands should be executed in folder with `docker-compose.yml`.

- `dsh-up` - Start containers
- `dsh-down`, `dsh-stop` - Stops containers
- `dsh-restart` - Restarts containers
- `dsh-status`, `dsh-ps` - Prints status of containers 
- `dsh-logs` - Prints logs for all or needed container
- `dsh-bash` - Initiates interactive bash shell session with cli (or any) other container
- `dsh-exec` - Executes command in cli (or any) container's interactive bash shell
- `dsh-drush` - Executes drush command for needed site in needed docroot folder
- `dsh-destroy` - Drops all containers
- `dsh-reset` - Drops all containers and starts containers from scratch

For more detailed descriptions see for [Usage documentation page](https://github.com/fat763/dwnd/blob/master/docs/usage.md).

All commands are documented and you can see example of usage just use default PowerShell help: 
<pre>help dsh-bash -examples</pre>

### List of containers that works out-of-box in `docker-compose.yml`
- `web` - `Apache2 v2.2.22`
- `cli` - `Debian v8.4` + `PHP v5.6.20` 
<br/>
It's actually real Debian with some preinstalled command line apps like `drush`, `drupal console`, etc. It's also used as PHP interpriter for `web` container.
- `db` - `MySQL v5.5.46`
- `browser` - `Selenium 2.47.1` + `Firefox headless` browser
- `solr` - `Apache Solr v3.6.2`
- `memcached` - `Memcached v3.0.8`

## Documentation: 
- [How to setup Docker on Windows 10.](https://github.com/fat763/dwnd/blob/master/docs/setup.md)
- [How to use DWND on Windows.](https://github.com/fat763/dwnd/blob/master/docs/usage.md)
- (TBD) How to configure your own `docker-compose.yml`
- (TBD) How to add some new containers.
- (TBD) How to setup Drupal using this template
- (TBD) How to setup Wordpress using this template
- (TBD) How to setup Joomla! using this template
- (TBD) How to run Behat tests.
