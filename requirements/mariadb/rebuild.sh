docker compose stop mariadb
echo -e "y" | docker compose rm mariadb 
docker compose build mariadb --no-cache
docker compose up -d mariadb
docker compose exec mariadb cat myspeciallogs.txt