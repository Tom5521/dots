#!/usr/bin/env bash

path="$(xdg-user-dir PICTURES)/Screenshots/\
  $(date +"%d-%m-%Y %H:%M:%S").png"

hyprshot -m region --raw >"$path"
copyq write image/png - <"$path"
