#!/bin/bash
#
# Setup the the box. This runs as root

# MongoDB is not longer pre-installed
# create MongoDB source list
# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
# echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

apt-get -y update

apt-get -y install curl

# You can install anything you need here.

echo "Installing Wine"
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
apt-get install ttf-mscorefonts-installer
apt-get install wine

# echo "Installing MongoDB 3.2.0"
# apt-get install -y mongodb-org=3.2.0 mongodb-org-server=3.2.0 mongodb-org-shell=3.2.0 mongodb-org-mongos=3.2.0 mongodb-org-tools=3.2.0
# service mongod stop

echo "Installing Git"
apt-get install git -y > /dev/null

echo "Installing Nodejs v5"
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs

echo "Install global Nodejs depencencies"
npm install -g npm_lazy
npm install -g npmrc
npm install -g gulp@3.9.x gulp-watch@4.3.x gulp-util@3.0.x gulp-livereload@3.8.x
npm install -g http-server
npm install -g watchalive
npm install -g done-serve@0.1.x
npm install -g yo@1.5.x
npm install -g donejs@0.7.x
npm install -g steal-tools@0.15.x