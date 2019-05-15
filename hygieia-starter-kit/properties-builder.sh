#!/bin/bash

# if [ "$SKIP_PROPERTIES_BUILDER" = true ]; then
#   echo "Skipping properties builder"
#   exit 0
# fi

# if we are linked, use that info
# if [ "$MONGO_STARTED" != "" ]; then
#   # links now use hostnames
#   # todo: retrieve linked information such as hostname and port exposition
#   export SPRING_DATA_MONGODB_HOST=mongodb
#   export SPRING_DATA_MONGODB_PORT=27017
# fi

cat > $PROP_FILE <<EOF
#Database Name - default is test
dbname=dashboarddb

#Database HostName - default is localhost
dbhost=localhost

#Database Port - default is 27017
dbport=27017

server.contextPath=/api
server.port=8080

#API encryption key. Optional. See https://hygieia.github.io/Hygieia/setup.html#encryption-for-private-repos	
key=DfvBg+AOGol5fOofjMdPYtpYGQ1rH4km

#Authentication Settings
# JWT expiration time in milliseconds
# Secret Key used to validate the JWT tokens
auth.authenticationProviders=STANDARD
auth.expirationTime=25000000

# Github Properties #

github.cron=${GITHUB_CRON:-}

github.host=${GITHUB_HOST:-}
github.proxy=
github.proxyPort=
github.proxyUser=
github.proxyPassword=
github.firstRunHistoryDays=60
github.errorThreshold=50
github.rateLimitThreshold=100
github.readTimeout=60000
github.connectTimeout=30000

github.key=DfvBg+AOGol5fOofjMdPYtpYGQ1rH4km

# Sonar Properties #


# Jenkins Properties #

jenkins.cron=${JENKINS_CRON:-}

jenkins.folderDepth:20
 #Jenkins server (required) - Can provide multiple
jenkins.servers[0]=${JENKINS_SERVER_0:-}
jenkins.saveLog=false
jenkins.niceNames[0]=
jenkins.environments[0]=
# The page size
jenkins.pageSize=1000

EOF

exec "$@"
