FROM debian:12.9

RUN apt-get update && apt-get install -y \
php8.2-fpm \
wget \
php-mysqli \
curl \
gosu \
sendmail \
&& rm -rf /var/lib/apt/lists/*

COPY ./conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./tools/script.sh ./tools/get_credentials.sh ./
RUN chmod +x script.sh get_credentials.sh

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]