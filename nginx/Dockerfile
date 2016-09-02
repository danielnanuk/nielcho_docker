FROM nielcho/base:v1
MAINTAINER nielcho "danielnanuk@gmail.com"
ENV REFRESHED_AT 2016-08-30

ADD zlib-1.2.8.tar.gz /tmp
ADD openssl-1.0.1q.tar.gz /tmp
ADD pcre-8.37.tar.gz /tmp
ADD nginx-1.10.1.tar.gz /tmp

RUN cd /tmp/nginx-1.10.1 && ./configure --sbin-path=/opt/nginx-1.10.1/nginx --conf-path=/opt/nginx-1.10.1/nginx.conf --pid-path=/opt/nginx-1.10.1/nginx.pid --with-http_ssl_module --with-pcre=/tmp/pcre-8.37 --with-zlib=/tmp/zlib-1.2.8 --with-openssl=/tmp/openssl-1.0.1q && sudo make && sudo make install

ADD nginx.conf /opt/nginx-1.10.1/nginx.conf
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80
