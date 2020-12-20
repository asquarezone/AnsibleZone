#!/bin/bash
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y
sudo apt-get install tomcat8 -y
sudo -i # become a root user
cd /var/lib/tomcat8/webapps
wget https://referenceappkhaja.s3-us-west-2.amazonaws.com/gameoflife.war
# Now navigate to http://publicip:8080/gameoflife