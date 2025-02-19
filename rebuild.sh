docker compose down -v
find ./app/ -mindepth 1 ! -name 'index*' -exec sudo rm -rf {} +
docker compose build --no-cache
docker compose up -d
docker compose logs -f