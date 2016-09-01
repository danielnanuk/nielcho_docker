#! /bin/bash

build() {
  echo 'Building image...'
  docker build . -t 'nielcho/base:v1'
}
run() {
  LCID=`docker run -itd 'nielcho/base:v1'`
  CID=${LCID:0:12}
  echo "Container ID: $CID"
  docker exec -it $CID echo "Hello, World!"
}

case $1 in
  build)
    build;;
  run)
	  run;;
  *)
    echo 'USAGE: ./docker.sh (build|run)';;
esac
