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
  LCID=`docker run -v $PWD/webapps:/opt/apache-tomcat-8.5.4/webapps -itdP 'nielcho/tomcat8:v1'`
  CID=${LCID:0:12}
  echo "tomcat        : http://`docker port $CID 8080`"
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
