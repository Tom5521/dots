#!/usr/bin/env bash

main() {
  path="$(xdg-user-dir PICTURES)/Screenshots/\
  $(date +"%d-%m-%Y %H:%M:%S").png"

  hyprshot -m region --raw >"$path"
  sleep 1 # Wait til' the data is moved to the file.

  # Operation cancelled.
  if [[ "$(stat -c "%s" "$path")" == "0" ]]; then
    rm "$path"
    return
  fi
  copyq write image/png - <"$path"
}

main
