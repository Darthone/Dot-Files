#!/bin/bash
#Config files
cat .bashrc >> ~/.bashrc
cp .dir_colors ~/
cp .tmux.conf ~/
cp .vimrc ~/.vimrc
cp -r .vim/ ~/

cd ~/

#vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo | echo | vim +PluginInstall +qall &>/dev/null
mkdir -p ~/.vim/colors/ && cp ~/.vim/bundle/molokai/colors/molokai.vim ~/.vim/colors/

source ~/.bashrc

