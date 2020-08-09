#!/usr/bin/bash
cd ~/.vim/bundle && git clone https://github.com/jceb/vim-orgmode.git
cd ~/.vim/bundle && git clone git://github.com/mattn/calendar-vim

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/speeddating.git
vim -u NONE -c "helptags speeddating/doc" -c q
