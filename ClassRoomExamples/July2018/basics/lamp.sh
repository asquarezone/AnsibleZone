sudo apt-get update
sudo apt-get install apache2 -y
sudo systemctl restart apache2
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql -y
sudo systemctl restart apache2
echo  '<?php phpinfo(); ?>' >> /var/www/html/info.php
 