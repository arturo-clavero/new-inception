FROM debian:12.9

RUN apt-get update && apt-get install -y \
gettext \
mariadb-server \
gettext
# \
# && rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get install -y \
# gettext

COPY init.sql /docker-entrypoint-initdb.d/temp.sql

# RUN chmod +x /docker-entrypoint-initdb.d/init.sql

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

RUN touch myspeciallogs.txt
RUN cat /docker-entrypoint-initdb.d/temp.sql >> myspeciallogs.txt

EXPOSE 3306
# COPY init.sh .
# RUN chmod +x init.sh
# CMD ["sh", "/init.sh"]
CMD [ "sh", "-c", "envsubst < /docker-entrypoint-initdb.d/temp.sql > /docker-entrypoint-initdb.d/init.sql && cat /docker-entrypoint-initdb.d/init.sql >> myspeciallogs.txt && mysqld" ]
