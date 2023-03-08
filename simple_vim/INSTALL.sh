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
  sudo apt-get install ctags
fi

echo 'install done!'
