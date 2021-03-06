#!/bin/bash

if [ $UID != 0]
then
  echo "Please run this script with sudo. It won't make the sandwich otherwise."
  echo "sudo $0 $*"
fi

sudo apt-get update

sudo apt-get install wget git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

cd #make sure we are in your home directory

#install atom
wget https://atom.io/download/deb
sudo dpkg -i ./atom-amd64.deb

#install rbenv
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

#install ruby
rbenv install -v 2.2.3
rbenv global 2.2.3
echo "gem: --no-document" > ~/.gemrc #keep loads of un-needed documentation from being installed
gem install bundler #manages your treasures

#install rails itself
gem install rails
rbenv rehash

sudo apt-get update
sudo apt-get install nodejs

rails -v

echo 'Congrats! Rails and all the junk it needs is installed.'
