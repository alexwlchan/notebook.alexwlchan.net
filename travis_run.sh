#!/usr/bin/env bash

set -o errexit
set -o nounset

echo "*** Attempting to build the site"
mkdir -p _site
make build

if [[ "$TRAVIS_EVENT_TYPE" == "pull_request" ]]
then
  echo "*** Pull request, skipping deploy"
  exit 0
fi

echo "*** Loading Travis RSA key"
openssl aes-256-cbc \
  -K $encrypted_83630750896a_key \
  -iv $encrypted_83630750896a_iv \
  -in id_rsa.enc \
  -out id_rsa -d

chmod 400 id_rsa
mv id_rsa ~/.ssh/id_rsa

echo "*** Uploading published site to Linode"
make deploy
