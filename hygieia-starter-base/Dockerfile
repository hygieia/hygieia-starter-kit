FROM centos/systemd
ENV container docker
COPY mongodb-org.repo /etc/yum.repos.d/

RUN  yum -y install mongodb-org; \
yum -y install httpd; \
yum -y install java-1.8.0-openjdk-devel; \
yum clean all; 

CMD ["/usr/sbin/init"]