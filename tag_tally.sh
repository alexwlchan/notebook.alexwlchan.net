#!/usr/bin/env bash

set -o errexit
set -o nounset

grep --no-filename --recursive 'tags: ' src/_posts | cut -d ':' -f2- | tr ' ' '\n' | grep -v -e '^$' | sort | uniq -c | sort
