#!/bin/bash

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_files() {
  git add ./filters
  git commit --message "[ci skip] Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add github https://${GITHUB_TOKEN}@github.com/Mizzick/FiltersRegistry.git > /dev/null 2>&1
  git push --quiet --set-upstream github master
}

setup_git
commit_files
upload_files

