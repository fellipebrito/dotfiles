# Avoid Mysql Installation Prompt
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# install basic unix packages
sudo apt-get update
sudo apt-get install -y -q \
  git \
  build-essential \
  vim \
  curl \
  rake \
  tree \
  mysql-server \
  libmysqlclient-dev \
  nodejs \
  screen \
  wget


# clone dotfiles
su -c 'git clone https://fellipebrito@bitbucket.org/fellipebrito/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && rake install' vagrant

# remove vagrant default ruby and install rvm
su -c 'sudo rm -rf /opt/vagrant_ruby/ && \curl -sSL https://get.rvm.io | bash -s stable --rails --ruby=2.0.0' vagrant

# install vundle
# TODO: BundleInstall must run in a screen
su -c 'git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim +BundleInstall +qall' vagrant

# configure app env
su -c 'sudo mkdir /var/www && sudo chmod 777 -R /var/www' vagrant

exit
