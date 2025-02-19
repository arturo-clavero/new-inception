#!/bin/bash

useradd -m newuser
chown -R newuser:newuser /var/www/artclave.42.fr

gosu newuser sh -c "cd /var/www/artclave.42.fr && \
					curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
					chmod +x wp-cli.phar && \
					./wp-cli.phar core download && ./wp-cli.phar config create --dbname=wordpress --dbuser=artclave --dbpass=123 --dbhost=mariadb && \
					./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com && \
					./wp-cli.phar user create JustAPeasant user@gmail.com --role=subscriber --user_pass=other"


# gosu newuser sh -c "cd /tmp && \
# 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
# 	chmod +x wp-cli.phar && \
# 	./wp-cli.phar core download && \
# 	./wp-cli.phar config create --dbname=wordpress --dbuser=artclave --dbpass=123 --dbhost=mariadb && \
# 	./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com && \
# 	./wp-cli.phar user create JustAPeasant user@gmail.com --role=subscriber --user_pass=other"

# cp -r /tmp/wp-content /var/www/artclave.42.fr/
# cp /tmp/wp-config.php /var/www/artclave.42.fr/
# cp /tmp/index.php /var/www/artclave.42.fr/
# cp /tmp/wp-login.php /var/www/artclave.42.fr/
# cp /tmp/wp-trackback.php /var/www/artclave.42.fr/
# cp /tmp/xmlrpc.php /var/www/artclave.42.fr/
# cp -r /tmp/wp-admin /var/www/artclave.42.fr/
# cp -r /tmp/wp-includes /var/www/artclave.42.fr/

chown -R www-data:www-data /var/www/artclave.42.fr

php-fpm8.2 -F