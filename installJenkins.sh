
Skip to content

    Pull requests
    Issues
    Marketplace
    Explore

    @devopstrainingblr

0
0

    0


#!/bin/bash      
#title           : Install Jenkins server
#description     : Execute this script as root user
#author		     : Mthun Technologies
#date            : 08112012
#version         : 1.0    
#usage		     : sh jenkinsInstall.sh
#CopyRights      : Mithun Technologies
#Contact         : 9980923226 | devopstrainingblr@gmail.com

#It is going to install the jenkins
#yum install jenkins -y

cd /opt
echo 'Jenkins Installation started.'
echo '-----------------------------'
sudo yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y

sudo systemctl start jenkins.service

#(OR)
#service jenkins start

#systemctl stop jenkins.service
#(OR)
#service jenkins stop

#systemctl restart jenkins.service
#(OR)
#service jenkins restart

# enable the service to start with system startup;
sudo systemctl enable jenkins.service     


echo 'Jenkins Installation done.'
echo '--------------------------'
#By default jenkins runs at port 8080, You can access jenkins at
#http://HostName:8080

 