#!/bin/bash

useradd -m newuser
chown -R newuser:newuser /var/www/artclave.42.fr

touch myownlogs.txt
chmod 644 myownlogs.txt
echo "before run time" > myownlogs.txt

if [ ! -f /var/www/artclave.42.fr/wp-config.php ]; then
	echo "FIRST CONFIG" >> myownlogs.txt
	gosu newuser sh -c "cd /var/www/artclave.42.fr && \
						curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
						chmod +x wp-cli.phar && \
						./wp-cli.phar core download && \
						./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_ADMIN --dbpass=$DB_ADMIN_PW --dbhost=mariadb && \
						./wp-cli.phar config set WP_DEBUG true --raw && \
						./wp-cli.phar core install --url=localhost --title=inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PW --admin_email=$WP_ADMIN_EMAIL && \
						./wp-cli.phar user create $WP_USER2 $WP_USER2_EMAIL --role=subscriber --user_pass=$WP_USER2_PD"

chown -R www-data:www-data /var/www/artclave.42.fr

php-fpm8.2 -F