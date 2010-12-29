#!/bin/bash

for i in ~/.dotfiles/dotfiles/*; do
  rm -f ~/.$(basename $i)
  ln -s $i ~/.$(basename $i)
done
