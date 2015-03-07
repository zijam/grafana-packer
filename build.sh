#!/bin/bash

# This is ment to run inside this build container

GOPATH=/go
REPO_PATH=$GOPATH/src/github.com/grafana/grafana

go get -u github.com/grafana/grafana
go get github.com/tools/godep

cd $REPO_PATH

git checkout develop

go run build.go build

npm install

gem install fpm

go run build.go package latest

cp dist/* /tmp/dist/

