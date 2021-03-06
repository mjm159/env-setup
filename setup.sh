# Packages
PACKAGES=(vim, git, zsh)

# Update & Install Packages
sudo apt-get update
for package in $PACKAGES
do
	sudo apt-get install -y $package
done

# Setup SSH
# ssh-keygen -f id_rsa -t rsa -N '' # not working yet

# Setup ZSH
sudo apt-get install -y zsh
wget https://raw.githubusercontent.com/mjm159/env-setup/master/zshrc.cfg ~/.zshrc
rm zshrc.cfg
echo 'export ZSH=".oh-my-zsh"' >> ~/.zshrc
echo 'export SHELL=/bin/zsh' >> ~/.bashrc_profile
echo 'exec /bin/zsh -l' >> ~/.bash_profile
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setup VIM
# setting up vimrc
wget https://raw.githubusercontent.com/mjm159/env-setup/master/vimrc.cfg ~/.vimrc
rm vimrc.cfg
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
