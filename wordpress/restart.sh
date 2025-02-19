docker compose stop wordpress
docker compose rm wordpress
find ./app/ -mindepth 1 ! -name 'index*' -exec sudo rm -rf {} +
docker compose build wordpress
docker compose up -d wordpress
docker compose logs -f wordpress