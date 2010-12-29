#!/bin/bash

function ss() {
  if [[ -a script/server ]]; then
    ruby script/server $*
  elif [[ -a script/rails ]]; then
    ruby script/rails server $*
  else
    echo "Neither ./script/rails nor ./script/console found. Maybe this isn't a rails project?"
  fi
}
