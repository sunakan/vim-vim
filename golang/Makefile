export DOCKER_GO_TAG=buster
export DOCKER_EDITOR_REPOSITORY=vim-vim/golang

.PHONY: build
build:
	docker build ./ \
		--build-arg DOCKER_GO_TAG=${DOCKER_GO_TAG} \
		--tag ${DOCKER_EDITOR_REPOSITORY}:latest

.PHONY: bash
bash:
	docker run \
		--rm \
		--interactive \
		--tty \
		${DOCKER_EDITOR_REPOSITORY}:latest \
		bash
