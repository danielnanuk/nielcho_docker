FROM nielcho/base:v1
MAINTAINER nielcho "danielnanuk@gmail.com"
ENV REFRESHED_AT 2016-08-30

RUN echo 'deb http://www.rabbitmq.com/debian/ testing main' >> /etc/apt/sources.list
RUN wget -q -O- http://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y rabbitmq-server

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV RABBITMQ_CONF_ENV_FILE /rabbitmq/rabbitmq-env.conf

VOLUME ["/rabbitmq"]
# AMQP 0-9-1 without SSL
EXPOSE 5672
# management plugin
EXPOSE 15672
