#!/usr/bin/env bash
#
# Author:      Taco Bakker
#
# Purpose:	   Provision a VM with Jenkins running in a Docker container.
#              

echo   
echo "**********************************************************************"
echo "*                                                                    *"
echo "*        Update your local package index                             *"  
echo "*                                                                    *"                                                   
echo "**********************************************************************" 
echo

apt-get -y update
apt-get install -y vim

echo   
echo "************************************************"
echo "*                                              *"
echo "*             INSTALL jre                      *"  
echo "*                                              *"  
echo "************************************************" 
echo

apt-get install -y default-jre
JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
export JAVA_HOME

echo   
echo "**********************************************************************"
echo "*                                                                    *"
echo "* Install & configure docker                                         *"  
echo "*                                                                    *"  
echo "**********************************************************************" 
echo

apt-get install -y linux-image-generic-lts-trusty
apt-get install -y curl
curl -sSL https://get.docker.com/ | sh
usermod -aG docker ubuntu
docker -v

echo   
echo "**********************************************************************"
echo "*                                                                    *"
echo "* Pull the jenkins image from Dockerhub and start it                 *"  
echo "*                                                                    *"  
echo "**********************************************************************" 
echo

docker pull jenkins
docker run --name myjenkins -p 8080:8080 -v /var/jenkins_home jenkins

echo   
echo "**********************************************************************"
echo "*                                                                    *"
echo "* Download the CLI                                                   *"  
echo "*                                                                    *"  
echo "**********************************************************************" 
echo

cd /home/vagrant
wget http://192.168.33.66:8080/jnlpJars/jenkins-cli.jar

ifconfig
exit 0