# remove ruby
sudo apt-get remove ruby

# install essential apps
sudo apt-get install -y -q \
  build-essential \
  git \
  rake \
  tree

# install ruby using rvm
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# \curl -sSL https://get.rvm.io | bash -s stable --ruby

# creates the basic directory
mkdir ~/www

# download and install dotfiles
git clone git@github.com:fellipebrito/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && rake install
ln -s bin/ /home/vagrant/bin
source ~/.bashrc

# install vim plugins
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && vim +BundleInstall +qall
