#! /bin/bash

build() {
  if [ -e dependencies.txt ];
  then
	cat dependencies.txt | while read line
	do
		if [ ! -e $line ];
		then
		  echo "Downloading $line ..."
		  wget -q http://daniel-repo.qiniudn.com/$line
		fi
	done
  fi
  echo 'Building image...'
  docker build . -t 'nielcho/nginx:v1'
}
run() {
  LCID=`docker run -itdP 'nielcho/nginx:v1'`
  CID=${LCID:0:12}
  echo "Container ID: $CID"
  echo "nginx         : http://`docker port $CID 80`"
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
