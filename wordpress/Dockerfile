FROM debian:12.9

RUN apt-get update && apt-get install -y \
php8.2-fpm \
wget \
gettext \
php-mysqli \
curl \
gosu

# RUN mkdir  -p /var/www/artclave.42.fr
COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf
# RUN mkdir -p /var/www

COPY script.sh .
RUN chmod +x script.sh

COPY setup.sh .
RUN chmod +x setup.sh

CMD ["./script.sh"]


# CMD ["sh", "-c", "./script.sh"]


# CMD ["php-fpm8.2", "-F"]

# RUN touch testfile
# COPY set.sh /var/www/artclave.42.fr/
# COPY set.sh .
# RUN chmod +x ./set.sh
# WORKDIR /var/www/artclave.42.fr
# RUN chmod +x ./set.sh
# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xzvf latest.tar.gz
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp

# RUN chown -R www-data:www-data /var/www/artclave.42.fr
# # RUN chown -R www-data:www-data /var/www/
# RUN mkdir -p /var/www/.wp-cli/cache/ && chown -R www-data:www-data /var/www/.wp-cli/cache/

# # USER wpuser

# # USER www-data
# # WORKDIR /var/www/artclave.42.fr

# # RUN wp core download
# # RUN wp core config --dbname=wordpress --dbuser=artclave --dbpass=123 --dbhost=mariadb:3306

# # RUN wp core install --url="http://artclave.42.fr" --title="Inception my ass" --admin_user="TheGreatRuler" --admin_password="admin" --admin_email="admin@email.com"
# # RUN wp user create JustAPeasant user@gmail.com --role=subscriber --user_pass=other

# # EXPOSE 9000
# WORKDIR /
# CMD [ "sh", "-c", "envsubst < ./set.sh > ./set-envs.sh && chmod +x ./set-envs.sh && php-fpm8.2 -F"]

# # CMD ["php-fpm8.2",  "-F"]
