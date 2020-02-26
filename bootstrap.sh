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

echo "Installing docker"

# Set up the repository
apt-get update
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker Engine - Community
apt-get update
apt-get install -y docker-ce="5:19.03.6~3-0~ubuntu-xenial" docker-ce-cli="5:19.03.6~3-0~ubuntu-xenial" containerd.io

usermod -a -G docker vagrant 

apt-get install -y libpq-dev
docker run --name some-postgres -p 5432:5432 \
    -e POSTGRES_PASSWORD=password -d postgres:9.6

apt-get autoremove -y

