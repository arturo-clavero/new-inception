docker compose stop wordpress
docker compose rm wordpress
find ./nginx/index/ -mindepth 1 ! -name 'index*' -exec sudo rm -rf {} +
sudo rm ./nginx/index/wp-cli.phar
docker compose build wordpress --no-cache
docker compose up -d wordpress
docker compose logs -f wordpress