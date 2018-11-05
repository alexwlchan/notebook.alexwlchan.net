#!/usr/bin/env sh

set -o errexit
set -o nounset

apk update
apk add build-base libffi-dev

bundle install

# These packages are only required for installation, not for running Jekyll
apk del --purge build-base
rm -rf /var/cache/apk/*
