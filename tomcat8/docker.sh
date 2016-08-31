#! /bin/bash

build() {
  if [ ! -e apache-tomcat-8.5.4.tar.gz ];
  then
    echo 'Downloading apache-tomcat-8.5.4'
    wget -q http://daniel-repo.qiniudn.com/apache-tomcat-8.5.4.tar.gz
  fi
  echo 'Building image...'
  docker build . -t 'nielcho/tomcat8:v1'
}
run() {
  CID=`docker run -itdP 'nielcho/tomcat8:v1'`
  echo "http://`docker port $CID 8080`"
}

case $1 in
  build)
    build;;
  run)
    run;;
  *)
    echo 'USAGE: ./docker.sh (build|run)';; 
esac
