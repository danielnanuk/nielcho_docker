#!/bin/bash
if [ ! -d /var/lib/mysql/mysql ]; then
  echo "Installing database..."
  mysql_install_db --user=mysql 2>&1
  # 去除绑定ip
  sed -e "s/^bind-address\(.*\)=.*//" -i /etc/mysql/my.cnf
  /usr/bin/mysqld_safe >/dev/null 2>&1 &
  # 等待mysql启动
  timeout=30
  echo -n "Waiting for database server to accept connections"
  while ! /usr/bin/mysqladmin -u root status >/dev/null 2>&1
  do
    timeout=$(($timeout - 1))
    if [ $timeout -eq 0 ]; then
      echo -e "\nCould not connect to database server. Aborting..."
      exit 1
    fi
    echo -n "."
    sleep 1
  done
  echo
  echo "Grant remote access..."
  mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
  mysqladmin -u root shutdown
fi
/usr/bin/supervisord

