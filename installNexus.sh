#!/bin/bash      
#title           : Install Nexus server
#description     : Execute this script as root user
#author		       : Mthun Technologies
#date            : 08112012
#version         : 1.0    
#usage		       : sh nexusInstall.sh
#CopyRights      : Mithun Technologies
#Contact         : 9980923226 | devopstrainingblr@gmail.com

sudo cd /opt
sudo yum install tar wget -y
#wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz
wget http://download.sonatype.com/nexus/3/nexus-3.15.2-01-unix.tar.gz

tar -zxvf nexus-3.15.2-01-unix.tar.gz
mv /opt/nexus-3.15.2-01 /opt/nexus

#As a good security practice, Nexus is not advised to run nexus service as a root user, so create a new user called nexus and grant sudo access to manage nexus services as follows
useradd nexus

#Give the sudo access to nexus user
visudo
nexus   ALL=(ALL)       NOPASSWD: ALL

#Change the owner and group permissions to /opt/nexus and /opt/sonatype-work directories.
chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /opt/sonatype-work

#Open /opt/nexus/bin/nexus.rc file, uncomment run_as_user parameter and set it as following.
vi /opt/nexus/bin/nexus.rc

#Add nexus as a service at boot time
ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

#Switch as a nexus user and start the nexus service as follows.

su - nexus
systemctl start nexus 
#Enable the nexus services
systemctl enable nexus


Troubleshooting
---------------

nexus service is not starting?

a)make sure need to change the ownership and group to /opt/nexus and /opt/sonatype-work directories for nexus user.
b)make sure you are trying to start nexus service with nexus user.
c)check java is installed or not using java -version command.

Unable to access nexus URL?

a)make sure port 8081 is opened in security group in AWS ec2 instance.