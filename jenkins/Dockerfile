FROM jenkins/jenkins:lts-jdk11
COPY config.xml /usr/share/jenkins/ref/config.xml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN echo $(/usr/local/bin/install-plugins.sh)
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
COPY jobs/ /usr/share/jenkins/ref/jobs
