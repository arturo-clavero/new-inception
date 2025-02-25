#!/bin/bash

if ! id "newuser" &>/dev/null; then
	useradd -m newuser
fi
chown -R newuser:newuser /var/www/$DOMAIN_NAME

db_name=$(cat /run/secrets/db_name)
db_admin=$(cat /run/secrets/db_admin)
db_admin_pw=$(cat /run/secrets/db_admin_pw)
wp_admin=$(cat /run/secrets/wp_admin)
wp_admin_email=$(cat /run/secrets/wp_admin_email)
wp_user=$(cat /run/secrets/wp_user)
wp_user_email=$(cat /run/secrets/wp_user_email)

while IFS='=' read -r key value; do
  if [ -n "$key" ] && [ -n "$value" ]; then
    echo "Processing secret: $key=$value"
    if [ "$key" = "WORDPRESS_ADMIN_PASSWORD" ]; then
		wp_admin_pw=$value
    elif [ "$key" = "WORDPRESS_USER2_PASSWORD" ]; then
      	wp_user_pw=$value
    fi
  fi
done < /run/secrets/wp_pws

if [ ! -f /var/www/$DOMAIN_NAME/wp-config.php ]; then
	gosu newuser sh -c "cd /var/www/$DOMAIN_NAME && \
						curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
						chmod +x wp-cli.phar && \
						./wp-cli.phar core download && \
						./wp-cli.phar config create --dbname=$db_name --dbuser=$db_admin --dbpass=$db_admin_pw --dbhost=mariadb && \
						./wp-cli.phar config set WP_DEBUG true --raw && \
						./wp-cli.phar core install --url="https://artclave." --title=inception --admin_user=$wp_admin --admin_password=$wp_admin_pw --admin_email=$wp_admin_email && \
						./wp-cli.phar user create $wp_user $wp_user_email --role=$WORDPRESS_USER2_ROLE --user_pass=$wp_user_pw"
fi
chown -R www-data:www-data /var/www/$DOMAIN_NAME

php-fpm8.2 -F