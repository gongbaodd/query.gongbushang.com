echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME"  $DOCKER_REGISTRY  --password-stdin

docker build -t query_gongbushang_com:latest .
docker tag query_gongbushang_com:latest $DOCKER_REGISTRY/query_gongbushang_com:latest
docker push $DOCKER_REGISTRY/query_gongbushang_com:latest