#!/bin/bash

db_admin_pw=$(cat /run/secrets/db_admin_pw)
db_root_pw=$(cat /run/secrets/db_root_pw)
db_name=$(./get_credentials.sh "DATABASE_NAME")
db_admin=$(./get_credentials.sh "DATABASE_ADMIN")

touch /docker-entrypoint-initdb.d/init.sql

cat > /docker-entrypoint-initdb.d/init.sql <<EOL
CREATE DATABASE IF NOT EXISTS \`$db_name\`;
CREATE USER IF NOT EXISTS '$db_admin'@'%' IDENTIFIED BY '$db_admin_pw';
GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_admin'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_pw';
FLUSH PRIVILEGES;
EOL

exec mysqld