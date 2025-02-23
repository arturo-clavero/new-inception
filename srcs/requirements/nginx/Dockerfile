FROM debian:12.9

RUN apt-get update && apt-get install -y \
nginx \
openssl

RUN mkdir -p /etc/nginx/ssl/private /etc/nginx/ssl/cert

RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/private/server.key -out /etc/nginx/ssl/cert/server.crt -days 365 -subj "/CN=$DOMAIN_NAME"

COPY conf /etc/nginx/sites-available/config.conf
RUN mv /etc/nginx/sites-available/config.conf /etc/nginx/sites-available/$DOMAIN_NAME.conf
RUN ln -s /etc/nginx/sites-available/$DOMAIN_NAME.conf etc/nginx/sites-enabled/$DOMAIN_NAME.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]