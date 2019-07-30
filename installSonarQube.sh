#Login as a root user.
sudo su -

#Download the SonarqQube Server software.
cd /opt
yum install wget unzip -y
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.6.zip
unzip sonarqube-7.6.zip


#As a good security practice, SonarQuber Server is not advised to run sonar service as a root user, so create a new user called sonar and grant sudo access to manage nexus services as follows
useradd sonar

#Give the sudo access to sonar user
visudo

sonar   ALL=(ALL)       NOPASSWD: ALL

#Change the owner and group permissions to /opt/sonarqube-7.6/ directory.

chown -R sonar:sonar /opt/sonarqube-7.6/
chmod -R 775 /opt/sonarqube-7.6/
su - sonar
cd /opt/sonarqube-7.6/bin/linux-x86-64/

./sonar.sh start


Troubleshooting
---------------

sonar service is not starting?

a)make sure you need to change the ownership and group to /opt/sonarqube-7.6/ directory for sonar user.
b)make sure you are trying to start sonar service with sonar user.
c)check java is installed or not using java -version command.

Unable to access SonarQube server URL in browser?

a)make sure port 8081 is opened in security group in AWS ec2 instance.



#Create SonarQube server as a sonar service

ln /opt/sonarqube-7.6/bin/linux-x86-64/sonar.sh /etc/init.d/sonar

sudo vi /etc/init.d/sonar

#add below lines in /etc/init.d/sonar

SONAR_HOME=/opt/sonarqube-7.6
PLATFORM=linux-x86-64

WRAPPER_CMD="${SONAR_HOME}/bin/${PLATFORM}/wrapper"
WRAPPER_CONF="${SONAR_HOME}/conf/wrapper.conf"
PIDDIR="/opt/sonarqube-7.6/"

#Start the sonar service
systemctl start sonar

#Check the status of the  sonar service
systemctl status sonar

#Enable the sonar service
systemctl enable sonar
