#!/bin/bash

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git checkout
  git add ./filters
  git commit --message "[ci skip] Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add github https://${GITHUB_TOKEN}@github.com/Mizzick/FiltersRegistry.git
  git push github HEAD:master
}

if [ ${TRAVIS_BRANCH} == "master" ] && [ ${TRAVIS_EVENT_TYPE} != "pull_request" ]
then
  setup_git
  commit_files
  upload_files
fi

