#!/usr/bin/env bash

(
    . ${TRAVIS_BUILD_DIR}/build/docker.shlib
    build_images
)


export COMPLETION=${TRAVIS_BUILD_DIR}/build/dotfiles-completion

git clone https://${GH_TOKEN}@github.com/devinsba/dotfiles-completion $COMPLETION

if [ ! -z "$(cd $COMPLETION && git status --porcelain)" ]; then
    cd $COMPLETION
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
    git add .
    git commit -am "New completions files"
    git push --quiet --set-upstream origin $TRAVIS_BRANCH
fi