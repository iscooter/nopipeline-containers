FROM ubuntu:18.04

# Install Docker CLI
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates gnupg2
# RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN while true; do \
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "58118E89F3A912897C070ADBF76221572C52609D" || \
    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "58118E89F3A912897C070ADBF76221572C52609D" ; \
  done
# RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 7EA0A9C3F273FCD8
RUN while true; do \
    gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "7EA0A9C3F273FCD8" || \
    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "7EA0A9C3F273FCD8" ; \
  done
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce --allow-unauthenticated

RUN apt-get update && apt-get install -y openjdk-8-jre curl python python-pip git
RUN python -m pip install jenkins-webapi

# Get docker-compose in the agent container

RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN mkdir -p /home/jenkins
RUN mkdir -p /var/lib/jenkins

# Ellucian
# added to support additional functionality from the pipeline
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y wget awscli jq
# end Ellucian

# Configure slave

ADD slave.py /var/lib/jenkins/slave.py

WORKDIR /home/jenkins

ENV JENKINS_URL "http://jenkins"
ENV JENKINS_SLAVE_ADDRESS ""
ENV JENKINS_USER "admin"
ENV JENKINS_PASS "admin"
ENV JENKINS_JAVA_OPTIONS="-Duser.timezone=America/New_York"
ENV SLAVE_NAME ""
ENV SLAVE_SECRET ""
ENV SLAVE_EXECUTORS "2"
ENV SLAVE_LABELS "ubuntu"
ENV SLAVE_WORING_DIR ""
ENV CLEAN_WORKING_DIR "true"

CMD [ "python", "-u", "/var/lib/jenkins/slave.py" ]