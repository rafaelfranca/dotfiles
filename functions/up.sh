#!/bin/bash

function up ()
{
  [[ $# -eq 0 ]] && cd ..
  if [[ $1 =~ ^[0-9]+$ ]] && [[ $1 -gt 0 ]]
  then
    dirs=1
    until [[ $dirs -gt $1 ]]
    do
      command="${command}../"
      dirs=$(($dirs+1))
    done
    cd $command
    command=''
  fi
}
