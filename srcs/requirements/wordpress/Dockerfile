FROM debian:11

RUN  apt-get update && \
apt-get install -y \
ca-certificates \
curl \
gnupg2 \
apt-transport-https && \
curl -fsSL https://packages.sury.org/php/apt.gpg | tee /etc/apt/trusted.gpg.d/sury-archive-keyring.gpg && \
echo "deb https://packages.sury.org/php/ bullseye main" | tee /etc/apt/sources.list.d/sury-php.list && \
apt-get update && apt install -y \
php8.2 php8.2-fpm php8.2-mysql \
wget \
curl \
gosu \
sendmail \
&& rm -rf /var/lib/apt/lists/*

COPY ./conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./tools/script.sh ./tools/get_credentials.sh ./

RUN chmod +x script.sh get_credentials.sh && \
mkdir -p /run/php && \
chown -R www-data:www-data /run/php

EXPOSE 9000

ENTRYPOINT [ "./script.sh" ]