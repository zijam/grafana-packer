#!/bin/bash

git clone git@github.com:torkelo/private.git

gpg --allow-secret-key-import --import ~/private-repo/signing/private.key

wget https://grafanarel.s3.amazonaws.com/builds/grafana-2.0.0_beta3-1.x86_64.rpm

cp rpmmacros ~/.rpmmacros

./sign_expect $GPG_KEY_PASSWORD *.rpm
