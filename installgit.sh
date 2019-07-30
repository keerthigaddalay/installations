	#!/bin/bash      
	#title           : Install Git
	#description     :
	#author		     : Mthun Technologies
	#date            : 08112012
	#version         : 1.0    
	#usage		     : sh gitInstall.sh
	#CopyRights      : Mithun Technologies
	#Contact         : 9980923226 | devopstrainingblr@gmail.com

	# Below command will install the older version
	#yum install git
 
    sudo su -
	cd /opt
	yum groupinstall "Development Tools" -y
	yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel curl-devel -y
	yum install wget tar -y
	##Open below URL and select the specific version and right click on that and click on Copy Link Address, then execute the wget command.
	##https://github.com/git/git/releases
	wget https://github.com/git/git/archive/v2.18.0.tar.gz -O git-bash.tar.gz
	tar -zxf git-bash.tar.gz

	cd git-2.18.0
	make configure
	./configure --prefix=/usr/local
	make install

	git --version

	git config --global user.name "Mithun Technologies"
	git config --global user.email "devopstrainingblr@gmail.com"
	#git config --list
	