#!/usr/bin/env bash

flameshot $1

screenshot_path=$(xdg-user-dir PICTURES)/Screenshots/
cd "$screenshot_path" || exit 1
latest_file=$(ls --time birth | head -n 1)

copyq write image/png - <"$screenshot_path/$latest_file"
copyq select 0
