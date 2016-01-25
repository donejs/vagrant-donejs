#!/bin/bash
#
# Setup the the box. This runs as root

# create MongoDB source list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

apt-get -y update

apt-get -y install curl

# You can install anything you need here.

echo "Installing MongoDB 3.2.0"
apt-get install -y mongodb-org=3.2.0 mongodb-org-server=3.2.0 mongodb-org-shell=3.2.0 mongodb-org-mongos=3.2.0 mongodb-org-tools=3.2.0
service mongod stop

echo "Installing Git"
apt-get install git -y > /dev/null

echo "Installing Nodejs v5"
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs

echo "Install global depencencies"
npm install -g gulp@3.9.x gulp-watch@4.3.x gulp-util@3.0.x gulp-livereload@3.8.x
npm install -g http-server
npm install -g yo@1.5.x
npm install -g donejs@0.6.x