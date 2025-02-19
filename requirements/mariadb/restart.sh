docker compose stop mariadb

echo -e "y" | docker compose rm mariadb 

docker compose build mariadb

docker compose up -d mariadb

docker compose exec mariadb cat myspeciallogs.txt


