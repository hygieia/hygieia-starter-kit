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

FROM centos/systemd

ARG API_VERSION=3.2.9
ARG UI_VERSION=3.1.0
ARG GITHUB_GRAPHQL_VERSION=3.1.6
ARG JENKINS_VERSION=3.1.1
ARG SONAR_VERSION=3.1.8

ENV container docker

RUN mkdir -p /hygieia/logs; \
mkdir -p /hygieia/ui/; \
mkdir -p /hygieia/api/; \
mkdir -p /hygieia/collectors/; \
mkdir -p /hygieia/cacerts

RUN yum -y install httpd; \
yum -y install java-1.8.0-openjdk-devel; \
yum clean all; 

# Pulls API jar
RUN curl -o /hygieia/api/api.jar https://repo.maven.apache.org/maven2/com/capitalone/dashboard/api/${API_VERSION}/api-${API_VERSION}.jar

# Pulls UI tar
RUN curl -o /hygieia/ui/ui.tar.gz https://repo.maven.apache.org/maven2/com/capitalone/dashboard/UI/${UI_VERSION}/UI-${UI_VERSION}-src.tar.gz

# Pulls Github Collector jar
RUN curl -o /hygieia/collectors/github-graphql-scm-collector.jar https://repo.maven.apache.org/maven2/com/capitalone/dashboard/github-graphql-scm-collector/${GITHUB_GRAPHQL_VERSION}/github-graphql-scm-collector-${GITHUB_GRAPHQL_VERSION}.jar

# Pulls Sonar Collector jar
RUN curl -o /hygieia/collectors/sonar-codequality-collector.jar https://repo.maven.apache.org/maven2/com/capitalone/dashboard/sonar-codequality-collector/${SONAR_VERSION}/sonar-codequality-collector-${SONAR_VERSION}.jar

# Pulls Jenkins Collector jar
RUN curl -o /hygieia/collectors/jenkins-build-collector.jar https://repo.maven.apache.org/maven2/com/capitalone/dashboard/jenkins-build-collector/${JENKINS_VERSION}/jenkins-build-collector-${JENKINS_VERSION}.jar

WORKDIR /hygieia/ui
RUN tar -zvxf ui.tar.gz
RUN mv UI-${UI_VERSION}/dist/* /var/www/html/

EXPOSE 8080
EXPOSE 80

ENV JAVA_HOME /usr/lib/jvm/java-openjdk
ENV PROP_FILE /hygieia/application.properties


COPY /api/* /hygieia/api/
COPY /system/* /etc/systemd/system/
COPY /collectors/* /hygieia/collectors/
COPY /ui/httpd.conf /etc/httpd/conf/
#ADD /certs/* /hygieia/cacerts/
ADD /properties-builder.sh /hygieia/

# For adding certs
#RUN ls -1 /hygieia/cacerts | while read cert; do \
#        openssl x509 -outform der -in /hygieia/cacerts/$cert -out $cert.der; \
#        $JAVA_HOME/bin/keytool -import -alias $cert -keystore $JAVA_HOME/jre/lib/security/cacerts -trustcacerts -file $cert.der -storepass changeit -noprompt; \
#        rm $cert.der; \
#    done

RUN systemctl enable hygieiaapp.service; \
	systemctl enable sonarcollector.service; \
	systemctl enable jenkinscollector.service; \
	systemctl enable githubcollector.service; \
	systemctl enable httpd.service

WORKDIR /hygieia/
RUN chmod 777 properties-builder.sh 

ENTRYPOINT ["/hygieia/properties-builder.sh"]
CMD ["/usr/sbin/init"]