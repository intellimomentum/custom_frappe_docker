# !/bin/bash

# Use PAT or ssh for private repos.

## To use SSH keys place the private key as ssh-keys/ci and uncomment following
# mkdir -p repos ~/.ssh
# chown 0600 ssh-keys/ci
# chown 0700 ~/.ssh
# ssh-keyscan -t rsa git.example.com >> ~/.ssh/known_hosts
# eval $(ssh-agent -s)
# ssh-add ssh-keys/ci

## To clone private repos through ssh use following instead of https.
# git clone --depth 1 --branch master ssh://git@github.com/frappe/twilio-integration repos/twilio_integration

## To use PAT use PERSONAL_ACCESS_TOKEN environment variable which is set through CI secret.
# git clone --depth 1 --branch master https://username:${PERSONAL_ACCESS_TOKEN}@github.com/frappe/twilio-integration repos/twilio_integration

# Following are public repositories.

git clone --depth 1 --branch Production https://github.com/intellimomentum/erpnext.git repos/erpnext
git clone --depth 1 --branch v1.0.0 https://github.com/intellimomentum/hrms.git repos/hrms
git clone --depth 1 --branch version-14 https://github.com/intellimomentum/erpnext_germany.git repos/erpnext_germany
git clone --depth 1 --branch version-14 https://github.com/intellimomentum/erpnext_datev.git repos/erpnext_datev
git clone --depth 1 --branch master https://github.com/intellimomentum/erpnextfints.git repos/erpnextfints
git clone --depth 1 --branch main https://github.com/intellimomentum/erpnext_customization.git repos/customization
