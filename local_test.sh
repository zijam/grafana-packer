#!/bin/bash

docker kill gfbuild
docker rm gfbuild

docker build --tag "grafana/buildcontainer" .

mkdir -p dist

docker run -i -t --name gfbuild \
  -v $(pwd)/dist:/tmp/dist \
  -e "BRANCH=master" \
  grafana/buildcontainer
