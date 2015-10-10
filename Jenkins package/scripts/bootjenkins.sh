#!/usr/bin/env bash
#
# Author:      Taco Bakker
#
# Purpose:	   Provision a VM with Jenkins running on it.
#              
# Description: The standard out-of-the box Debian package installation is done
#


# This is the Debian package repository of Jenkins to automate installation and upgrade. 
# To use this repository, first add the key to your system:
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
# Then add the following entry in your /etc/apt/sources.list:
echo "deb http://pkg.jenkins-ci.org/debian binary/" >> /etc/apt/sources.list


echo   
echo "**********************************************************************"
echo "*                                                                    *"
echo "* Update Update your local package index and                         *"  
echo "* install jenkins                                                    *"  
echo "* start the jenkins service                                          *"
echo "*                                                                    *" 
echo "**********************************************************************" 
echo

apt-get -y update
apt-get install -y vim
apt-get install -y jenkins
service jenkins start


ifconfig
exit 0