# Usage of Docker on windows

This doc assumes that you already installed docker for windows, shared some resources and drives and ready to run some things in docker. It's pretty basic description of everything, but it would be enough for developers who don't want to dive into Docker.

## Starting of containers
1. Open `powershell` and navigate to `docker-compose.yml` folder that is placed in root of this repo.
2. Execute in `powershell`: 
<pre>docker-compose up -d</pre>

Well, that's pretty it. Let's see what we have done:
- `docker-compose.yml` is a standard YAML file with description of all containers that you are going to run via docker-compose command. It contains docker containers that was created by FFW (ex BlinkReaction team). All these containers are placed on Docker Hub and can be easily found here: [https://hub.docker.com/u/blinkreaction/](https://hub.docker.com/u/blinkreaction/)
- `docker-compose` is an app in docker package which can pick up all containers from YAML file and do some magic based on that file's content.
- `-d` flag means that we want to launch all containers detached and do not print all logs to current `powershell` window. 

## Stopping of containers
1. Open `powershell` and navigate to `docker-compose.yml` folder that is placed in root of this repo.
2. Execute in `powershell`: 
<pre>docker-compose stop</pre>

## Restarting of containers
1. Open `powershell` and navigate to `docker-compose.yml` folder that is placed in root of this repo.
2. Execute in `powershell`: 
<pre>docker-compose restart</pre>
**Please note** that restarting of containers is not using `docker-compose.yml`, it just restarting already started containers. If you made some changes in `docker-compose.yml` file - you need to stop containers and run them again.

## Getting status of containers
For making sure that containers works good - you can check their statuses.

1. Open `powershell` and navigate to `docker-compose.yml` folder that is placed in root of this repo.
2. Execute in `powershell`: 
<pre>docker-compose ps</pre>

You should see information like this: 
<pre>
      Name                    Command               State                    Ports
----------------------------------------------------------------------------------------------------
dwnd_browser_1     /opt/bin/entry_point.sh          Up      4444/tcp
dwnd_cli_1         /opt/startup.sh gosu root  ...   Up      22/tcp, 9000/tcp
dwnd_db_1          /entrypoint.sh mysqld            Up      0.0.0.0:3306->3306/tcp
dwnd_memcached_1   docker-entrypoint.sh memcached   Up      0.0.0.0:11211->11211/tcp
dwnd_solr_1        java -jar start.jar              Up      8983/tcp
dwnd_web_1         /opt/startup.sh apache2 -D ...   Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp
</pre> 

Let's see in details what we got here: 
- `Name` is container name. As we are using `docker-compose` it automatically creates for us unique names with prefixes and suffixes for each container. `dwnd` here is just a folder name. All special charachters and spaces will be removed from folder name. It means that if you have `docker-compose.yml` file in folder `dwnd-1.0` you will get container names starting from `dnwd10_CONTAINERNAME_1`.
- `Command` is actual command that was triggered on container start. For example in `web` container (with Apache server) starting command is about starting Apache server service.
- `State` is indicator of current status of container. It can have next statuses:
    - `Up` - It works good
    - `Exit 0` - Container stopped
    - `Exit 1` - There are some problems and container's failed when tried to start. Usually it means that container can't use needed port because it's already in use of Windows. For example `web` container can have this state because you already have **Skype, Apache or IIS running on 80 and 443 ports**.
- `Ports` contains information about container's used ports. 
    - `4444/tcp` means that `4444` port is used for container only in container's inner network and it can be reached only from another container. 
    - `0.0.0.0:3306->3306` means that container's `3306` port forwarded to your Windows `3306` port. In short - you can connect to database using any Windows application with `host` = `localhost`. For root password - see `db`'s container section in `docker-compose.yml`

## Getting container's unique name
Unique names of containers allows us to iteract with some individual container, for example run interactive terminal session or execute commands.
For example let's find unique name of `cli` container:
1. Open `powershell` and navigate to `docker-compose.yml` folder that is placed in root of this repo.
2. Run containers and let's see `cli` container's unique name. For this run in `powershell`: 
<pre>docker-compose ps cli</pre>
You will see information like this: 
<pre>
   Name                 Command               State        Ports
----------------------------------------------------------------------
dwnd_cli_1   /opt/startup.sh gosu root  ...   Up      22/tcp, 9000/tcp
</pre>
Yay, we got unique name of `cli` container! It's `dwnd_cli_1`.

## Getting into container's bash terminal
So, just starting and stopping containers is not so fun as it was before. Let's just run `cli` container's bash terminal and do whatever we want from there. `cli` container is used for handling as many console things that will be heplful for work as possible. For example `cli` container already have `drush` and `drupal console`, some `nodejs`, `ruby` and many other things. It means that you will not want to install all these things into your Windows system, they are all in here, in `cli` container.

It's pretty easy to initiate interactive terminal session:  

1. Open `powershell` and navigate to `docker-compose.yml` folder that is placed in root of this repo.
2. Get unique name of `cli` container. `cli` container have almost everything you need for developing
3. Run interactive shell session with needed container. 
<pre>docker exec -it dwnd_cli_1 bash</pre>
Where `dwnd_cli_1` is unique container name of `cli` container. 

You should see next lines which means - you are in<pre>docker@cli:/var/www$</pre>

You can play with cli container: install apps using Ubuntu's `sudo apt-get`, do some experiments and do whatever you want. And don't be afraid to break something, you always can drop `cli` container and start it from scratch.

## Dropping of containers
As you probably know - all containers are some kind of `ephemeral` and can be easily dropped and started from scratch in a few seconds. Dropping of containers means that `all data in containers will be lost` and on next start of containers they will not have any of your changes, just like you installed this containers from scratch. 
<br />
<br />
**Example**: in `docker-compose.yml` we have `db container` which brings to us MySQL database. If we drop `db container` we will loose all data in that container that we created manually. Other words - there will be no MySQL databases after fropping of `db` container. So use containers dropping very carefully, you may lose your databases and data.

1. Open `powershell` and navigate to `docker-compose.yml` folder that is placed in root of this repo.
2. If you want to drop all containers that described in `docker-compose.yml` file - just execute in `powershell`
<pre>docker-compose down</pre>
But if you want to drop some 
**Warning:** After dropping of containers all data in your database and other services that are in containers (like Apache Solr, memcache, etc.) will be lost.