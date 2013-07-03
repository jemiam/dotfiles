#!/bin/bash

dot_files=( .vimrc .zshrc .zshenv .tmux.conf .screenrc)

for file in ${dot_files[@]}
do
  rm -f $HOME/$file
  ln -sf $HOME/dotfiles/$file $HOME/$file
done
