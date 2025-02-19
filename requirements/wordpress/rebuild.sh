docker compose stop wordpress
echo -e "y" | docker compose rm wordpress
find /home/artclave/data/ -mindepth 1 ! -name 'index*' -exec sudo rm -rf {} +
sudo rm ./nginx/index/wp-cli.phar
docker compose build wordpress --no-cache
docker compose up -d wordpress
docker compose logs -f wordpress