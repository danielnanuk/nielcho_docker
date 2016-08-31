FROM nielcho/jdk7
MAINTAINER nielcho "danielnanuk@gmail.com"
ENV REFRESHED_AT 2016-08-31

ADD apache-tomcat-8.5.4.tar.gz /opt/ 
ENV CATALINA_HOME /opt/apache-tomcat-8.5.4

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 8080
