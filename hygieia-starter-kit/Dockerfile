FROM hygieiadoc/hygieia-starter-base:latest

EXPOSE 8080
EXPOSE 80

ENV JAVA_HOME /usr/lib/jvm/java-openjdk
ENV PROP_FILE /hygieia/application.properties


COPY /api/* /hygieia/api/
COPY /system/* /etc/systemd/system/
COPY /collectors/* /hygieia/collectors/
COPY /ui/httpd.conf /etc/httpd/conf/
ADD /certs/* /hygieia/cacerts/
ADD /properties-builder.sh /hygieia/

# For adding certs
RUN ls -1 /hygieia/cacerts | while read cert; do \
        openssl x509 -outform der -in /hygieia/cacerts/$cert -out $cert.der; \
        $JAVA_HOME/bin/keytool -import -alias $cert -keystore $JAVA_HOME/jre/lib/security/cacerts -trustcacerts -file $cert.der -storepass changeit -noprompt; \
        rm $cert.der; \
    done

RUN systemctl enable mongod; \
	systemctl enable hygieiaapp.service; \
	systemctl enable sonarcollector.service; \
#	systemctl enable jenkinscollector.service; \
#	systemctl enable githubcollector.service; \
	systemctl enable httpd.service

WORKDIR /hygieia/
RUN chmod 777 properties-builder.sh 

ENTRYPOINT ["/hygieia/properties-builder.sh"]
CMD ["/usr/sbin/init"]