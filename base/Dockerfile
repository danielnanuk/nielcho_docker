FROM ubuntu:14.04
MAINTAINER nielcho "danielnanuk@gmail.com"
ENV REFRESHED_AT 2016-08-30

RUN sudo rm -rf /var/lib/apt/lists/*

RUN echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse' > /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse' >> /etc/apt/sources.list \
&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse' >> /etc/apt/sources.list

# install vim,wget,curl,openssh-server
RUN sudo apt-get update
RUN sudo apt-get install -y vim wget curl openssh-server
RUN sudo mkdir -p /var/run/sshd

# install supervisor 
RUN sudo apt-get install -y supervisor
RUN sudo mkdir -p /var/log/supervisor

RUN sudo apt-get install -y make cmake gcc g++ bison libncurses5-dev build-essential

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
