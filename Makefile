.PHONY: docker

IMAGE_BASE = robert-bo-davis/
IMAGE = uwsgi-emperor
MY_PWD = $(shell pwd)

all: docker

docker:
	docker build -t $(IMAGE_BASE)$(IMAGE) -f $(MY_PWD)/Dockerfile $(MY_PWD)
ifdef PUSH
	docker push $(IMAGE_BASE)$(IMAGE)
endif

run:
	docker run --privileged -it --rm -v $(MY_PWD):/app -e "container=docker"  -v /sys/fs/cgroup:/sys/fs/cgroup:ro --tmpfs /run --tmpfs /run/lock -p 8888:80 -p 8889:81 --name $(IMAGE) $(IMAGE_BASE)$(IMAGE)

shell:
	docker exec -it $(IMAGE) bash