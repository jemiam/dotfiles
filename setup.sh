#!/bin/bash

set -e

CURRENT_DIR=$(cd $(dirname $0); pwd)

dotfiles="
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

# nvim
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

# https://github.com/junegunn/vim-plug#unix-linux
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 21.1.0
asdf global nodejs 21.1.0

nvim_files="
coc-settings.json
coc.vim
init.vim
rust.vim
vim-gitgutter.vim
vim-lsp.vim
vim.plug.vim
"
for file in $nvim_files; do
  ln -sfn $CURRENT_DIR/nvim/$file $HOME/.config/nvim/$file
done

mkdir -p $HOME/bin
cp $CURRENT_DIR/pero $HOME/bin/

# for system wide install
# cp rbenv.sh /etc/profile.d/

#
# https://qiita.com/ayihis@github/items/88f627b2566d6341a741
#
# tmux起動時に以下がでたら
#
# zsh compinit: insecure directories, run compaudit for list.
# Ignore insecure directories and continue [y] or abort compinit [n]?
