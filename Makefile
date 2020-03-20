build-jenkins: clean
	@echo "******** Building Jenkins ********"
	@docker-compose build

run-jenkins: build-jenkins
	@echo "******** Running Jenkins ********"
	@echo "** this target creates the jenkins_home volume if not build before **"
	@docker-compose up -d

stop-jenkins: backup-jenkins update-plugins
	@docker-compose down

kill:
	@docker-compose down

backup-jenkins:
	@echo "******** Copying /var/jenkins_home to ./jenkins_home ********"
	@rm -rf backup/jenkins_home
	@docker cp jenkins:/var/jenkins_home/. backup/jenkins_home

update-plugins:
	@echo "******** Backing up plugins to docker/jenkins/plugins.txt ********"
	@chmod +x ./scripts/update-plugins.sh
	@./scripts/update-plugins.sh

clean:
	@echo "******** Deleting jenkins volume, image and container ********"
	@docker container rm jenkins && ([ $$? -eq 0 ] && echo "success") || echo "unable to complete"
	@docker image rm jenkins && ([ $$? -eq 0 ] && echo "success") || echo "unable to complete"
	@docker volume rm nopipeline-containers_jenkins_home && ([ $$? -eq 0 ] && echo "success") || echo "unable to complete"

test: clean
	docker-compose build
	docker-compose up