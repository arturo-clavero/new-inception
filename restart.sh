docker compose down -v
find /home/artclave/data/ -mindepth 1 ! -name 'index*' -exec sudo rm -rf {} +
docker compose build
docker compose up -d
docker compose logs -f