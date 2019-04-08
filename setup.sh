#!/bin/bash

dotfiles="
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
.vimrc.neobundle
.zshenv
.zshrc
"

for file in $dotfiles; do
  ln -sfn $HOME/dotfiles/$file $HOME/$file
done

# for system wide install
# cp rbenv.sh /etc/profile.d/

mkdir -p $HOME/bin
cp $HOME/dotfiles/pero $HOME/bin/

git submodule update --init
git submodule foreach 'git fetch;git checkout master; git merge origin/master'

$HOME/.vim/bundle/neobundle.vim/bin/neoinstall
