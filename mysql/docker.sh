#! /bin/bash

build() {
  echo 'Building image...'
  docker build . -t 'nielcho/mysql:v1'
}
run() {
  LCID=`docker run -v $PWD/data:/var/lib/mysql -v $PWD/log:/var/log/mysql -v $PWD/run:/var/run/mysqld -dP 'nielcho/mysql:v1'`
  CID=${LCID:0:12}
  echo "Container ID: $CID"
  echo "if you have mysql-client:"
  echo "	mysql-client :mysql -h127.0.0.1 -uroot -P`docker port $CID |awk -F ':' '{print $2}'` -p"
  echo "or:"
  echo "	mysql-client :docker exec -it $CID mysql -uroot"
  echo "	supervisorctl:docker exec -it $CID supervisorctl"
}

case $1 in
  build)
    build;;
  run)
    run;;
  *)
    echo 'USAGE: ./docker.sh (build|run)';; 
esac
