#!/bin/bash

##
# GENERAL 
##

# preparation
apt-get -y -q update
apt-get -y -q upgrade

# network
apt-get install -y -q wget curl net-tools netcat tcpdump

# version control
apt-get install -y -q git

# editors
apt-get install -y -q nano

# zip/unzip
apt-get install -y -q unzip zip

# Install htop 
apt-get install -y -q htop 

# Install packages needed to compile binaries
apt-get install -y -q build-essential autotools-dev automake pkg-config

##
# ZSH
##

# Install zsh
apt-get install -y -q zsh

# Clone oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

# Create a new zsh configuration from the provided template
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Customize theme
sed -i -e 's/ZSH_THEME=".*"/ZSH_THEME="philips"/' ~/.zshrc

# add aliases
sed -i -e 's/# Example aliases/source ~\/.bash_aliases/gi' ~/.zshrc

# Set zsh as default shell
chsh -s /bin/zsh

##
# Nvm
##

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

# Install node
nvm install --lts
nvm alias default node

##
# Docker
##
echo "" > /etc/default/docker
service docker restart
sleep 2

##
# Aliases
##
echo "

alias cv='cd /vagrantShared'

" > ~/.bash_aliases



