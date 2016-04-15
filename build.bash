#!/usr/bin/env bash

PATH="$PATH:./node_modules/.bin/"

vulcanize --inline-script --strip-comments elements.html | \
crisper --script-in-head=false --html elements.html --js build.js

if [[ "$1" == "--deploy" ]]
then
   [[ -d "publish" ]] && rm -rf "publish"
   git clone git@github.com:travelnxtelements/demos.git publish && cd publish
   git checkout gh-pages

   cp ../*.{html,js} ./
   cp -r ../bower_components ./

   git add .
   git commit -m "Deploy"
   git push origin gh-pages
   cd ../
fi
