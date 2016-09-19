#! /bin/bash

build() {
  if [ ! -e hadoop-2.7.3.tar.gz ];
  then
    echo 'Downloading hadoop2.7.3...'
    wget -q http://daniel-repo.qiniudn.com/hadoop-2.7.3.tar.gz
  fi
  echo 'Building image...'
  docker build . -t 'nielcho/hadoop:v1'
}
run() {
  LCID=`docker run -itPd 'nielcho/hadoop:v1'`
  CID=${LCID:0:12}
  echo "Container ID: $CID"
  echo "    supervisorctl:docker exec -it $CID supervisorctl"
}

case $1 in
  build)
    build;;
  run)
    run;;
  *)
    echo 'USAGE: ./docker.sh (build|run)';; 
esac
