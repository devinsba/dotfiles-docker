#!/usr/bin/env bash

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

COMPLETION=${TRAVIS_BUILD_DIR}/build/dotfiles-completion

git clone https://${GH_TOKEN}@github.com/devinsba/dotfiles-completion $COMPLETION

if [ -z "$(git status --porcelain)" ]; then
    cd $COMPLETION
    setup_git
    git add .
    git commit -am "New completions files"
    git push --quiet --set-upstream origin $TRAVIS_BRANCH
fi