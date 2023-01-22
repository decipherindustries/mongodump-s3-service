NAME=mongodb-s3-backup
SUBTAG=latest
REPO=registry.decipher.digital/techstack
TS := $(shell /bin/date "+%Y-%m-%d--%H-%M")

push: docker_build docker_tag docker_push
	docker_build docker_tag docker_push

docker_build:
	docker buildx build --load --platform linux/amd64 -t $(NAME) .

docker_tag:
	docker tag $(NAME) $(REPO)/$(NAME):$(SUBTAG); docker tag $(NAME) $(REPO)/$(NAME):$(TS)

docker_push:
	docker push $(REPO)/$(NAME):$(SUBTAG); docker push $(REPO)/$(NAME):$(TS)

