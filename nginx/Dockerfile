FROM debian:12.9

RUN apt-get update && apt-get install -y \
nginx \
openssl

RUN mkdir -p /etc/nginx/ssl/private /etc/nginx/ssl/cert

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/private/server.key -out /etc/nginx/ssl/cert/server.crt -days 365 -subj "/CN=localhost"


RUN mkdir /var/www/artclave.42.fr

# COPY ./index/. /var/www/artclave.42.fr

# COPY config.conf /etc/nginx/conf.d
# RUN mv /etc/nginx/conf.d/config.conf /etc/nginx/conf.d/artclave.42.fr.conf
#  chown -R www-data:www-data

# RUN chmod -R 755 /var/www/artclave.42.fr

COPY config.conf /etc/nginx/sites-available
RUN mv /etc/nginx/sites-available/config.conf /etc/nginx/sites-available/artclave.42.fr.conf
RUN ln -s /etc/nginx/sites-available/artclave.42.fr.conf etc/nginx/sites-enabled/artclave.42.fr.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]