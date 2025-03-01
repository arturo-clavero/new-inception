#!/bin/sh
MYSQL_PASSWORD=$(cat /run/secrets/db_root_pw)
mysql -u root -p"$MYSQL_PASSWORD" -e 'SELECT 1'