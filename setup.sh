#!/bin/bash

cd `dirname $0`
cp -rf vimrc ~/.vimrc

mkdir -p ~/tags
cp -rf common_tags/* ~/tags

if [[ -d ~/.vim ]];then
  read -p "DIR $HOME/.vim Exists! rm it? yes/no)" yes
  if [[ $yes == 'yes' ]]; then
    echo "mv $HOME/.vim /tmp/vim.$$"
    mv ~/.vim /tmp/vim.$$
  else
    exit
  fi
fi
cp -rf vim ~/.vim

need_install_ctags=`echo $(which ctags) | awk -F'ctags' '{print NF-1}'`

if [[ $need_install_ctags -eq -1 ]]; then
  echo 'Need INSTALL ctags'
  if [[ "$(uname)" == "Darwin" ]];then
  # Mac OS X 操作系统
    brew install ctags
  elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]];then
  # GNU/Linux操作系统
    apt-get install ctags
  elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" || "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]];then
  # Windows NT操作系统
    echo "Windows NT, please install ctags yourself !"
  fi
fi

echo "Install vim Plugin - Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Install vim Plugin - ctrlp"
git clone https://github.com/kien/ctrlp.vim.git       ~/.vim/bundle/ctrlp.vim

PLugin 'ctrlp.vim'

echo 'Install done ! Please enjoy Vim.'

