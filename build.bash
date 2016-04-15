#!/usr/bin/env bash

PATH="$PATH:./node_modules/.bin/"

vulcanize --inline-script --strip-comments elements.html | \
crisper --script-in-head=false --html elements.html --js build.js

if [[ "$1" == "--deploy" ]]
then
  git checkout gh-pages
  git add -- *.html *.js
  git commit -m "Deploy"
  git reset --hard master
  git checkout master
  git push origin master gh-pages
fi
