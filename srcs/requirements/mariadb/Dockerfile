FROM debian:12.9

RUN apt-get update && apt-get install -y \
gettext \
mariadb-server 

COPY init.sh .
RUN chmod +x init.sh

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld /var/lib/mysql /docker-entrypoint-initdb.d
RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /docker-entrypoint-initdb.d

EXPOSE 3306

CMD [ "sh", "-c", "./init.sh && mysqld" ]