#!/bin/bash

if ! id "newuser" &>/dev/null; then
	useradd -m newuser
fi

chown -R newuser:newuser /var/www/${DOMAIN_NAME}

touch mylogs.txt
chmod +x mylogs.txt

db_admin_pw=$(cat /run/secrets/db_admin_pw)
echo "received $db_admin_pw" >> mylogs.txt

echo "sent DATABASE_NAME" >> mylogs.txt
db_name=$(./get_credentials.sh "DATABASE_NAME")
echo "received $db_name" >> mylogs.txt

echo "sent DATABASE_ADMIN" >> mylogs.txt
db_admin=$(./get_credentials.sh "DATABASE_ADMIN")
echo "received $db_admin" >> mylogs.txt

echo "sent WORDPRESS_ADMIN_USERNAME" >> mylogs.txt
wp_admin=$(./get_credentials.sh "WORDPRESS_ADMIN_USERNAME")
echo "received $wp_admin" >> mylogs.txt

echo "sent DATABASE_NAME" >> mylogs.txt
wp_admin_email=$(./get_credentials.sh "WORDPRESS_ADMIN_EMAIL")
echo "received $wp_admin_email" >> mylogs.txt

echo "sent WORDPRESS_USER2_USERNAME" >> mylogs.txt
wp_user=$(./get_credentials.sh "WORDPRESS_USER2_USERNAME")
echo "received $wp_user" >> mylogs.txt

echo "sent WORDPRESS_USER2_EMAIL" >> mylogs.txt
wp_user_email=$(./get_credentials.sh "WORDPRESS_USER2_EMAIL")
echo "received $wp_user_email" >> mylogs.txt

if [ ! -f /var/www/${DOMAIN_NAME}/wp-config.php ]; then
	gosu newuser sh -c "cd /var/www/${DOMAIN_NAME} && \
						curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
						chmod +x wp-cli.phar && \
						./wp-cli.phar core download && \
						./wp-cli.phar config create --dbname=$db_name --dbuser=$db_admin --dbpass=$db_admin_pw --dbhost=mariadb && \
						./wp-cli.phar config set WP_DEBUG true --raw && \
						./wp-cli.phar core install --url="https://artclave." --title=inception --admin_user=$wp_admin --admin_password=$wp_admin_pw --admin_email=$wp_admin_email && \
						./wp-cli.phar user create $wp_user $wp_user_email --role=$WORDPRESS_USER2_ROLE --user_pass=$wp_user_pw"
fi
chown -R www-data:www-data /var/www/${DOMAIN_NAME}

exec php-fpm8.2 -F