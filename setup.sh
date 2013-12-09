#!/bin/bash

find . -mindepth 1 -maxdepth 1 -name ".*" | while read line; do
  ln -sfn $HOME/dotfiles/$line $HOME/$line
done

~/.vim/bundle/neobundle.vim/bin/neoinstall
