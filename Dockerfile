FROM ubuntu:14.04
MAINTAINER Bryce Kottke <bkottke3@gmail.com>

RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get update
RUN apt-get install -y mesosphere

EXPOSE 5050

CMD ["mesos-master", "--cluster=dev", "--credentials=credentials.txt", --work_dir=/var/log/mesos"]
