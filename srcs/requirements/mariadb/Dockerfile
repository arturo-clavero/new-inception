FROM debian:12.9

RUN apt-get update && apt-get install -y \
gettext \
mariadb-server 

COPY tools/init.sh .
RUN chmod +x init.sh

COPY conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld /var/lib/mysql /docker-entrypoint-initdb.d
RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /tmp
RUN chown -R mysql:mysql /docker-entrypoint-initdb.d
RUN chmod -R 755 /var/lib/mysql
RUN chmod -R 755 /tmp

EXPOSE 3306

CMD [ "sh", "-c", "./init.sh && mysqld" ]