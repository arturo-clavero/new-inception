FROM debian:12.9

RUN apt-get update && apt-get install -y \
gettext \
mariadb-server \
gettext

COPY init.sql /docker-entrypoint-initdb.d/temp.sql

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

EXPOSE 3306

CMD [ "sh", "-c", "envsubst < /docker-entrypoint-initdb.d/temp.sql > /docker-entrypoint-initdb.d/init.sql && mysqld" ]
