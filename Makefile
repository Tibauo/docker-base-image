clean:
	docker rmi $(shell docker images $(name):$(tag) -q) || true
build:
	cd debian && docker build . -t create-debian &&  docker run -v /var/run/docker.sock:/var/run/docker.sock --privileged -it create-debian bash /tmp/build-debian.sh && cd ../centos && docker build . -t create-centos && docker run -v /var/run/docker.sock:/var/run/docker.sock --privileged -it create-centos bash /tmp/build-centos.sh
