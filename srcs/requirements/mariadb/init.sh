db_name=$(cat /run/secrets/db_name)
db_admin=$(cat /run/secrets/db_admin)
db_admin_pw=$(cat /run/secrets/db_admin_pw)
db_root_pw=$(cat /run/secrets/db_root_pw)

touch /docker-entrypoint-initdb.d/init.sql

cat > /docker-entrypoint-initdb.d/init.sql <<EOL
CREATE DATABASE IF NOT EXISTS \`$db_name\`;
CREATE USER IF NOT EXISTS '$db_admin'@'%' IDENTIFIED BY '$db_admin_pw';
GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_admin'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_pw';
FLUSH PRIVILEGES;
EOL