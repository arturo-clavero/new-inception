#!/bin/bash
set -e
envsubst < /docker-entrypoint-initdb.d/temp.sql > /docker-entrypoint-initdb.d/init.sql

echo "pwd: ${DB_ROOT_PW}" >> myspeciallogs.txt

mysqld &
MYSQLD_PID=$!
# Wait for initialization to finish TODO lop check ?
sleep 15
rm -f /docker-entrypoint-initdb.d/init.sql
rm -f /docker-entrypoint-initdb.d/temp.sql

echo "pwd: ${DB_ROOT_PW}" >> myspeciallogs.txt

wait $MYSQLD_PID
