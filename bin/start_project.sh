#!/bin/bash

echo "ЗАПУСК ПРОЕКТА"
cp $DIR_TESTS/data/.env.example $GITHUB_WORKSPACE/backend/.env
cd $DIR_TESTS/data
docker compose up -d

cd $GITHUB_WORKSPACE/backend/
npm cache clean --force
npm ci
npm run build
cd $DIR_TESTS/data
docker compose ps
docker logs pg
cd $GITHUB_WORKSPACE/backend/
npm run start:dev &
