#! /bin/sh
# Publish changes to my blog

docker-compose run server "build"
git add .
git commit -m"Publishing"
git push origin main