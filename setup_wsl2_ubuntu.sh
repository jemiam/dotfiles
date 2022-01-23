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
.zshenv
.zshrc
"

for file in $dotfiles; do
  ln -sfn $CURRENT_DIR/$file $HOME/$file
done

ln -sfn $CURRENT_DIR/.tmux.windows.conf $HOME/.tmux.conf

# nvim
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

nvim_files="
init.vim
vim-lsp.vim
vim.plug.vim
rust.vim
vim-gitgutter.vim
"
for file in $nvim_files; do
  ln -sfn $CURRENT_DIR/nvim/$file $HOME/.config/nvim/$file
done

# for system wide install
# cp rbenv.sh /etc/profile.d/
