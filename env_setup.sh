#!/bin/bash

#### A script to automate and setup my work environment ####
# run as sudo

# Getting things ready
cd ~
sudo apt-get update
sudo apt-get install git

## ZSH ##
sudo apt-get install zsh
echo 'export SHELL=/bin/zsh' >> ~/.bashrc_profile
echo 'exec /bin/zsh -l' >> ~/.bash_profile

## PYTHON ##
sudo apt-get install python-pip
pip install virtualenv 
pip install ipython
pip install ansible

## VIM ###
# setting up vimrc
touch ~/.vimrc
echo 'execute pathogen#infect()' >> ~/.vimrc
echo syntax on >> ~/.vimrc
echo filetype plugin indent on >> ~/.vimrc
# Installing pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# Sensible vim
cd ~/.vim/bundle && \
git clone git://github.com/tpope/vim-sensible.git
# Nerdtree
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
# Mapping nerdtree to ctr-n
echo 'map <C-n> :NERDTreeToggle<CR>' >> ~/.vimrc
# Nerdtree git plugin
cd ~/.vim/bundle && \
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git
