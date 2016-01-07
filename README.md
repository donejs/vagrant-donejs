## A DoneJS development environment

This Vagrant-Box supports **Virtualbox** and **VMWare**.

#### The box comes with Ubuntu-14.04.3 LTS and provides:
* Git v.1.9.1
* MongoDB v.3.2.0
* NodeJS v.0.12.x
* Gulp v.3.9.x + Gulp-Livereload v.3.8.x
* Yoeman v.1.5.x
* Http-Server
* Steal-tools v.0.13.x

#### The following configurations are set as default:
* port forwarding 8080 -> 8080 for *http-server*
* port forwarding 35729 -> 35729 for *gulp-livereload*
* port forwarding 27017 -> 27017 for *MongoDB*
* The guest machine has the static IP **192.168.33.10**


#### Install and Setup
*This setup is done with VirtualBox 5.0.10 and Vagrant 1.8.1 both on Windows 10*

**Provision**
First at all, download and install [**VirtualBox**](https://www.virtualbox.org/) and [**Vagrant**](https://www.vagrantup.com/). Once VirtualBox and Vagrant have been installed, you should add the DoneJS box to your Vagrant installation.

**Adding and run the Vagrant Box**
Within the terminal switch to the folder you would like to install the Vagrant Box. Using the following command to initialize: `vagrant init Juke/DoneJS`.
To start the virtual machine run `vagrant up`. If the box isn't downloaded yet, Vagrant will download the source from https://atlas.hashicorp.com/Juke/boxes/DoneJS. It will take a few minutes, depending on your Internet connection speed.

**Configure your shared folders**
Once the virtual machine is started and everything is fine, we have to configure your shared folders. For that, open the `Vagrantfile`-File in that folder you initialized Vagrant. Scroll down to:
```
# Share an additional folder to the guest VM. The first argument is
# the path on the host to the actual folder. The second argument is
# the path on the guest to mount the folder. And the optional third
# argument is a set of non-required options.
# config.vm.synced_folder "../data", "/vagrant_data"
```
and add this configuration below
```
config.vm.synced_folder "ABSOLUTE_PATH_TO_YOUR_SHARED_FOLDER", "/home/vagrant/FOLDERNAME"
```
For example: `config.vm.synced_folder "C:/www/donejs", "/home/vagrant/donejs"`.
To confirm the changes we have to reload the virtual machine. To do that, run `vagrant reload` in your terminal.

**Connecting via SSH**
To connect to your DoneJS environment via SSH, enter the `vagrant ssh` command in your terminal. Once you are logged in you can switch to your shared folder by `cd /home/vagrant/FOLDERNAME`. You can see all your files and directories that are stored on your Windows. Any changes on that files or directories will be synced.

**Connecting to MongoDB**
MongoDB is part of the DoneJS development environment. The MongoDB Server is running if you start the Vagrant Box.
To connect to the MongoDB Server i using [**MongoChef**](http://3t.io/mongochef/).
Add a new connection in MongoChef:

**Server:** localhost

**Port:** 27017

***Security Note: For easy connection between guest and host system, MongoDB is listen on all interfaces.***


#### Limitations
**Symbolic Links**
Support for symbolic links across synced folder implementations and host/guest combinations is not consistent. Vagrant does its best to make sure symbolic links work by configuring various hypervisors (such as VirtualBox), but some host/guest combinations still do not work properly. This can affect some development environments that rely on symbolic links.

**File-Path 255 character limit**
The file path character limit on Windows. This happens quite often if you are using a node module with long name.


#### Internals
* This Gitub reposotory is linked to the public [Juke/DoneJS](https://atlas.hashicorp.com/Juke/boxes/DoneJS) Box.
* Automatically rebuild this Box when commit changes
* Using Packer v.0.9.0-rc1
* Current Juke/DoneJS Box Version: 1.0.1


