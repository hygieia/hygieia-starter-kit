<!---
    Licensed to the Apache Software Foundation (ASF) under one or more
    contributor license agreements.  See the NOTICE file distributed with
    this work for additional information regarding copyright ownership.
    The ASF licenses this file to You under the Apache License, Version 2.0
    (the "License"); you may not use this file except in compliance with
    the License.  You may obtain a copy of the License at
    
        http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-->
Hygieia Starter Kit.
===============================
This Kit is a single image that contains the UI, API, Mongo, Github Collector, Sonar Collector, and Jenkins Collector.

### Setup Instructions

To configure the Starter Kit, execute the following steps:

*   **Step 1: Download or Clone the Starter Kit**


*   **Step 2: Pull Down the Starter Kit Container**

To pull down the start kit container run the following command:
```
docker-compose pull hygieia
```

*   **Step 3: Add additional Certificates**

If you are unsure or do not need to do this continue to Step 4. Add .crt files to `hygieia-starter-kit/hygieia-starter-kit/certs`

*   **Step 4: Configure Collector Properties**
Update docker-compose.yml to provide the below fields
```
    environment: 
      - PROXY_URL=
      - PROXY_PORT=
      - PROXY_USERNAME=
      - PROXY_PASSWORD=
      - GITHUB_HOST=github.com
      - GITHUB_CRON=0/60 * * * * *
      #See https://hygieia.github.io/Hygieia/troubleshoot.html for how to get a personal access token
      - GITHUB_PERSONAL_ACCESS_TOKEN=
      - JENKINS_CRON=0/60 * * * * *
      - JENKINS_SERVER= #https://<username>:<password>@jenkinsInstanceUrl.com/
      - SONAR_CRON=0/60 * * * * *
      - SONAR_HOST=
      - SONAR_VERSION=6.7
      - SONAR_METRICS=ncloc,violations,new_vulnerabilities,critical_violations,major_violations,blocker_violations,tests,test_success_density,test_errors,test_failures,coverage,line_coverage,sqale_index,alert_status,quality_gate_details
      - SONAR_USERNAME=
      - SONAR_PASSWORD=

```

*   **Step 5: Start/Stop the Container**
    
To start:
```
 docker-compose up -d 
```
Or if you added certs then
```
docker-compose up -d --build
```

To stop: 
NOTE: Stopping the container will delete all saved data. See `docker-compose.yml` for how to persist data.
```
docker-compose down
```
