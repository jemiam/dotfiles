#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)

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
.pryrc
.rspec
.screenrc
.tmux.conf
.vim
.vimrc
.vimrc.vim-plug
.zshenv
.zshrc
"

for file in $dotfiles; do
  ln -sfn $CURRENT_DIR/$file $HOME/$file
done

# for system wide install
# cp rbenv.sh /etc/profile.d/

mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim
ln -sfn $CURRENT_DIR/.vimrc $HOME/.config/nvim/init.vim

mkdir -p $HOME/bin
cp $CURRENT_DIR/pero $HOME/bin/

#
# https://qiita.com/ayihis@github/items/88f627b2566d6341a741
#
# tmux起動時に以下がでたら
#
# zsh compinit: insecure directories, run compaudit for list.
# Ignore insecure directories and continue [y] or abort compinit [n]?
