#!/bin/bash
echo "Welcome to the installation.."
sudo apt-get update -y
sudo apt-get install htop nginx php5.6-cli php5.6-curl php5.6-dev php5.6-fpm php5.6-gd php5.6-mysql php5.6-mcrypt php5.6-opcache php-mbstring php5.6-mbstring php5.6-sybase vsftpd freetds-common libsybdb5 php-gettext mariadb-server mariadb-client unzip varnish ufw -y
sudo service php5.6-fpm restart
sudo service nginx restart
sudo service varnish restart
sudo rm /etc/nginx/sites-available/default
sudo cp default /etc/nginx/sites-available/default
sudo rm /etc/nginx/nginx.conf
sudo cp nginx.conf /etc/nginx/nginx.conf
sudo cp cloudflare /etc/nginx/conf.d/cloudflare
sudo service nginx restart
sudo rm /etc/php/5.6/fpm/php.ini
sudo cp php.ini /etc/php/5.6/fpm/php.ini
sudo service php5.6-fpm restart
sudo rm /etc/php/5.6/fpm/pool.d/www.conf
sudo cp www.conf /etc/php/5.6/fpm/pool.d/www.conf
sudo service php5.6-fpm restart
sudo rm /etc/default/varnish
sudo cp varnish /etc/default/varnish
sudo rm /etc/varnish/default.vcl
sudo cp default.vcl /etc/varnish/default.vcl
sudo rm /etc/vsftpd.conf
sudo cp vsftpd.conf /etc/vsftpd.conf
sudo rm /lib/systemd/system/varnish.service
sudo cp varnish.service /lib/systemd/system/varnish.service
sudo cp /lib/systemd/system/varnish.service /etc/systemd/system/
sudo systemctl daemon-reload
#sudo sed -i 's/6081/80/g' /etc/systemd/system/varnish.service
touch /etc/vsftpd.allowed_users
sudo service varnish restart
sudo rm /var/www/html/index.nginx-debian.html
sudo cp index.php /var/www/html/index.php
echo "nginx with php5.6 installed on port 8080.."
sudo sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 8080
sudo ufw allow 9921
ufw allow 12000:12010/tcp
sudo ufw enable
sudo rm cloudflare
sudo rm default
sudo rm default.vcl
sudo rm fresh-install.sh
sudo rm install.sh
sudo rm my.cnf
sudo rm nginx.conf
sudo rm php.ini
sudo rm varnish
sudo rm varnish.service
sudo rm www.conf
sudo rm vsftp.conf
sudo mkdir /var/www/.ssh
sudo chown www-data:www-data /var/www/.ssh -R
sudo sudo apt-get update -y
#sudo apt-get install phpmyadmin -y
