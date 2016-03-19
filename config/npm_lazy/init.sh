#!/bin/sh
sudo sed -i -e '$i \nohup sh /home/vagrant/.npm_lazy_config/npm_lazy.sh &\n' /etc/rc.local