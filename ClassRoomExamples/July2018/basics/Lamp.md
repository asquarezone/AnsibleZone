Installation from https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04

1. sudo apt-get update
    package update
2. sudo apt-get install apache2
   installing apache server
3. sudo systemctl restart apache2
   restart apache service
4. sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
   install php modules
5. sudo systemctl restart apache2
   restart apache service
6. create file @ /var/www/html/info.php
   <?php
phpinfo();
?>
 create a home page


 For Centos

 1. sudo yum install httpd
 2. sudo systemctl start httpd
 3. sudo yum install php php-mysql
 4. sudo systemctl restart httpd