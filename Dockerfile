# MySQL service
#
# Version 0.0.1

FROM ubuntu:precise
MAINTAINER	Aaron Rustad <arustad@anassina.com>

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y mysql-server
RUN apt-get clean

EXPOSE 3306

ENTRYPOINT ["/usr/sbin/mysqld"]

ADD ./mysql-setup.sh /tmp/mysql-setup.sh
RUN /bin/sh /tmp/mysql-setup.sh
