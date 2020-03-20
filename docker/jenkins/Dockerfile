FROM jenkins/jenkins:lts

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/default-user.groovy
COPY jobs/json-nopipeline /var/jenkins_home/jobs/json-nopipeline
COPY scriptApproval.xml /var/jenkins_home/scriptApproval.xml

USER root
RUN chown -R jenkins:jenkins $JENKINS_HOME

VOLUME /var/jenkins_home