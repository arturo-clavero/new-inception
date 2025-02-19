cd /var/www/artclave.42.fr && touch mylogs.txt && pwd > mylogs.txt

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

/wp-cli.phar core download
/wp-cli.phar config create --dbname=wordpress --dbuser=artclave --dbpass=123 --dbhost=mariadb
/wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com
