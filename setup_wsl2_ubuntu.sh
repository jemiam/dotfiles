#!/bin/bash

set -e

CURRENT_DIR=$(cd $(dirname $0); pwd)

mkdir -p ~/.vim/tmp
dotfiles="
.aws
.bundle
.gemrc
.gitmodules
.gitattributes
.gitconfig
.gitignore
.ideavimrc
.irbrc
.kaggle
.pryrc
.rspec
.vimrc
.vimrc.vim-plug
"

for file in $dotfiles; do
  ln -sfn $CURRENT_DIR/$file $HOME/$file
done

ln -sfn $CURRENT_DIR/.tmux.windows.conf $HOME/.tmux.conf

ln -sfn $CURRENT_DIR/config.fish $HOME/.config/fish/config.fish

# for system wide install
# cp rbenv.sh /etc/profile.d/
