BUILD_IMAGE = jekyll/jekyll:3.8

RSYNC_HOST = 139.162.244.147
RSYNC_USER = alexwlchan
RSYNC_DIR = /home/alexwlchan/sites/notebook.alexwlchan.net

ROOT = $(shell git rev-parse --show-toplevel)
SRC = $(ROOT)/src
DST = $(ROOT)/_site


build:
	docker run --volume $(ROOT):/site --tty --rm $(BUILD_IMAGE) build

serve:
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
