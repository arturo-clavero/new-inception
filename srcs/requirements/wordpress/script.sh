#!/bin/bash

if ! id "newuser" &>/dev/null; then
	useradd -m newuser
fi
chown -R newuser:newuser /var/www/artclave.42.fr

touch myownlogs.txt
chmod 644 myownlogs.txt
echo "before run time" > myownlogs.txt

echo "db name is  $(cat /run/secrets/db_name)" >> myownlogs.txt

db_name=$(cat /run/secrets/db_name)
db_admin=$(cat /run/secrets/db_admin)
db_admin_pw=$(cat /run/secrets/db_admin_pw)
wp_admin=$(cat /run/secrets/wp_admin)
wp_admin_pw=$(cat /run/secrets/wp_admin_pw)
wp_admin_email=$(cat /run/secrets/wp_admin_email)
wp_user=$(cat /run/secrets/wp_user)
wp_user_pw=$(cat /run/secrets/wp_user_pw)
wp_user_email=$(cat /run/secrets/wp_user_email)

ls /var/www/artclave.42.fr >> myownlogs.txt
if [ ! -f /var/www/artclave.42.fr/wp-config.php ]; then
	echo "FIRST CONFIG" >> myownlogs.txt
	gosu newuser sh -c "cd /var/www/artclave.42.fr && \
						curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
						chmod +x wp-cli.phar && \
						./wp-cli.phar core download && \
						./wp-cli.phar config create --dbname=$db_name --dbuser=$db_admin --dbpass=$db_admin_pw --dbhost=mariadb && \
						./wp-cli.phar config set WP_DEBUG true --raw && \
						./wp-cli.phar core install --url="https://artclave." --title=inception --admin_user=$wp_admin --admin_password=$wp_admin_pw --admin_email=$wp_admin_email && \
						./wp-cli.phar user create $wp_user $wp_user_email --role=subscriber --user_pass=$wp_user_pw"
fi
echo "after run time" >> myownlogs.txt
ls /var/www/artclave.42.fr >> myownlogs.txt
chown -R www-data:www-data /var/www/artclave.42.fr

php-fpm8.2 -F