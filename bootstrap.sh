#!/usr/bin/env bash

apt-get update
apt-get -y install curl software-properties-common wget gnupg2

echo "Installing Node"
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get -y install nodejs

echo "Installing RVM"
apt-add-repository -y ppa:rael-gc/rvm
apt-get update
apt-get -y install rvm

echo "Installing yarn"
wget -q https://github.com/yarnpkg/yarn/releases/download/v1.2.1/yarn_1.2.1_all.deb
dpkg -i yarn_1.2.1_all.deb
rm yarn_1.2.1_all.deb

source "/etc/profile.d/rvm.sh"

rvm use --default --install --quiet-curl 2.5.3

su -c "bash /vagrant/vagrant_rvm.sh" vagrant

apt-get autoremove -y

