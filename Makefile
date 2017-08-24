.PHONY: docker docker_push test test_docker

IMAGE="renemilk/travis-speedtest:latest"
DOCKER_RUN=docker run --privileged -v $(shell pwd):/root/src/ $(IMAGE)

docker:
	docker build -t $(IMAGE) docker

push_docker: docker
	docker push $(IMAGE)


test_docker: docker
	$(DOCKER_RUN) /root/src/test.bash

test:
	./test.bash
