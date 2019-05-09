BUILD_IMAGE = jekyll/jekyll:3.8

RSYNC_HOST = 139.162.244.147
RSYNC_USER = alexwlchan
RSYNC_DIR = /home/alexwlchan/sites/notebook.alexwlchan.net

ROOT = $(shell git rev-parse --show-toplevel)
DST = $(ROOT)/_site


build:
	docker run --tty --rm \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		$(BUILD_IMAGE) jekyll build

serve:
	docker run \
		--publish 6060:6060 \
		--volume $(ROOT):$(ROOT) \
		--workdir $(ROOT) \
		--tty --rm $(BUILD_IMAGE) \
		jekyll serve --host "0.0.0.0" --port 6060 --watch --drafts

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
		--exclude=".DS_Store" \
		--rsh="ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa" \
		/data/ "$(RSYNC_USER)"@"$(RSYNC_HOST)":"$(RSYNC_DIR)"


.PHONY: build serve deploy
