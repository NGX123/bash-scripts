#! /bin/bash

cd ~/Files/github/tos-repo
git add .
git commit -m "backup"
git push t master

cd ~/Files/github/programming-repo
git add .
git commit -m "backup"
git push t master

cd ~/Files/github/nuxos-repo
git add .
git commit -m "backup"
git push n master
