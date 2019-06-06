# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM hygieiadoc/hygieia-starter-base:latest

EXPOSE 8080
EXPOSE 80
EXPOSE 27017

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
	systemctl enable jenkinscollector.service; \
	systemctl enable githubcollector.service; \
	systemctl enable httpd.service

WORKDIR /hygieia/
RUN chmod 777 properties-builder.sh 

ENTRYPOINT ["/hygieia/properties-builder.sh"]
CMD ["/usr/sbin/init"]