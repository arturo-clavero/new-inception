#!/bin/bash

if ! id "newuser" &>/dev/null; then
	useradd -m newuser
fi

chown -R newuser:newuser /var/www/${DOMAIN_NAME}

db_name=$(./get_credentials.sh "DATABASE_NAME")
db_admin=$(./get_credentials.sh "DATABASE_ADMIN")
db_admin_pw=$(cat /run/secrets/db_admin_pw)
wp_admin=$(./get_credentials.sh "WORDPRESS_ADMIN_USERNAME")
wp_admin_pw=$(./get_credentials.sh "WORDPRESS_ADMIN_PASSWORD")
wp_admin_email=$(./get_credentials.sh "WORDPRESS_ADMIN_EMAIL")
wp_user=$(./get_credentials.sh "WORDPRESS_USER2_USERNAME")
wp_user_pw=$(./get_credentials.sh "WORDPRESS_USER2_PASSWORD")
wp_user_email=$(./get_credentials.sh "WORDPRESS_USER2_EMAIL")

if [ ! -f /var/www/${DOMAIN_NAME}/wp-config.php ]; then
	gosu newuser sh -c "cd /var/www/${DOMAIN_NAME} && \
						curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
						chmod +x wp-cli.phar && \
						./wp-cli.phar core download && \
						./wp-cli.phar config create --dbname=$db_name --dbuser=$db_admin --dbpass=$db_admin_pw --dbhost=mariadb && \
						./wp-cli.phar config set WP_DEBUG true --raw && \
						./wp-cli.phar core install --url="https://artclave." --title=inception --admin_user=$wp_admin --admin_password=$wp_admin_pw --admin_email=$wp_admin_email && \
						./wp-cli.phar user create $wp_user $wp_user_email --role=$WP_USER_ROLE --user_pass=$wp_user_pw"
fi
chown -R www-data:www-data /var/www/${DOMAIN_NAME}

exec php-fpm8.2 -F