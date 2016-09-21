FROM nielcho/hadoop:v1
MAINTAINER nielcho "danielnanuk@gmail.com"
ENV REFRESHED_AT 2016-09-21


ADD apache-hive-2.1.0-bin.tar.gz /opt/ 
ENV HIVE_HOME /opt/apache-hive-2.1.0-bin
ENV PATH $PATH:/opt/apache-hive-2.1.0-bin/bin

VOLUME ["/metastore"]

WORKDIR /metastore
