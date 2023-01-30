#!/bin/sh

cd "$(dirname "$0")"/.. &&\
    docker build --file=docker/Dockerfile --build-arg PYTHON_VERSION=3.8 -t cblessing24/python3.8 .
