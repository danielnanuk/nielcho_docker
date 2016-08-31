#! /bin/bash

build() {
  if [ ! -e jdk-7u79-linux-x64.tar.gz ];
  then
    echo 'Downloading jdk1.7.0_79...'
    wget -q http://daniel-repo.qiniudn.com/jdk-7u79-linux-x64.tar.gz
  fi
  echo 'Building image...'
  docker build . -t 'nielcho/jdk7:v1'
}
run() {
  CID=`docker run -itd 'nielcho/jdk7:v1'`
	echo "Container ID: $CID"
	docker exec -it $CID java -version
}

case $1 in
  build)
    build;;
  run)
	  run;;
  *)
    echo 'USAGE: ./docker.sh (build|run)';;
esac
