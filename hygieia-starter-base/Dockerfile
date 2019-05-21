FROM centos/systemd
ENV container docker
COPY mongodb-org.repo /etc/yum.repos.d/

RUN mkdir -p /hygieia/api/logs; \
mkdir -p /hygieia/ui/; \
mkdir -p /hygieia/collectors/logs; \
mkdir -p /usr/src/app; \
mkdir -p /hygieia/cacerts

RUN  yum -y install mongodb-org; \
yum -y install httpd; \
yum -y install java-1.8.0-openjdk-devel; \
yum clean all; 

RUN curl -o /hygieia/api/api.jar https://oss.sonatype.org/content/repositories/snapshots/com/capitalone/dashboard/api/3.0.2-SNAPSHOT/api-3.0.2-20190520.142918-54.jar

RUN curl -o /hygieia/ui/ui.tar.gz https://oss.sonatype.org/content/repositories/snapshots/com/capitalone/dashboard/UI/3.0.2-SNAPSHOT/UI-3.0.2-20190520.143836-42-src.tar.gz

RUN curl -o /hygieia/collectors/github-scm-collector.jar https://oss.sonatype.org/content/repositories/snapshots/com/capitalone/dashboard/github-scm-collector/3.0.2-SNAPSHOT/github-scm-collector-3.0.2-20190520.143623-42.jar	

RUN curl -o /hygieia/collectors/sonar-codequality-collector.jar https://oss.sonatype.org/content/repositories/snapshots/com/capitalone/dashboard/sonar-codequality-collector/3.0.2-SNAPSHOT/sonar-codequality-collector-3.0.2-20190520.143310-43.jar

RUN curl -o /hygieia/collectors/jenkins-build-collector.jar https://oss.sonatype.org/content/repositories/snapshots/com/capitalone/dashboard/jenkins-build-collector/3.0.2-SNAPSHOT/jenkins-build-collector-3.0.2-20190520.143135-43.jar

WORKDIR /hygieia/ui
RUN tar -zvxf ui.tar.gz
RUN mv UI-3.0.2-SNAPSHOT/dist/* /var/www/html/

CMD ["/usr/sbin/init"]