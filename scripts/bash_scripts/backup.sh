#! /bin/bash

cd ~/Files/github/c-repo
git add .
git commit -m "backup"
git push c master


cd ~/Files/github/tutorials-repo
git add .
git commit -m "backup"
git push t master
