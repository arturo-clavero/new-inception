#!/bin/bash

envsubst '${DOMAIN_NAME}' < /etc/nginx/sites-available/config.conf > /etc/nginx/sites-available/inception_website.conf

openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/private/server.key -out /etc/nginx/ssl/cert/server.crt -days 365 -subj "/CN=${DOMAIN_NAME}" && \

exec nginx -g "daemon off;"
