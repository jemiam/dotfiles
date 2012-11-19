#!/bin/bash

dot_files=( .vimrc .zshrc .tmux.con .screenrc)

for file in ${dot_files[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
    . $file
done
