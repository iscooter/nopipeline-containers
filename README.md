# Jenkins JSON Pipeline
This project aims to demonstrate how to execute pipeline-like Jenkins jobs represented in a JSON structure.
#### Technology Stack
| Item           | Type | Product Referece   | Project Ref
|----------------|---------------|---------------|---------------|
| make | script | https://www.gnu.org/s/make/manual/make.html | [MakeFile](Makefile)
| docker | platform service | https://www.docker.com/ | [Dockerfiles](docker)
| docker-compose | tool | https://docs.docker.com/compose/ | [docker-compose.yml](docker-compose.yml)
| jenkins | ci/cd | https://jenkins.io/ | 
| dsl | script | https://jenkins.io/doc/book/pipeline/syntax/ | [jsonPipeline.groovy](https://github.com/iscooter/nopipeline-jsl/blob/master/vars/jsonPipeline.groovy)
| groovy | language | https://groovy-lang.org/documentation.html | [nopipeline](https://github.com/iscooter/nopipeline-jsl/tree/master/src/nopipeline)
| python | language | https://docs.python.org/3/ | 

## Usage
Following a resemblance of the [3musketeers](https://3musketeers.io/) pattern using Makefile to build and run Jenkins locally.
### Start the Jenkins contianers
```sh
make run-jenkins
```
### Login to Jenkins
Using the credentials below for [http://localhost:8080](http://localhost:8080)
 - user `admin`
 - password `admin`
### Running the JSON noPipeline
Find the Jenkins job [json-nopipeline](http://localhost:8080/job/json-nopipeline/) and click `Build Now`.  Access the [jenkins build console](http://localhost:8080/job/json-nopipeline/1/consoleFull) to see the output.
### Stopping Jenkins
Backup /var/jenkins_home and update plugins.txt.
```sh
make stop-jenkins
```
## Jenkins Pipeline Script
The JSON noPipeline implements a lightweight Jenkins pipeline script that implements a Jenkins [shared library](https://jenkins.io/doc/book/pipeline/shared-libraries/#directory-structure).  The [nopipeline-jsl](https://github.com/iscooter/nopipeline-jsl) interprets the JSON to dynamically execute pipeline-like stages using a JSON structure.
```groovy
// include the shared library
jsl = library(
    identifier: "jsl@master",
    retriever: modernSCM([
        $class: 'GitSCMSource',
        remote: 'https://github.com/iscooter/nopipeline-jsl.git'
    ])
)
 
// start the pipeline
wrapper(
    pipeline: "json",
    library: jsl,
    json: "hello-world"
)
```
## JSON Pipeline Structure
The [hello-world.json](https://github.com/iscooter/nopipeline-json/blob/master/resources/nopipelines/hello-world.json) is available to the pipeline as a resource in one of the Jenkins [shared libraries](https://jenkins.io/doc/book/pipeline/shared-libraries/#directory-structure).
```json
{
    "DockerContainer": "amazonlinux",
    "Pipeline": {
        "Stage1": {
            "State": "Enabled",
            "LogLevel": "INFO",
            "Payload": {
                "arg1": "hello-world"
            }
        }
    }
}
```
## Credits
 - [jenkinsci/docker](https://github.com/jenkinsci/docker) for jenkins/jenkins:lts
 - [foxylion/docker-jenkins](https://github.com/foxylion/docker-jenkins) for default-user.groovy, slave Dockerfile/slave.py

## Resources
 - [Markdown UI](https://dillinger.io/)