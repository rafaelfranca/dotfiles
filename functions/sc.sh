function sc() {
  if [[ -a script/console ]]; then
    ruby script/console $*
  elif [[ -a script/rails ]]; then
    bundle exec rails console $*
  else
    echo "Neither ./script/rails nor ./script/console found. Maybe this isn't a rails project?"
  fi
}
