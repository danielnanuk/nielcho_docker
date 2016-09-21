FROM nielcho/jdk8:v1
MAINTAINER nielcho "danielnanuk@gmail.com"
ENV REFRESHED_AT 2016-09-19

ADD hadoop-2.7.3.tar.gz /opt/

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 600 ~/.ssh/authorized_keys
RUN echo 'NoHostAuthenticationForLocalhost yes' >> ~/.ssh/config && echo 'Host 0.0.0.0' >> ~/.ssh/config && echo '  StrictHostKeyChecking no' >> ~/.ssh/config
ADD etc /opt/hadoop-2.7.3/etc
ADD bootstrap.sh /opt/hadoop-2.7.3/bin
ADD teardown.sh /opt/hadoop-2.7.3/bin
ENV HADOOP_HOME /opt/hadoop-2.7.3
ENV PATH $PATH:/opt/hadoop-2.7.3/bin

# HDFS ports
EXPOSE 50010 50020 50070 50075 50090
# Mapred ports
EXPOSE 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122   

VOLUME ["/dfs"]

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
