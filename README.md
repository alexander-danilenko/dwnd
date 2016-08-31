# DWND = **D**rude on **W**indows **N**ative **D**ocker

If you are happy *Mac* or *Linux* user - you can close this page, there is no helpful information for you, just do what you do as before, you rocks! :) 

But if you are Microsoft Windows user - this repo is exactly what you have looked for if you wanted to run your local web-development environment using Docker.

As you probably know it's pretty painfull to install and work with [Drude (Docker environment for Drupal)](https://github.com/blinkreaction/drude) on Windows. This hell with Vagrant and VirtualBox versions, virtual filesystems, very looong start/stop of containers because of complexity of Drude. Well, it's not a problem anymore! We can just use Drude's Docker containers in *Native Docker for Windows* and do whatever we want manually! Yay! If you are geek - you will love it, I promise.

## Blah blah blah, show me some useful things
Here you go: [link here](https://google.com)

### What is this project about
This project is just a working example of web developer's local environment based on Windows Docker. Also it contains some documentation and useful tips. In general - it's just `docker-compose.yml` temlate with some useful things that i'm using for my projects. That's it.

### For who this project was created?
- First of all - for myself. I'm using this template for each project that i'm working on
- For web (especially [Drupal](https://drupal.org)) developers that uses Windows 10
- For people who wants to use Docker as environment for local development but don't want to spend so much time for learning docker

### Requirements for running Drude on Windows:
1. Windows 10 Professional / Enterprise / Education.
</br>
`Standard editions will not work with Native Docker because of missing Hyper-V in them` ([see details here](https://msdn.microsoft.com/en-us/virtualization/hyperv_on_windows/quick_start/walkthrough_compatibility)).
<br/>
I'm very sorry if you find this information for a first time and realized that you want to buy (he-he) Windows 10 Professional. 
2. Hands
3. Patience

## Documentation: 
- For busiest people on planet. In short about all.
- How to setup Docker on Windows 10.
- How to use Docker on Windows 10.
- (TBD) How to configure your own `docker-compose.yml`
- (TBD) How to add some new containers.
- (TBD) How to setup Drupal using this template
- (TBD) How to setup Wordpress using this template
- (TBD) How to setup Joomla! using this template
- (TBD) How to run Behat tests.
