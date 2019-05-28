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

**Step 1: Download or Clone the Starter Kit**

**Step 2: Add additional Certificates**
If you are unsure or do not need to do this continue to Step 3
    * add .crt files to hygieia-starter-kit/hygieia-starter-kit/certs
    * Config docker-compose.yml
    ```
    * Run docker-compose up -d --build
    ```

**Step 3: Pull Down the Starter Kit Container**
To pull down the start kit container run the following command:
```
docker-compose pull hygieia
```

**Step 3: Configure Collector Properties**


**Step 4: Start the Container**
```
 docker-compose up -d
```

