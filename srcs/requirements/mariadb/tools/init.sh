#!/bin/bash
touch mylogs.txt
chmod +x mylogs.txt

db_admin_pw=$(cat /run/secrets/db_admin_pw)
db_root_pw=$(cat /run/secrets/db_root_pw)

echo "sent DATABASE_NAME" >> mylogs.txt
db_name=$(./get_credentials.sh "DATABASE_NAME")
echo "received $db_name" >> mylogs.txt

echo "sent DATABASE_ADMIN" >> mylogs.txt
db_admin=$(./get_credentials.sh "DATABASE_ADMIN")
echo "received $db_admin" >> mylogs.txt


touch /docker-entrypoint-initdb.d/init.sql

cat > /docker-entrypoint-initdb.d/init.sql <<EOL
CREATE DATABASE IF NOT EXISTS \`$db_name\`;
CREATE USER IF NOT EXISTS '$db_admin'@'%' IDENTIFIED BY '$db_admin_pw';
GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_admin'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_pw';
FLUSH PRIVILEGES;
EOL

exec mysqld