FROM debian:12.9

RUN apt-get update && apt-get install -y \
php8.2-fpm \
wget \
gettext \
php-mysqli \
curl \
gosu

COPY www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY script.sh .
RUN chmod +x script.sh

EXPOSE 9000

CMD ["./script.sh"]