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
  LCID=`docker run -itPd -v $PWD/dfs:/dfs 'nielcho/hadoop:v1'`
  CID=${LCID:0:12}
  echo "Container ID: $CID"
  echo "Format namenode : docker exec -it $CID hdfs namenode -format"
  echo "Start hadoop    : docker exec -it $CID bootstrap.sh"
  echo "Stop  hadoop    : docker exec -it $CID teardown.sh"
}

case $1 in
  build)
    build;;
  run)
    run;;
  *)
    echo 'USAGE: ./docker.sh (build|run)';; 
esac
