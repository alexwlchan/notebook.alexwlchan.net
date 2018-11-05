BUILD_IMAGE = alexwlchan/notebook

RSYNC_HOST = 139.162.244.147
RSYNC_USER = alexwlchan
RSYNC_DIR = /home/alexwlchan/sites/notebook.alexwlchan.net

ROOT = $(shell git rev-parse --show-toplevel)
SRC = $(ROOT)/src
DST = $(ROOT)/_site


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

deploy: build
	docker run --rm --tty \
		--volume ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		--volume $(DST):/data \
		instrumentisto/rsync-ssh \
		rsync \
		--archive \
		--verbose \
		--compress \
		--delete \
		--exclude=".well-known" \
		--exclude=".DS_Store" \
		--exclude="attic/" \
		--rsh="ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa" \
		/data/ "$(RSYNC_USER)"@"$(RSYNC_HOST)":"$(RSYNC_DIR)"


.PHONY: build serve deploy
