# How to setup and use Native Docker on Windows

1. Ensure that your processor support hardware virtualization and [enable it in your BIOS](http://www.sysprobs.com/disable-enable-virtualization-technology-bios).<br/><br/>
2. **Download and install** stable version of Docker from [https://docs.docker.com/docker-for-windows/](https://docs.docker.com/docker-for-windows/)<br/><br/>
3. On first start Docker will ask you for enabling Hyper-V as it's required for native Docker (see screenshot below). Install it. It will reboot your PC and **enable Hyper-V** on your Windows. <br/><br/>
![Example of Hyper-V enabling prompt](http://armarium.org/u/2016/08/31/e81567a684e926ec29709b962ac808c5.png) <br />
**Warning**: As i said before - you need to run Windows 10 **Professional**, **Enterprise** or **Education** editions of Windows 10 because only this editions are supporting of Hyper-V.<br/><br/>
4. **Share resources of your PC with docker**. In short - more CPUs and RAM = Faster containers.  
![Example of settings page](http://armarium.org/u/2016/08/31/e0f0ce2ac9caff40e4d686874d758512.jpg) <br />
**Warning:** Selected size of RAM will be **permanently** used from your PC. It means that you will not be able to use this amount of RAM until docker is stopped. Other words - once you start docker, you system will automatically allocate selected amount of ram for Docker needs.
<br />
We are web developers, right? It means that we need to run some cool things like PHPStorm and Google Chrome, which eats tons of RAM. So allocate RAM very clever. Personally i like to share all CPU cores and 1/4 of total amount of RAM.<br/><br/>
5. **Select some drives** and allow your folders from your selected drives to be mounted into containers
![Example of drive sharing settings page](http://armarium.org/u/2016/08/31/a93f88306bb541d2d3d5a0bca17be4e1.jpg) <br/><br/>
6. Run some containers.<br/><br/>
7. Now you are the rockstar! Enjoy yourself!<br/><br/>