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

mkdir -p $HOME/bin
cp $CURRENT_DIR/pero $HOME/bin/
