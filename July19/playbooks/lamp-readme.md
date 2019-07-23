# Lamp Stack

1. Reference: https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04

2. Raw Commands ubuntu:
```
sudo apt-get update
sudo apt-get install apache2
sudo systemctl restart apache2
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
```
3. Raw Commands Centos:
```
sudo yum install httpd
sudo systemctl restart httpd
sudo yum install php php-mysql

```
