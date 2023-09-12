## 実行コマンド

```
git clone git@github.com:k-suke39/docker_rails_postgresql.git
cd docker_rails_postgresql
docker-compose build
docker-compose run web rails db:create
docker-compose up --build

# http://localhost:8000/ でログイン
```

## 終わり！
