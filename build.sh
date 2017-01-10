#!/bin/bash

# This is ment to run inside this build container

GOPATH=/go
REPO_PATH=$GOPATH/src/github.com/grafana/grafana

mkdir -p /go/src/github.com/grafana
cd /go/src/github.com/grafana
echo $BRANCH
git clone --depth 1 https://github.com/grafana/grafana.git -b $BRANCH

cd $REPO_PATH

go run build.go build
npm install -g yarn
yarn install

source /etc/profile.d/rvm.sh
rvm use 2.1.9 --default

gem install fpm -v 1.4

go run build.go package latest

cp dist/* /tmp/dist/


