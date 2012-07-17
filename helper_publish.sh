#!/bin/sh
git checkout gh-pages
cp index.html index.html.bak
git rm *csv
git rm *html
git merge master
git mv doc/* ./
git mv csv/* ./
mv index.html.bak index.html
git add index.html


