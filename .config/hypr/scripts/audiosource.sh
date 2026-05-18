#!/bin/bash

source ~/bash-libs/shared.sh

cd ~/config/hypr/scripts/
if [ ! -d "audiosource" ]; then
  git clone https://github.com/gdzx/audiosource.git || exit $?
fi

program=audiosource
cmd="$HOME/.config/hypr/scripts/audiosource/audiosource run"

toggle_program "$program" "$cmd"
