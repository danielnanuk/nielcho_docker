#! /bin/bash

build() {
  if [ ! -e apache-hive-2.1.0-bin.tar.gz ];
  then
    echo 'Downloading hive-2.1.0...'
    wget -q http://daniel-repo.qiniudn.com/apache-hive-2.1.0-bin.tar.gz
  fi
  echo 'Building image...'
  docker build . -t 'nielcho/hive:v1'
}
run() {
  LCID=`docker run -itdP -v $PWD/metastore:/metastore -v $PWD/dfs:/dfs 'nielcho/hive:v1'`
  CID=${LCID:0:12}
  echo "Container ID   : $CID"
  echo "Format namenode: docker exec -it $CID hdfs namenode -format"
  echo "Start hadoop   : docker exec -it $CID bootstrap.sh"
  echo "Stop  haoop    : docker exec -it $CID teardown.sh"
  echo "Init  derby    : docker exec -it $CID schematool -initSchema -dbType derby"
  echo "Enter hive     : docker exec -it $CID hive"
}

case $1 in
  build)
    build;;
  run)
    run;;
  *)
    echo 'USAGE: ./docker.sh (build|run)';; 
esac
