#! /bin/bash

build() {
  if [ ! -e redis-3.2.3.tar.gz ];
  then
    echo 'Downloading redis 3.2.3'
    wget -q http://daniel-repo.qiniudn.com/redis-3.2.3.tar.gz
  fi
  echo 'Building image...'
  docker build . -t 'nielcho/redis:v1'
}
run() {
  LCID=`docker run -v $PWD/redis:/redis -P -itd 'nielcho/redis:v1'`
  CID=${LCID:0:12}
  echo "Container ID: $CID"
  echo "if you have redis-cli:"
  echo "    redis-cli    :redis-cli -p `docker port $CID |awk -F ':' '{print $2}'` -a redis" 
  echo "or:"
  echo "    redis-cli    :docker exec -it $CID /opt/redis-3.2.3/src/redis-cli"
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
