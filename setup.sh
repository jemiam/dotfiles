#!/bin/bash

dot_files=( .vimrc .zshrc .tmux.conf .screenrc)

for file in ${dot_files[@]}
do
  rm -f $HOME/$file
  ln -sf $HOME/dotfiles/$file $HOME/$file
done
