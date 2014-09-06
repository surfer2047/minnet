#!/usr/bin/bash
#Author: @Manoj
#Purpose: Script to install mininet natively
#Date 4 sept 2014

 clear
echo ' '
echo 'To install Mininet you need to be ROOT user, or your username must be listed in Sudoers File'
echo ' '
echo 'To install Press "y" '
echo 'To Abort Installation press "n" '
read input
if [ $input == 'n' ] ;then
exit 1
echo 'Installation is Aborted'
else
echo "Downloading and Installing Mininet"
sudo apt-get install git >/dev/null 2>&1
echo  ' '
sudo mkdir /opt/mininet
sudo chown -R $USER /opt/mininet
sudo cd /opt/mininet
sudo git clone git://github.com/mininet/mininet /dev/null 2>&1

sudo /opt/mininet/mininet/util/install.sh  -s /opt/mininet/ -a
fi
sudo mn --test pingall /dev/null 2>&1

if [$? == 1 ] then ;
echo "Error Occoured while Testing Mininet "
exit 1
else
echo "Mininet Installed Sucessfully"
fi


