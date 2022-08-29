#!/bin/bash
sudo yum update
sudo yum -y install java-1.8* java-11* git 
sudo git clone https://github.com/NAZIYASHAIK1695/apache-tomcat-7.0.94-.git
sudo cd apache-tomcat-7.0.94/bin
sudo ./startup.sh 
