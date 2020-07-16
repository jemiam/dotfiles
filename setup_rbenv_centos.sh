#!/bin/bash

cd /usr/local
git clone git://github.com/sstephenson/rbenv.git rbenv
mkdir rbenv/shims rbenv/versions
groupadd rbenv
chgrp -R rbenv rbenv
chmod -R g+rwxXs rbenv
git clone git://github.com/sstephenson/ruby-build.git ruby-build
cd ruby-build
$HOME/install.sh


