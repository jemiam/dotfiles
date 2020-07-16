#!/bin/bash

xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew install git-flow
brew install gnu-getopt
brew install macvim
brew install tmux
brew install zsh
brew install zsh-completion
brew install z
brew install peco
brew install reattach-to-user-namespace
brew install rbenv
brew install pyenv
brew install pyenv-virtualenv
brew install mysql@5.7
brew install redis
brew install imagemagick
brew cask install docker
brew install awscli
brew install zlib
brew install tfenvb
brew install inetutils
brew install jq

# for pyenv
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
