#!/bin/bash
# cd /var/www/artclave.42.fr
# useradd -m newuser
# chown -R newuser:newuser /var/www/artclave.42.fr
# chown -R newuser:newuser /var/www/
# su - newuser

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar


# su - artclave

# UID=$(cat /var/wwwrtclave.42.fr/nginx-uid.txt)
# useradd -u $UID -m www-data
# su - www-data

# chown -R newuser:newuser /var/www/artclave.42.fr
# chown -R newuser:newuser /var/www/
# su - newuser

# su - newuser -c "./wp-cli.phar core download"
# su - newuser -c "./wp-cli.phar config create --dbname=wordpress --dbuser=artclave --dbpass=123 --dbhost=mariadb"
# su - newuser -c "./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com"

# ./wp-cli.phar core download
# ./wp-cli.phar config create --dbname=wordpress --dbuser=artclave --dbpass=123 --dbhost=mariadb
# ./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com

# su - root
# su - root

useradd -m -d /home/newuser newuser
chown -R newuser:newuser setup.sh
chown -R newuser:newuser /var/www/artclave.42.fr
chown -R newuser:newuser /var/www
chown -R newuser:newuser /var
chmod -R 775 /var/www/artclave.42.fr

cd /var/www/artclave.42.fr
touch mylogs.txt2 && pwd > mylogs.txt2



# gosu newuser sh -c "cd /var/www/artclave.42.fr && touch mylogs.txt && pwd > mylogs.txt"

# gosu newuser sh -c " cd /var/www/artclave.42.fr && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
# gosu newuser sh -c "cd /var/www/artclave.42.fr && chmod +x wp-cli.phar"

# gosu newuser sh -c "cd /var/www/artclave.42.fr && ./wp-cli.phar core download"
# gosu newuser sh -c "cd /var/www/artclave.42.fr && ./wp-cli.phar config create --dbname=wordpress --dbuser=artclave --dbpass=123 --dbhost=mariadb"
# gosu newuser sh -c "cd /var/www/artclave.42.fr && ./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com"
# gosu newuser ./setup.sh
gosu newuser sh -c "cd /var/www/artclave.42.fr && touch mylogs.txt && pwd >> mylogs2.txt && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && ./wp-cli.phar core download && ./wp-cli.phar config create --dbname=wordpress --dbuser=artclave --dbpass=123 --dbhost=mariadb && ./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com"
# gosu newuser sh -c "cd /var/www/artclave.42.fr && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && ./wp-cli.phar core download && ./wp-cli.phar config create --dbname=wordpress --dbuser=artclave --dbpass=123 --dbhost=mariadb && ./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com"

# sh -c -u /set.sh

php-fpm8.2 -F