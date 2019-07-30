#!/bin/bash      
#title           : Install Apache Tomcat Server
#description     : Execute this script as root user
#author		     : Mthun Technologies
#date            : 08112012
#version         : 1.0    
#usage		     : sh tomcatInstall.sh
#CopyRights      : Mithun Technologies
#Contact         : 9980923226 | devopstrainingblr@gmail.com

sudo yum install wget unzip -y
cd /opt
sudo wget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.20/bin/apache-tomcat-9.0.20.zip
sudo unzip apache-tomcat-9.0.20.zip
cd /opt/apache-tomcat-9.0.20/bin
sudo chmod u+x *.sh

#sh /opt/apache-tomcat-9.0.20
/bin/startup.sh

sudo ln -s /opt/apache-tomcat-9.0.20/bin/startup.sh /usr/bin/startTomcat
sudo ln -s /opt/apache-tomcat-9.0.20/bin/shutdown.sh /usr/bin/stopTomcat

#ps -fax | grep tomcat
#netstat -tunlap
#vi /opt/apache-tomcat-9.0.16/webapps/manager/META-INF/context.xml
#Comment the below lines
#<!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve"
#         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" /> -->
		 
sudo startTomcat
#stopTomcat