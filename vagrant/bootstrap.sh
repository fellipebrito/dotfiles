# remove ruby
sudo apt-get remove ruby

# install essential apps
sudo apt-get install -y -q \
  build-essential \
  git \
  rake \
  tree

# install ruby using rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby

# creates the basic directory
mkdir -p /home/vagrant/www

download and install dotfiles
ssh-keyscan github.com >> /home/vagrant/.ssh/known_hosts
rm -rf /home/vagrant/dotfiles
su -c 'git clone git@github.com:fellipebrito/dotfiles.git /home/vagrant/dotfiles && cd /home/vagrant/dotfiles && rake install' vagrant
rm /home/vagrant/bin
ln -s /home/vagrant/dotfiles/bin/ /home/vagrant/bin
su -c 'source /home/vagrant/.bashrc'

# install vim plugins
rm -rf /home/vagrant/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git /home/vagrant/.vim/bundle/vundle
su -c 'vim +PluginInstall +qall' vagrant
