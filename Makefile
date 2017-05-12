.PHONY: help deploy build test-run sh

PHPFOLDER?=php7.1
IMAGE?=pemcconnell/docker-phpfpmnginx
PORT?=8080

help: ## shows all available targets
	@echo ""
	@echo "Docker ~ PHP, FPM + NGINX"
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\)\:.*##/\1:/'
	@echo ""

deploy: build ## builds and pushes the locally taggged image to docker hub
	docker push ${IMAGE}:${TAG}

build: ## build and tag our image.
	@if [ "${TAG}" = "" ]; then \
	  echo "TAG not set, or blank"; \
	  exit 1; \
	fi;
	cd ${PHPFOLDER}; docker build -t ${IMAGE}:${TAG} .

run: build ## run this web server on the assigned PORT number (default 8080)
	docker run --rm -p ${PORT}:80 -v $(CURDIR)/app:/app -ti ${IMAGE}:${TAG}

sh: build ## execute 'sh' inside the container
	docker run --rm -v $(CURDIR)/app:/app -ti ${IMAGE}:${TAG} sh
