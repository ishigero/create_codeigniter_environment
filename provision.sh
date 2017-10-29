#!/bin/bash
sudo apt-get install -y language-pack-en-base
sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update && sudo apt-get upgrade
sudo apt-get -y install git zip apache2 php7.0 php7.0-cli php7.0-fpm php7.0-gd php7.0-json php7.0-mysql php7.0-readline  php7.0-mysql libapache2-mod-php7.0 
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password Password1'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password Password1'
sudo apt-get -y install mysql-server
sudo mv my.cnf /etc/mysql/
sudo chown root:root /etc/mysql/my.cnf
sudo service mysql restart
sudo mv project.conf /etc/apache2/sites-available/
sudo chown root:root /etc/apache2/sites-available/project.conf
sudo a2dissite 000-default
sudo a2ensite project
sudo a2enmod rewrite
sudo service apache2 restart
mv composer.json /home/vagrant/work
mysql -u root -pPassword1 < init.sql
cd /home/vagrant/work
composer install
mkdir public
mv vendor/codeigniter/framework/application ./
mv ~/index.php public
mv ~/.htaccess public
mv ~/config.php application/config
mv ~/database.php application/config



