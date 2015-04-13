FROM ubuntu:14.04
MAINTAINER Bryce Kottke <bkottke3@gmail.com>

# Install Mesosphere
RUN echo "deb http://repos.mesosphere.io/ubuntu/ trusty main" > /etc/apt/sources.list.d/mesosphere.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    apt-get update
RUN apt-get install -y mesosphere

# Install Marathon
ADD http://downloads.mesosphere.com/marathon/v0.7.5/marathon-0.7.5.tgz /tmp/marathon-0.7.5.tgz
RUN cd /opt/ && tar xvf /tmp/marathon-0.7.5.tgz && mv marathon-0.7.5 marathon

# Start mesos-master and marathon
ADD ./start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 8080
EXPOSE 5050
CMD [“/bin/bash”, “/start.sh”]

# Old
#EXPOSE 5050
#CMD ["mesos-master", "--work_dir=/var/log/mesos"]
