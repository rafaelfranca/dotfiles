#!/bin/bash

function sg() {
  if [[ -a script/generate ]]; then
    ruby script/generate $*
  elif [[ -a script/rails ]]; then
    ruby script/rails g $*
  else
    echo "Neither ./script/rails nor ./script/console found. Maybe this isn't a rails project?"
  fi
}
