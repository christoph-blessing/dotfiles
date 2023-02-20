#!/bin/sh
set -e

tag=cblessing24/python3.8

cd "$(dirname "$0")"/..
docker build --file=docker/Dockerfile --build-arg PYTHON_VERSION=3.8 -t $tag .
docker push $tag
