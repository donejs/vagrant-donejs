# A DoneJS development environment

This Vagrant-Box supports **Virtualbox** and **VMWare**.

## The box comes with Ubuntu-14.04.3 LTS and provides:
* Git v.1.9.1
* NodeJS v.5.x

### Pre-installed node webservers
* http-server
* done-serve v.0.1.x
* watchalive

### Pre-installed node modules
* Gulp v.3.9.x + Gulp-Livereload v.3.8.x
* Yoeman v.1.5.x
* DoneJS v.0.7.x
* Steal-tools v.0.15.x


## The following configurations are set as default:
* port forwarding 8080 -> 8080 for [*http-server*](https://www.npmjs.com/package/http-server)
* port forwarding 3030 -> 3030 for [*done-serve*](https://github.com/donejs/done-serve)
* port forwarding 7000 -> 7000 for [*watchalive*](https://github.com/whitecolor/watchalive)
* port forwarding 35729 -> 35729 for *gulp-livereload*
* port forwarding 8012 -> 8012 for [*steal-live-reload*](http://stealjs.com/docs/steal.live-reload.html)
* The guest machine has the static IP **192.168.33.10**


## Read the Wiki for
1. [Install and Setup](https://github.com/donejs/donejs-vagrant/wiki/1.-Install-and-Setup)
2. [Configure your shared folders](https://github.com/donejs/donejs-vagrant/wiki/2.-Configure-your-shared-folders)
3. [Launching the Vagrant Box](https://github.com/donejs/donejs-vagrant/wiki/3.-Launching-the-Vagrant-Box)
4. [Connecting to the Vagrant Box](https://github.com/donejs/donejs-vagrant/wiki/4.-Connecting-to-the-Vagrant-Box)


## Internals
* This Gitub reposotory is linked to the public [Juke/DoneJS](https://atlas.hashicorp.com/Juke/boxes/DoneJS) Box.
* Automatically rebuild this Box when commit changes
* Using Packer v.0.9.0
* Current Juke/DoneJS Box Version: 3.0.5