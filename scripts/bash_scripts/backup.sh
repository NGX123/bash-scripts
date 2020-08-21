#! /bin/bash

cd ~/Files/github/tos
git add .
git commit -m "backup"
git push tos master

cd ~/Files/github/tutorials-repo
git add .
git commit -m "backup"
git push t master

cd ~/Files/github/nuxos-repo
git add .
git commit -m "backup"
git push n master
