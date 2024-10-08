git pull
git submodule update
docker compose -f docker-compose-stg.yml build
docker compose -f docker-compose-stg.yml up -d
