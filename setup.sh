#!/bin/bash

find . -mindepth 1 -maxdepth 1 -name ".*" | while read line; do
  ln -sfn $HOME/dotfiles/$line $HOME/$line
done

chsh -s /bin/zsh

# for system wide install
# cp rbenv.sh /etc/profile.d/

git submodule update --init
git submodule foreach 'git fetch;git checkout master; git merge origin/master'

~/.vim/bundle/neobundle.vim/bin/neoinstall
