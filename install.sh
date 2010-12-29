#!/bin/bash

for found in ~/.dotfiles/dotfiles/*; do
  ln -fs $found ~/.$found
done
