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

echo "---- Installing Wine"
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
apt-get -y install ttf-mscorefonts-installer
apt-get -y install wine

echo "---- Installing OpenJDK"
apt-get -y install openjdk-7-jdk
# adb
apt-get -y install libc6:i386 libstdc++6:i386
# aapt
apt-get -y install zlib1g:i386


echo "---- Installing Android SDK"
wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz -P /home/vagrant
# as vagrant user
su vagrant -l -c 'cd /home/vagrant && tar -xvf android-sdk_r24.4.1-linux.tgz'
rm /home/vagrant/android-sdk_r24.4.1-linux.tgz
su vagrant -l -c 'cd /home/vagrant/android-sdk-linux/tools && ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | ./android update sdk -u --all --filter platform-tool,android-19,android-20,android-21,android-22,android-23,build-tools-23.0.3'
# add paths
echo $'\n\nexport ANDROID_HOME=$HOME/android-sdk-linux' >> /home/vagrant/.bashrc
echo $'\nPATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools\n' >> /home/vagrant/.bashrc
su vagrant -l -c 'source /home/vagrant/.bashrc'

#### export ANDROID_HOME=$HOME/android-sdk-linux
#### export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
### --filter platform-tool,android-19,sysimg-19,build-tools-19.0.1

# echo "---- Installing MongoDB 3.2.0"
# apt-get install -y mongodb-org=3.2.0 mongodb-org-server=3.2.0 mongodb-org-shell=3.2.0 mongodb-org-mongos=3.2.0 mongodb-org-tools=3.2.0
# service mongod stop

echo "---- Installing Git"
apt-get install git -y > /dev/null

echo "---- Installing Nodejs v5"
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs

echo "---- Install global Nodejs depencencies"
npm install -g npm_lazy
npm install -g npmrc
npm install -g jshint
npm install -g gulp@3.9.x gulp-watch@4.3.x gulp-util@3.0.x gulp-livereload@3.8.x gulp-jshint@2.0.x gulp-csslint@0.2.x
npm install -g http-server
npm install -g watchalive
npm install -g mocha chai
npm install -g zombie@4.2.x
npm install -g done-serve@0.1.x
npm install -g yo@1.7.x
npm install -g donejs@0.8.x
npm install -g steal-tools@0.15.x
npm install -g cordova ionic