#!/bin/bash

find . -mindepth 1 -maxdepth 1 -name ".*" | while read line; do
  ln -sfn $HOME/dotfiles/$line $HOME/$line
done

chsh -s /bin/zsh

# for system wide install
# cp rbenv.sh /etc/profile.d/
~/.vim/bundle/neobundle.vim/bin/neoinstall
