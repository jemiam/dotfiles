#!/bin/bash

find . -name ".*" -mindepth 1 -maxdepth 1 | while read line; do
  ln -sfn $HOME/dotfiles/$line $HOME/$line
done

git submodule init
git submodule update
#git submodule foreach 'git checkout master; git pull'
