docker login -u "$DOCKER_USERNAME" -p $DOCKER_PASSWORD $DOCKER_REGISTRY
docker tag query_gongbushang_com $DOCKER_REGISTRY/query_gongbushang_com
docker push $DOCKER_REGISTRY/query_gongbushang_com