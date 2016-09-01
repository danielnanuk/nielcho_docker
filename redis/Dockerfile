FROM nielcho/base:v1
MAINTAINER nielcho "danielnanuk@gmail.com"
ENV REFRESHED_AT 2016-09-01

ADD redis-3.2.3.tar.gz /opt/
WORKDIR /opt/redis-3.2.3/src
RUN make

ENV REDIS_HOME /opt/redis-3.2.3/
ENV LC_ALL C

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/redis"]

EXPOSE 6379

CMD ["/usr/bin/supervisord"]
