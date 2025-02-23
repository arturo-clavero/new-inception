FROM debian:12.9

RUN apt-get update && apt-get install -y \
php8.2-fpm \
wget \
php-mysqli \
curl \
gosu \
sendmail

COPY conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/script.sh .
RUN chmod +x script.sh

EXPOSE 9000

CMD [ "./script.sh" ]
