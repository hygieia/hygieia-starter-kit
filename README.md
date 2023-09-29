# Due to changes in the priorities, this project is currently not being supported. The project is archived as of 6/1/2023 and will be available in a read-only state. Please note, since archival, the project is not maintained or reviewed
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
This Kit is a single image that contains the UI, API, Mongo, Github Collector, Sonar Collector, and Jenkins Collector. All of this can be configured with just a few commands. Note: This setup will take place of the manual steps for setup currently listed in the Hygieia documentation.

### Prerequisites
The following are the prerequisites for setup:
Download and install Docker
### Setup Instructions

To configure the Starter Kit, execute the following steps:

*   **Step 1: Download or Clone the Starter Kit**
If you do not already have the Hygieia starter kit installed, you can download or clone it from the GitHub repo.


*   **Step 2: Pull Down the Starter Kit Container**
Navigate to the directory where you downloaded/cloned the repo from the previous step.
Ex. for Windows:
```
cd C:\Users\[usernname]\hygieia-starter-kit
```

 To pull down the start kit container run the following command:
```
docker-compose pull hygieia
```

*   **Step 3: Add additional Certificates** (OPTIONAL)

If you do not need this step or are unsure, skip and continue to Step 4. 

Add .crt files to `hygieia-starter-kit/hygieia-starter-kit/certs`

*   **Step 4: Configure Collector Properties**
Update docker-compose.yml to provide the below fields

Note: You only need to edit the values for collectors that you wish to configure/use. If you are not currently using them you may leave them blank or add these values later.
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

If you added certs in Step 3, then run
```
docker-compose up -d --build
```
Otherwise, run 
```
 docker-compose up -d 
```
To stop: 
NOTE: Stopping the container will delete all saved data. See `docker-compose.yml` for instructions on how to persist data.
```
docker-compose down
```

NOTE: All of the collectors, database, API and UI need to be running before you can test the app fully through the UI. If something is not working, check the logs to see if all of the different components are finished being built. After waiting for them to finish, everything should be running properly. 
