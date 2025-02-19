docker compose down -v
find ./app/ -mindepth 1 ! -name 'index*' -exec sudo rm -rf {} +
docker compose build
docker compose up -d
docker compose logs -f