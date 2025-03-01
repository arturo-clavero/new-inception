FROM debian:11

RUN apt-get update && apt-get install -y \
gettext \
mariadb-server \
&& rm -rf /var/lib/apt/lists/*

COPY ./tools/init.sh ./tools/get_credentials.sh ./tools/healthcheck.sh ./
COPY ./conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x init.sh get_credentials.sh healthcheck.sh && \
mkdir -p /run/mysqld /var/lib/mysql /docker-entrypoint-initdb.d && \
chown -R mysql:mysql /run/mysqld && \
chown -R mysql:mysql /var/lib/mysql && \
chown -R mysql:mysql /tmp && \
chown -R mysql:mysql /docker-entrypoint-initdb.d && \
chmod -R 755 /var/lib/mysql && \
chmod -R 755 /tmp

EXPOSE 3306

ENTRYPOINT [ "./init.sh" ]