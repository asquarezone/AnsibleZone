#!/bin/bash
WEB_DESIGN_ZIP='https://www.free-css.com/assets/files/free-css-templates/download/page295/antique-cafe.zip'
SITE_NAME='cafe'
sudo apt update
sudo apt install nginx -y
cd /tmp
wget $WEB_DESIGN_ZIP
sudo apt install unzip -y
unzip antique-cafe.zip
sudo mv 2126_antique_cafe/ /var/www/html/$SITE_NAME