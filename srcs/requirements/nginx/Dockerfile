FROM debian:11

RUN apt-get update && apt-get install -y \
nginx \
openssl \
gettext \
&& rm -rf /var/lib/apt/lists/*

COPY conf /etc/nginx/sites-available/config.conf
COPY ./tools/init.sh .
RUN chmod +x init.sh && \
mkdir -p /etc/nginx/ssl/private /etc/nginx/ssl/cert && \
ln -s /etc/nginx/sites-available/inception_website.conf etc/nginx/sites-enabled/inception_website.conf

EXPOSE 443

ENTRYPOINT [ "./init.sh" ]
