USER www-data

cd /var/www/artclave.42.fr

wp core download
wp core config --dbname=$DB_NAME --dbuser=$DB_ADMIN --dbpass=$DB_ADMIN_PW --dbhost=mariadb:3306
wp core install --url="http://artclave.42.fr" --title="Inception my ass" --admin_user="TheGreatRuler" --admin_password="admin" --admin_email="admin@email.com"
wp user create JustAPeasant user@gmail.com --role=subscriber --user_pass=other
