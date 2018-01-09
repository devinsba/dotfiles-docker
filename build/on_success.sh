#!/usr/bin/env bash

if [ "$TRAVIS_BRANCH" == "master" ]; then
    . ${TRAVIS_BUILD_DIR}/build/docker.shlib

    docker_login
    push_images
fi