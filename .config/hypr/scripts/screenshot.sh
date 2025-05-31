#!/usr/bin/env bash

hyprshot -m region --raw > \
  "$(xdg-user-dir PICTURES)/Screenshots/\
  $(date +"%d-%m-%Y %H:%M:%S").png"
