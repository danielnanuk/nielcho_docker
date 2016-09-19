#! /bin/bash

$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

if [[ $1 == "-d" ]]; then
	  while true; do sleep 1000; done
fi
