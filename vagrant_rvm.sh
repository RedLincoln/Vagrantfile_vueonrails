#!/usr/bin/env bash

echo "Intalling single-user gemset" 
source "/etc/profile.d/rvm.sh"


rvm user gemsets

rvm gemset use ruby-2.5.3@app_gemset --create

gem install bundler
gem install rails -v 5.2.1
gem install webpacker -v 3.5
