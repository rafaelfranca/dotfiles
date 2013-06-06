#!/bin/bash

function ss() {
  if [[ -a script/server ]]; then
    script/server $*
  elif [[ -a script/rails ]]; then
    bundle exec rails server $*
  else
    echo "Neither ./script/rails nor ./script/console found. Maybe this isn't a rails project?"
  fi
}
