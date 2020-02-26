#sudo DEBIAN_FRONTEND=noninteractive 
echo "Installing yarn"
wget -q https://github.com/yarnpkg/yarn/releases/download/v1.2.1/yarn_1.2.1_all.deb
dpkg -i yarn_1.2.1_all.deb
rm yarn_1.2.1_all.deb

rvm use --default --install --quiet-curl 2.5.3

rvm gemset use ruby-2.5.3@app_gemset --create

gem install rails -v 5.2.1 --no-ri --no-rdoc
gem install webpacker -v 3.5 --no-ri --no-rdoc
gem install bundler

apt-get autoremove -y