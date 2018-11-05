BUILD_IMAGE = alexwlchan/notebook

ROOT = $(shell git rev-parse --show-toplevel)


$(ROOT)/.docker/build: Dockerfile install_jekyll.sh Gemfile.lock
	docker build --tag $(BUILD_IMAGE) .
	mkdir -p .docker
	touch .docker/build

.docker/build: $(ROOT)/.docker/build

Gemfile.lock: Gemfile
	docker run \
		--volume $(ROOT):/site \
		--workdir /site \
		--tty --rm $(shell cat Dockerfile | grep FROM | awk '{print $$2}') \
		bundle lock --update


build: .docker/build
	docker run --volume $(ROOT):/site --tty --rm $(BUILD_IMAGE) build

serve: .docker/build
	docker run \
		--publish 6060:6060 \
		--volume $(ROOT):/site \
		--tty --rm $(BUILD_IMAGE) \
		serve --host "0.0.0.0" --port 6060 --watch --drafts


.PHONY: build serve
