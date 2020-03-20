# Jenkins JSON Pipeline
## Usage
Following a resemblance of the [3musketeers](https://3musketeers.io/) pattern using Makefile to build and run Jenkins locally.
### Running Jenkins
```sh
make run-jenkins
```
### Stopping Jenkins
Backup /var/jenkins_home and update plugins.txt.
```sh
make stop-jenkins
```

## Credits
 - [jenkinsci/docker](https://github.com/jenkinsci/docker) for jenkins/jenkins:lts
 - [foxylion/docker-jenkins](https://github.com/foxylion/docker-jenkins) for default-user.groovy