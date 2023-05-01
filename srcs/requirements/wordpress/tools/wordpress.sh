#!/bin/sh
php-fpm8 -F
#cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --path=/var/www/html --locale=ko_KR
wp config create --path=/var/www/html --dbname=wordpress --dbuser=jayoon --dbpass=1234 --dbhost=mysql:3306

