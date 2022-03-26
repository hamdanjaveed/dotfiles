#!/bin/bash

set -x
set -euf -o pipefail

ARGS=( "-t" "$HOME" )
while [[ $# -gt 0 ]]; do
  arg="$1"
  case "$arg" in
    -r|--restow)
    ARGS[2]="-R"
    ;;
  esac
  shift
done

# Common across all workspaces.
stow ${ARGS[@]} bash
stow ${ARGS[@]} nvim

# Multiple workspaces.

function stowBlockOrPersonal() {
  local work="block"
  if [ -d "$1/$work" ];
  then
    cd $1 && stow ${ARGS[@]} $work && cd ..
  else
    stow ${ARGS[@]} $1
  fi
}

stowBlockOrPersonal "git"
stowBlockOrPersonal "zsh"

