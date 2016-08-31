#! /bin/bash

build() {
  if [ ! -e jdk-8u101-linux-x64.tar.gz ];
  then 
    echo 'Downloading jdk1.8.0_101...'
    wget -q http://daniel-repo.qiniudn.com/jdk-8u101-linux-x64.tar.gz
  fi
  echo 'Building image...'
  docker build . -t 'nielcho/jdk8:v1'
}
run() {
  CID=`docker run -itd 'nielcho/jdk8:v1'` 
  echo "Container ID: $CID"
  docker exec -it $CID java -version
}

case $1 in 
  build) 
    build;;
  run) 
    run;;
*) echo 'USAGE: ./docker.sh (build|run)';; 
esac
