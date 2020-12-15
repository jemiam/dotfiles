#!/bin/bash

set -e

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)

source ~/.asdf/asdf.fish
