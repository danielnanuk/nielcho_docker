#! /bin/bash

build() {
  docker build . -t 'nielcho/rabbitmq:v1'
}
run() {
  LCID=`docker run -itdP -v $PWD/rabbitmq:/rabbitmq --hostname=docker-rabbitmq 'nielcho/rabbitmq:v1'`
  CID=${LCID:0:12}
  echo "Container ID: $CID"
  echo "rabbitmq            : `docker port $CID 5672`"
  echo "enable management   : docker exec $CID rabbitmq-plugins enable rabbitmq_management"
  echo "rabbitmq management : http://`docker port $CID 15672`"
  echo "supervisorctl : docker exec -it $CID supervisorctl"
}

case $1 in
  build)
    build;;
  run)
    run;;
  *)
    echo 'USAGE: ./docker.sh (build|run)';; 
esac
