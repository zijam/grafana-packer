#!/bin/bash

mkdir -p dist

docker run -i -t --name gfbuild \
  -v $(pwd)/dist:/tmp/dist \
  -e "BRANCH=v3.1.x" \
  grafana/buildcontainer
