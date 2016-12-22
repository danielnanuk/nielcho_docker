FROM nielcho/base:v1
MAINTAINER nielcho "danielnanuk@gmail.com"
ENV REFRESHED_AT 2016-12-23

ENV MYSQL_USER=mysql \
MYSQL_DATA_DIR=/var/lib/mysql \
MYSQL_RUN_DIR=/var/run/mysqld \
MYSQL_LOG_DIR=/var/log/mysql

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server \
&& rm -rf ${MYSQL_DATA_DIR}

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

VOLUME ["${MYSQL_DATA_DIR}", "${MYSQL_RUN_DIR}","${MYSQL_LOG_DIR}"]
EXPOSE 3306
ENTRYPOINT ["/sbin/entrypoint.sh"]

