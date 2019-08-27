#!/bin/bash

cd `dirname $0`
cp vimrc ~/.vimrc -f

mkdir -p ~/tags
cp common_tags/* ~/tags

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

need_install_ctags=`echo $(whereis ctags) | awk -F':' '{print NF-1}'`

if [[ $need_install_ctags -eq 0 ]]; then
  echo 'Need INSTALL ctags'
  if [[ "$(uname)" == "Darwin" ]];then
  # Mac OS X 操作系统
    sudo brew install ctags
  elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]];then
  # GNU/Linux操作系统
    sudo apt-get install ctags
  elif [[ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" || "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]];then
  # Windows NT操作系统
    echo "Windows NT, please install ctags yourself !"
  fi
fi

cd ../

echo 'Install done ! Please enjoy Vim.'

