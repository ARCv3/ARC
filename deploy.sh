git checkout main
git pull origin main
git submodule update
docker compose build
docker compose up -d
