#!/bin/bash

for i in ~/.dotfiles/dotfiles/*; do
  echo "Installing $(basename $i)..."
  rm -rf ~/.$(basename $i)
  ln -s $i ~/.$(basename $i)
done

if [[ ! -d "$HOME/.vim" ]]; then
  echo "Installing vimfiles"
  git clone git://github.com/rafaelfranca/vimfiles.git $HOME/.vim
  cd $HOME/.vim && git submodule update --init
fi
