#!/bin/bash      
#title           : Install Java
#description     : 
#author		     : Mthun Technologies
#date            : 08112012
#version         : 1.0    
#usage		     : sh javaInstallation.sh
#CopyRights      : Mithun Technologies
#Contact         : 9980923226 | devopstrainingblr@gmail.com

#yum  install java-1.8.0-openjdk -y
#The java-1.8.0-openjdk package contains just the Java Runtime Environment. 
#If you want to develop Java programs then install the java-1.8.0-openjdk-devel package.
#yum install java-1.8.0-openjdk-devel -y

#http://openjdk.java.net/install/


echo 'Oracle Java Installation started.'
echo '---------------------------------'
sudo yum install wget -y
cd /opt
sudo wget http://mithuntechnologies.com/jdk-8u211-linux-x64.rpm
sudo yum install jdk-8u211-linux-x64.rpm -y
echo 'Java Installation done.'                                                                                                                             
echo '-----------------------'
java -version
