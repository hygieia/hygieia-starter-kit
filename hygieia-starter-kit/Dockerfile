FROM hygieiadoc/hygieia-starter-base:latest

EXPOSE 8080
EXPOSE 80

ENV JAVA_HOME /usr/lib/jvm/java-openjdk
ENV PROP_FILE /hygieia/application.properties

RUN mkdir -p /hygieia/api/logs; \
mkdir -p /hygieia/ui/; \
mkdir -p /hygieia/collectors/logs; \
mkdir -p /usr/src/app


COPY /api/* /hygieia/api/
COPY /system/* /etc/systemd/system/
COPY /collectors/* /hygieia/collectors/
COPY /ui/httpd.conf /etc/httpd/conf/
ADD /properties-builder.sh /hygieia/

RUN curl -o /hygieia/api/api.jar https://oss.sonatype.org/content/repositories/snapshots/com/capitalone/dashboard/api/3.0.2-SNAPSHOT/api-3.0.2-20190513.114318-46.jar 

RUN curl -o /hygieia/ui/ui.tar.gz https://oss.sonatype.org/content/repositories/snapshots/com/capitalone/dashboard/UI/3.0.2-SNAPSHOT/UI-3.0.2-20190513.114834-35-src.tar.gz

WORKDIR /hygieia/ui
RUN tar -zvxf ui.tar.gz
RUN mv UI-3.0.2-SNAPSHOT/dist/* /var/www/html/

# Start Mongo #
RUN systemctl enable mongod

# Enable API #
RUN systemctl enable hygieiaapp.service

#RUN systemctl enable jenkinscollector.service

# run httpd #
RUN systemctl enable httpd.service
WORKDIR /hygieia/
RUN chmod 777 properties-builder.sh 

ENTRYPOINT ["/hygieia/properties-builder.sh"]
CMD ["/usr/sbin/init"]