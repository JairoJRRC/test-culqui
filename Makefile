.DEFAULT_GOAL := help
MAKEFLAGS += --no-print-directory

USERNAME_LOCAL  ?= "$(shell whoami)"
UID_LOCAL  		?= "$(shell id -u)"
GID_LOCAL  		?= "$(shell id -g)"

OWNER           = culqui
SERVICE_NAME    = test
ENV             ?= dev
TAG_CLI 		= cli
TAG_DEV      	= dev
TAG_NODE      	= node

PROJECT_NAME    = ${OWNER}-${ENV}-${SERVICE_NAME}
IMAGE_DEV       = ${PROJECT_NAME}:${TAG_DEV}
IMAGE_CLI		= ${PROJECT_NAME}:${TAG_CLI}
IMAGE_NODE      = ${PROJECT_NAME}:${TAG_NODE}
IMAGE_NODE_8    = ${PROJECT_NAME}:${TAG_NODE}-8

build-cli:
	docker build -f docker/cli/Dockerfile \
		--build-arg USERNAME_LOCAL=$(USERNAME_LOCAL) \
    	--build-arg UID_LOCAL=$(UID_LOCAL) \
    	--build-arg GID_LOCAL=$(UID_LOCAL) \
    	-t ${IMAGE_CLI} docker/cli/

build-node:
	docker build --build-arg USERNAME_LOCAL=$(USERNAME_LOCAL) \
		--build-arg UID_LOCAL=$(UID_LOCAL) \
		--build-arg GID_LOCAL=$(UID_LOCAL) \
		-t ${IMAGE_NODE} docker/node/
	docker build -f docker/node-8/Dockerfile -t ${IMAGE_NODE_8} docker/node-8/

build:
	@make build-cli
	docker build -f docker/dev/Dockerfile -t ${IMAGE_DEV} docker/dev/

composer:
	docker run --rm -t -u ${UID_LOCAL}:${GID_LOCAL} -v $$HOME/.ssh:/home/${USERNAME_LOCAL}/.ssh -v $$PWD/public/app:/app ${IMAGE_CLI} composer update

up:
	@IMAGE_DEV=${IMAGE_DEV} \
	docker-compose -p $(SERVICE_NAME) up -d backend
	docker-compose -p $(SERVICE_NAME) ps