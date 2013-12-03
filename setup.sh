#!/bin/bash

dot_files=( .vimrc .zshrc .tmux.conf .screenrc)

for file in ${dot_files[@]}
do
    rm $HOME/$file
    ln -s $HOME/dotfiles/$file $HOME/$file
    . $file
done
