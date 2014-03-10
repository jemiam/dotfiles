#!/bin/bash

dotfiles="
.gemrc
.gitmodules
.gitattributes
.gitconfig
.gitignore
.setup.sh.swp
.screenrc
.tmux.conf
.vim
.vimrc
.zshenv
.zshrc
"

for file in $dotfiles; do
  ln -sfn $HOME/dotfiles/$file $HOME/$file
done

# for system wide install
# cp rbenv.sh /etc/profile.d/

git submodule update --init
git submodule foreach 'git fetch;git checkout master; git merge origin/master'

~/.vim/bundle/neobundle.vim/bin/neoinstall
